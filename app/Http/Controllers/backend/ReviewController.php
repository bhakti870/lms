<?php

namespace App\Http\Controllers\backend;

use App\Http\Controllers\Controller;
use App\Models\Review;
use App\Models\Course;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ReviewController extends Controller
{
    public function instructorReviews()
    {
        $instructor_id = Auth::id();
        
        // Get all courses of this instructor
        $course_ids = Course::where('instructor_id', $instructor_id)->pluck('id');
        
        // Get reviews for these courses
        $reviews = Review::whereIn('course_id', $course_ids)->with('course', 'user')->latest()->get();
        
        return view('backend.instructor.review.index', compact('reviews'));
    }

    public function updateReviewStatus(Request $request, $id)
    {
        $review = Review::findOrFail($id);
        $review->status = $request->status;
        $review->save();

        return back()->with('success', 'Review status updated successfully.');
    }

    public function deleteReview($id)
    {
        Review::findOrFail($id)->delete();
        return back()->with('success', 'Review deleted successfully.');
    }
}
