<?php

namespace App\Http\Controllers\frontend;

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

        // Filtering by Category (supports multiple)
        if ($request->filled('categories')) {
            $query->whereHas('courses', function($q) use ($request) {
                $q->whereIn('category_id', $request->categories);
            });
        }

        // Filtering by Experience
        if ($request->filled('experience')) {
            $query->where('experience', 'LIKE', '%' . $request->experience . '%');
        }

        // Filtering by Rating (Average course rating)
        if ($request->filled('rating')) {
            $rating = $request->rating;
            $query->whereHas('courses', function($q) use ($rating) {
                $q->join('reviews', 'courses.id', '=', 'reviews.course_id')
                  ->where('reviews.status', 1)
                  ->groupBy('courses.instructor_id')
                  ->havingRaw('AVG(reviews.rating) >= ?', [$rating]);
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
            
            // Calculate review count
            $instructor->review_count = \App\Models\Review::whereIn('course_id', $courseIds)
                        ->where('status', 1)
                        ->count();
        }
        
        // Get categories with instructor count (approximation: categories that have courses by active instructors)
        // A more accurate way might be complex, so we'll fetch all categories and manually count or simply list them.
        // For sidebar, standard practice is Category::withCount('courses'). 
        // But for instructors, it's "Instructors in Category". 
        // We'll stick to listing categories. 
        $categories = Category::orderBy('name', 'asc')->get();

        return view('frontend.instructor.index', compact('instructors', 'categories'));
    }

    public function instructorDetails($id)
    {
        $instructor = User::where('role', 'instructor')->where('status', '1')->findOrFail($id);
        $courses = $instructor->courses()->where('status', 1)->get();
        
        return view('frontend.instructor.details', compact('instructor', 'courses'));
    }
}
