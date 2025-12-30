<?php

namespace App\Http\Controllers\frontend;

use App\Http\Controllers\Controller;
use App\Models\Review;
use App\Models\Enrollment;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ReviewController extends Controller
{
    public function storeReview(Request $request)
    {
        $request->validate([
            'course_id' => 'required',
            'rating' => 'required',
            'comment' => 'required',
        ]);

        $user_id = Auth::id();
        
        // Check if user is enrolled in the course
        $isEnrolled = Enrollment::where('user_id', $user_id)->where('course_id', $request->course_id)->exists();
        
        if (!$isEnrolled) {
            return back()->with('error', 'You must be enrolled in this course to leave a review.');
        }

        // Check if user already reviewed
        $exists = Review::where('user_id', $user_id)->where('course_id', $request->course_id)->exists();
        if ($exists) {
            return back()->with('error', 'You have already reviewed this course.');
        }

        $review = Review::create([
            'course_id' => $request->course_id,
            'user_id' => $user_id,
            'comment' => $request->comment,
            'rating' => $request->rating,
            'status' => 0, 
        ]);

        // Notify Instructor
        $instructor = $review->course->user;
        if ($instructor) {
            $instructor->notify(new \App\Notifications\UserReviewNotification($review));
        }

        return back()->with('success', 'Review submitted successfully! It will be visible after approval.');
    }

    public function fetchReviews($course_id)
    {
        $reviews = Review::with('user')
            ->where('course_id', $course_id)
            ->where('status', 1)
            ->latest()
            ->get();
            
        $reviews->each(function($r) {
            $r->user->image = !empty($r->user->photo) ? url($r->user->photo) : url('frontend/images/small-avatar-1.jpg');
        });

        return response()->json(['reviews' => $reviews]);
    }
}
