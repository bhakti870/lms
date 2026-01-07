<?php

namespace App\Http\Controllers\frontend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Course;
use App\Models\CourseLecture;
use App\Models\Quiz;
use App\Models\CourseMaterial;
use App\Models\CourseProgress;
use App\Models\QuizResult;
use App\Models\Certificate;
use Illuminate\Support\Facades\Auth;
use Carbon\Carbon;

class CourseDeliveryController extends Controller
{
    public function __construct()
    {
        $this->middleware(['auth', 'course.access']);
    }

 
    public function learn($course_id)
    {
        $course = Course::with(['sections.lectures', 'sections.quizzes', 'sections.materials'])
            ->findOrFail($course_id);
        
        $user_id = Auth::id();
        
        // Drip Content Logic & Access Check
        $enrollment = \App\Models\Enrollment::where('user_id', $user_id)
                        ->where('course_id', $course_id)
                        ->where('status', 'active')
                        ->first();
                        
        $daysSinceEnrollment = $enrollment ? \Carbon\Carbon::parse($enrollment->enrolled_at)->diffInDays(now()) : 0;

        foreach($course->sections as $section) {
            foreach($section->lectures as $lecture) {
                if ($lecture->drip_days > $daysSinceEnrollment) {
                    $lecture->is_locked = true;
                    $lecture->unlock_date = \Carbon\Carbon::parse($enrollment->enrolled_at)->addDays($lecture->drip_days)->format('d M Y');
                } else {
                    $lecture->is_locked = false;
                }
            }
        }
        
        // Get user progress
        $progress = CourseProgress::where('user_id', $user_id)
            ->where('course_id', $course_id)
            ->get()
            ->groupBy('content_type');

        // Get saved notes
        $notes = \App\Models\CourseNote::where('user_id', $user_id)->where('course_id', $course_id)->get()->groupBy('lecture_id');

        // Find the first incomplete lesson to show
        $currentContent = $this->getResumeContent($course, $user_id);
        
        // PRE-RENDER initial content for faster first load
        $initialHtml = '';
        $initialTitle = '';
        if($currentContent) {
            $type = $currentContent['type'];
            $id = $currentContent['id'];
            
            if ($type === 'lecture') {
                $content = CourseLecture::find($id);
            } elseif ($type === 'quiz') {
                $content = Quiz::with('questions')->find($id);
                $previousResult = QuizResult::where('user_id', $user_id)->where('quiz_id', $id)->latest()->first();
                if($content) $content->previous_result = $previousResult;
            } elseif ($type === 'material') {
                $content = CourseMaterial::find($id);
            }

            if($content) {
                $initialHtml = view('frontend.course.partials.content_view', compact('type', 'content', 'course'))->render();
                $initialTitle = $content->lecture_title ?? $content->quiz_title ?? $content->material_title;
            }
        }

        return view('frontend.course.learn', compact('course', 'progress', 'currentContent', 'notes', 'initialHtml', 'initialTitle'));
    }

    public function getContent($course_id, $type, $id)
    {
        $user_id = Auth::id();
        $content = null;

        if ($type === 'lecture') {
            $content = CourseLecture::findOrFail($id);
            
            // Check Drip Lock
            $enrollment = \App\Models\Enrollment::where('user_id', $user_id)->where('course_id', $course_id)->first();
            $days = $enrollment ? \Carbon\Carbon::parse($enrollment->enrolled_at)->diffInDays(now()) : 0;
            
            if ($content->drip_days > $days) {
                return response()->json(['error' => 'Content is locked until ' . \Carbon\Carbon::parse($enrollment->enrolled_at)->addDays($content->drip_days)->format('d M Y')], 403);
            }

        } elseif ($type === 'quiz') {
            $content = Quiz::with('questions')->findOrFail($id);
            $previousResult = QuizResult::where('user_id', $user_id)->where('quiz_id', $id)->latest()->first();
            $content->previous_result = $previousResult;
        } elseif ($type === 'material') {
            $content = CourseMaterial::findOrFail($id);
            // $this->markAsCompleted($user_id, $course_id, 'material', $id); // Removed auto-complete
        }

        $course = Course::find($course_id);
        
        $isCompleted = \App\Models\CourseProgress::where('user_id', $user_id)
            ->where('course_id', $course_id)
            ->where('content_type', $type)
            ->where('content_id', $id)
            ->where('is_completed', true)
            ->exists();

        return response()->json([
            'html' => view('frontend.course.partials.content_view', compact('type', 'content', 'course'))->render(),
            'title' => $content->lecture_title ?? $content->quiz_title ?? $content->material_title,
            'is_completed' => $isCompleted
        ]);
    }

