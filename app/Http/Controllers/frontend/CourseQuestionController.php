<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\CourseQuestion;
use Illuminate\Support\Facades\Auth;
use App\Models\Course;

class CourseQuestionController extends Controller
{
    public function fetchQuestions($lecture_id)
    {
        $questions = CourseQuestion::with(['user', 'replies.user'])
            ->where('lecture_id', $lecture_id)
            ->whereNull('parent_id')
            ->latest()
            ->get();
            
        // Process images for JS
        $questions->each(function($q) {
            $q->user->image = !empty($q->user->photo) ? url($q->user->photo) : url('frontend/images/small-avatar-1.jpg');
            $q->replies->each(function($r) {
                $r->user->image = !empty($r->user->photo) ? url($r->user->photo) : url('frontend/images/small-avatar-1.jpg');
            });
        });

        return response()->json(['questions' => $questions]);
    }

    public function store(Request $request)
    {
        $request->validate([
            'course_id' => 'required',
            'question' => 'required',
        ]);

        $questionRecord = CourseQuestion::create([
            'course_id' => $request->course_id,
            'lecture_id' => $request->lecture_id,
            'user_id' => Auth::id(),
            'question' => $request->question,
        ]);

        // Load relationships for notification
        $questionRecord->load(['user', 'course']);

        // Send notification to instructor
        $course = $questionRecord->course;
        if ($course && $course->instructor_id) {
            $instructor = \App\Models\User::find($course->instructor_id);
            if ($instructor) {
                $instructor->notify(new \App\Notifications\QuestionNotification($questionRecord));
            }
        }

        return response()->json(['success' => true]);
    }

    public function reply(Request $request)
    {
        $request->validate([
            'question' => 'required',
            'parent_id' => 'required'
        ]);

        // Check if instructor
        $course = Course::find($request->course_id);
        $isInstructor = false;
        
        if ($course && $course->instructor_id == Auth::id()) {
            $isInstructor = true;
        } else if (Auth::user()->role === 'admin') {
             $isInstructor = true;
        }

        $replyRecord = CourseQuestion::create([
            'course_id' => $request->course_id,
            'lecture_id' => $request->lecture_id,
            'user_id' => Auth::id(),
            'parent_id' => $request->parent_id,
            'question' => $request->question,
            'is_instructor_reply' => $isInstructor,
        ]);

        // If it's a student reply, notify instructor
        if (!$isInstructor && $course && $course->instructor_id) {
            $replyRecord->load(['user', 'course']);
            $instructor = \App\Models\User::find($course->instructor_id);
            if ($instructor) {
                $instructor->notify(new \App\Notifications\QuestionNotification($replyRecord));
            }
        }

        return response()->json(['success' => true]);
    }
}
