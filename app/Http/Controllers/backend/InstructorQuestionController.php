<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\CourseQuestion;
use Illuminate\Support\Facades\Auth;
use App\Models\Course;


class InstructorQuestionController extends Controller
{
    public function index()
    {
        // Fetch questions from courses that belong to the logged-in instructor
        $instructorId = Auth::id();
        
        $questions = CourseQuestion::whereHas('course', function($q) use ($instructorId) {
                $q->where('instructor_id', $instructorId);
            })
            ->whereNull('parent_id') 
            ->with(['course', 'user', 'replies'])
            ->latest()
            ->get();

        return view('backend.instructor.question.index', compact('questions'));
    }

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
    
    public function show($id)
    {
        $question = CourseQuestion::with(['course', 'user', 'replies.user'])->findOrFail($id);
        
        // Ensure this question belongs to a course owned by the instructor
        if ($question->course->instructor_id !== Auth::id()) {
            abort(403, 'Unauthorized action.');
        }

        return view('backend.instructor.question.show', compact('question'));
    }

    public function reply(Request $request, $id)
    {
         $request->validate(['reply' => 'required']);

         $parent = CourseQuestion::findOrFail($id);
         
         if ($parent->course->instructor_id !== Auth::id()) {
             abort(403);
         }

         CourseQuestion::create([
             'course_id' => $parent->course_id,
             'lecture_id' => $parent->lecture_id,
             'user_id' => Auth::id(),
             'parent_id' => $id,
             'question' => $request->reply,
             'is_instructor_reply' => true
         ]);

         $notification = array(
             'message' => 'Reply posted successfully',
             'alert-type' => 'success'
         );
 
         return redirect()->back()->with($notification);
    }
}