    public function saveNote(Request $request)
    {
        $request->validate([
            'course_id' => 'required',
            'lecture_id' => 'required',
            'note' => 'required',
            'timestamp' => 'nullable|numeric'
        ]);
        
        \App\Models\CourseNote::create([
            'user_id' => Auth::id(),
            'course_id' => $request->course_id,
            'lecture_id' => $request->lecture_id,
            'note' => $request->note,
            'timestamp_seconds' => $request->timestamp
        ]);
        
        return response()->json(['success' => true]);
    }
    
    public function downloadCertificate($course_id)
    {
        $user_id = Auth::id();
        $certificate = Certificate::where('user_id', $user_id)->where('course_id', $course_id)->firstOrFail();
        $course = Course::findOrFail($course_id);
        $user = Auth::user();
        
        return view('frontend.course.certificate', compact('certificate', 'course', 'user'));
    }

    /**
     * AJAX: Save progress when a lecture is finished or quiz passed
     */
    public function saveProgress(Request $request)
    {
        $request->validate([
            'course_id' => 'required',
            'content_type' => 'required|in:lecture,quiz,material',
            'content_id' => 'required'
        ]);

        $this->markAsCompleted(Auth::id(), $request->course_id, $request->content_type, $request->content_id);

        // Check if course is completed
        $isFinished = $this->checkCourseCompletion($request->course_id);

        return response()->json([
            'success' => true,
            'completed' => true,
            'course_finished' => $isFinished
        ]);
    }

    /**
     * Submit Quiz and return results with explanations
     */
    public function submitQuiz(Request $request)
    {
        $quiz = Quiz::with('questions')->findOrFail($request->quiz_id);
        $user_id = Auth::id();
        $answers = $request->answers ?? []; 
        
        $totalQuestions = $quiz->questions->count();
        $correctCount = 0;
        $resultsDetail = [];

        $wrongCount = 0;

        foreach ($quiz->questions as $question) {
            $selected = $answers[$question->id] ?? null;
            
            $isCorrect = false;
            if ($selected !== null) {
                $isCorrect = (trim(strtolower($selected)) === trim(strtolower($question->correct_answer)));
                if (!$isCorrect) {
                     $wrongCount++;
                }
            }
            
            if ($isCorrect) $correctCount++;

            $resultsDetail[] = [
                'question' => $question->question_text,
                'selected' => $selected,
                'correct' => $question->correct_answer,
                'is_correct' => $isCorrect,
                'explanation' => $question->explanation,
                'options' => [
                    'a' => $question->option_a,
                    'b' => $question->option_b,
                    'c' => $question->option_c,
                    'd' => $question->option_d,
                ]
            ];
        }

        $score = 0;
        if ($totalQuestions > 0) {
            if ($quiz->negative_marking_status) {
                $rawScore = $correctCount - ($wrongCount * $quiz->negative_marks);
                if ($rawScore < 0) $rawScore = 0;
                $score = ($rawScore / $totalQuestions) * 100;
            } else {
                $score = ($correctCount / $totalQuestions) * 100;
            }
        }

        $isPass = $score >= $quiz->pass_mark;

        // Save Result
        $result = QuizResult::create([
            'user_id' => $user_id,
            'quiz_id' => $quiz->id,
            'total_questions' => $totalQuestions,
            'correct_answers' => $correctCount,
            'score' => $score,
            'is_pass' => $isPass,
            'completed_at' => now(),
        ]);

        if ($isPass) {
            $this->markAsCompleted($user_id, $quiz->course_id, 'quiz', $quiz->id);
        } else {
            // Notify Low Score
            Auth::user()->notify(new \App\Notifications\UserNotification([
                'title' => 'Low Quiz Score',
                'message' => 'You scored ' . round($score, 2) . '% in ' . $quiz->quiz_title . '. Revise the lessons and try again!',
                'link' => route('user.course.learn', $quiz->course_id),
                'type' => 'quiz',
                'icon' => 'bi-exclamation-triangle-fill',
                'color' => 'warning',
            ]));
        }

        return response()->json([
            'quiz_id' => $quiz->id,
            'score' => round($score, 2),
            'is_pass' => $isPass,
            'details' => $resultsDetail,
            'total_questions' => $totalQuestions,
            'correct_count' => $correctCount,
            'wrong_count' => $wrongCount,
            'negative_marking' => $quiz->negative_marking_status,
            'negative_mark_value' => $quiz->negative_marks,
            'course_finished' => $this->checkCourseCompletion($quiz->course_id),
            'debug' => [
                'received_answers' => $answers,
                'quiz_questions' => $quiz->questions->map(fn($q) => ['id' => $q->id, 'correct_answer' => $q->correct_answer])
            ]
        ]);
    }

