<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\Category;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class InstructorController extends Controller
{
    public function index(Request $request)
    {
        $query = User::where('role', 'instructor')->where('status', '1');

        // Filtering by Category
        if ($request->has('category') && $request->category != '') {
            $query->whereHas('courses', function($q) use ($request) {
                $q->where('category_id', $request->category);
            });
        }

        // Filtering by Experience
        if ($request->has('experience') && $request->experience != '') {
            $query->where('experience', 'LIKE', '%' . $request->experience . '%');
        }

        // Filtering by Rating (Average course rating)
        if ($request->has('rating') && $request->rating != '') {
            $query->whereHas('courses', function($q) use ($request) {
                $q->join('reviews', 'courses.id', '=', 'reviews.course_id')
                  ->where('reviews.status', 1)
                  ->groupBy('courses.instructor_id')
                  ->havingRaw('AVG(reviews.rating) >= ?', [$request->rating]);
            });
        }

        $instructors = $query->withCount('courses')->paginate(12);

        // Calculate average rating for each instructor for display
        foreach ($instructors as $instructor) {
            $courseIds = $instructor->courses->pluck('id');
            $avgRating = \App\Models\Review::whereIn('course_id', $courseIds)
                        ->where('status', 1)
                        ->avg('rating');
            $instructor->avg_rating = round($avgRating ?? 0, 1);
        }
        $categories = Category::latest()->get();

        return view('frontend.instructor.index', compact('instructors', 'categories'));
    }

    public function instructorDetails($id)
    {
        $instructor = User::where('role', 'instructor')->where('status', '1')->findOrFail($id);
        $courses = $instructor->courses()->where('status', 1)->get();
        
        return view('frontend.instructor.details', compact('instructor', 'courses'));
    }
}