    /**
     * Internal: Mark content as completed
     */
    private function markAsCompleted($user_id, $course_id, $type, $id)
    {
        $exists = CourseProgress::where([
            'user_id' => $user_id,
            'course_id' => $course_id,
            'content_type' => $type,
            'content_id' => $id
        ])->exists();

        CourseProgress::updateOrCreate(
            [
                'user_id' => $user_id,
                'course_id' => $course_id,
                'content_type' => $type,
                'content_id' => $id
            ],
            [
                'is_completed' => true,
                'completed_at' => now()
            ]
        );

        if (!$exists) {
            $course = Course::find($course_id);
            $title = '';
            if ($type == 'lecture') $title = \App\Models\CourseLecture::find($id)->lecture_title;
            if ($type == 'quiz') $title = \App\Models\Quiz::find($id)->quiz_title;
            if ($type == 'material') $title = \App\Models\CourseMaterial::find($id)->material_title;

            Auth::user()->notify(new \App\Notifications\UserNotification([
                'title' => 'Lesson Completed! 🎉',
                'message' => 'Great job! You completed: ' . $title,
                'link' => route('user.course.learn', $course_id),
                'type' => 'course',
                'icon' => 'bi-check-circle-fill',
                'color' => 'success',
            ]));
        }
    }
    
    private function checkCourseCompletion($course_id)
    {
        $course = Course::with(['lectures', 'quizzes', 'materials'])->find($course_id);
        $user_id = Auth::id();

        $totalItems = $course->lectures->count() + $course->quizzes->count() + $course->materials->count();
        $completedItems = CourseProgress::where('user_id', $user_id)
            ->where('course_id', $course_id)
            ->where('is_completed', true)
            ->count();

        // 99% progress is enough to safeguard against small mismatches, or enforce 100%
        if ($totalItems > 0 && $completedItems >= $totalItems) {
            $this->generateCertificate($user_id, $course_id);
            return true;
        }

        return false;
    }

    private function generateCertificate($user_id, $course_id)
    {
        if (!Certificate::where('user_id', $user_id)->where('course_id', $course_id)->exists()) {
            Certificate::create([
                'user_id' => $user_id,
                'course_id' => $course_id,
                'certificate_number' => 'CERT-' . strtoupper(uniqid()),
                'issued_at' => now(),
            ]);

            $course = Course::find($course_id);
            Auth::user()->notify(new \App\Notifications\UserNotification([
                'title' => 'Course Completed! 🎓',
                'message' => 'Congratulations! You have completed the full course: ' . $course->course_name . '. Your certificate is ready!',
                'link' => route('user.dashboard'),
                'type' => 'course',
                'icon' => 'bi-trophy-fill',
                'color' => 'success',
            ]));
        }
    }

    private function getResumeContent($course, $user_id)
    {
        $completedIds = CourseProgress::where('user_id', $user_id)
            ->where('course_id', $course->id)
            ->where('is_completed', true)
            ->get()
            ->groupBy('content_type');

        foreach ($course->sections as $section) {
            // Check Lectures
            foreach ($section->lectures as $lecture) {
                if (!isset($completedIds['lecture']) || !$completedIds['lecture']->contains('content_id', $lecture->id)) {
                    return ['type' => 'lecture', 'id' => $lecture->id];
                }
            }
            // Check Quizzes
            foreach ($section->quizzes as $quiz) {
                if (!isset($completedIds['quiz']) || !$completedIds['quiz']->contains('content_id', $quiz->id)) {
                    return ['type' => 'quiz', 'id' => $quiz->id];
                }
            }
            // Check Materials
            foreach ($section->materials as $material) {
                if (!isset($completedIds['material']) || !$completedIds['material']->contains('content_id', $material->id)) {
                    return ['type' => 'material', 'id' => $material->id];
                }
            }
        }

        // Fallback to first lecture if all completed
        $firstLecture = $course->sections->first()?->lectures?->first();
        return $firstLecture ? ['type' => 'lecture', 'id' => $firstLecture->id] : null;
    }
}
