<?php

namespace App\Http\Controllers\frontend;

use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\Course;
use App\Models\CourseLecture;
use App\Models\CourseSection;
use App\Models\SubCategory;
use App\Models\InfoBox;
use App\Models\Slider;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class FrontendDashboardController extends Controller
{
    public function home()
    {

        $all_sliders = Slider::all();
        $all_info = InfoBox::all();

        $all_categories = Category::inRandomOrder()->limit(6)->get();
        $categories = Category::all();
        $course_category = Category::with('course', 'course.user', 'course.course_goal')->get();

        // New dynamic data for Hero Section
        $top_instructors = User::where('role', 'instructor')
            ->where('status', '1')
            ->whereNotNull('photo')
            ->limit(4)
            ->get();

        $active_learners_count = User::where('role', 'user')->count();
        $learner_avatars = User::where('role', 'user')
            ->whereNotNull('photo')
            ->limit(3)
            ->get();

        $instructors_count = User::where('role', 'instructor')->where('status', '1')->count();

        // Testimonials from Reviews
        $reviews = \App\Models\Review::where('status', 1)
            ->where('rating', '>=', 4)
            ->with('user')
            ->latest()
            ->limit(5)
            ->get();

        $courses_count = Course::where('status', '1')->count();
        $countries_count = User::distinct('country')->whereNotNull('country')->where('role', 'user')->count('country');
        $average_rating = \App\Models\Review::where('status', 1)->avg('rating');

        // Featured Courses (for "Students are viewing" section)
        $featured_courses = Course::where('status', '1')
            ->with(['user', 'category', 'reviews'])
            ->inRandomOrder()
            ->limit(6)
            ->get();

        return view('frontend.index', compact(
            'all_sliders',
            'all_info',
            'all_categories',
            'categories',
            'course_category',
            'top_instructors',
            'active_learners_count',
            'learner_avatars',
            'instructors_count',
            'reviews',
            'courses_count',
            'countries_count',
            'average_rating',
            'featured_courses'
        ));
    }

    public function view($slug)
    {
        // Strip .html suffix if present
        $slug = preg_replace('/\.html$/', '', $slug);

        $course = Course::where('course_name_slug', $slug)->with('category', 'subcategory', 'user', 'quizzes', 'materials', 'lectures')->firstOrFail();

        $total_lecture = CourseLecture::where('course_id', $course->id)->count();
        $course_content = CourseSection::where('course_id', $course->id)
            ->with(['lectures', 'quizzes.questions', 'materials'])
            ->orderBy('display_order')
            ->get();

        // Get the currently authenticated user's ID
        $userId = Auth::id();

        // Fetch similar courses but exclude those already ordered by the student
        $similarCourses = Course::where('category_id', $course->category_id)
            ->where('id', '!=', $course->id)->get();

        $all_category = Category::orderBy('name', 'asc')->get();

        //more course instructor
        $more_course_instructor = Course::where('instructor_id', $course->instructor_id)->where('id', '!=', $course->id)->with('user')->get();

        $total_minutes = CourseLecture::where('course_id', $course->id)->sum('video_duration');

        $hours = floor($total_minutes / 60);
        $minutes = floor($total_minutes % 60);
        $seconds = round(($total_minutes - floor($total_minutes)) * 60);

        $total_lecture_duration = sprintf('%02d:%02d:%02d', $hours, $minutes, $seconds);

        $is_enrolled = false;
        $is_completed = false;
        if (Auth::check()) {
            $is_enrolled = \App\Models\Enrollment::where('user_id', Auth::id())
                ->where('course_id', $course->id)
                ->where('status', 'active')
                ->exists();

            if ($is_enrolled) {
                // Check if user has certificate or all lessons completed
                $is_completed = \App\Models\Certificate::where('user_id', Auth::id())
                    ->where('course_id', $course->id)
                    ->exists();

                if (!$is_completed) {
                    $totalLessons = CourseLecture::where('course_id', $course->id)->count() +
                        \App\Models\Quiz::where('course_id', $course->id)->count() +
                        \App\Models\CourseMaterial::where('course_id', $course->id)->count();

                    $completedLessons = \App\Models\CourseProgress::where('user_id', Auth::id())
                        ->where('course_id', $course->id)
                        ->where('is_completed', true)
                        ->count();

                    if ($totalLessons > 0 && $completedLessons >= $totalLessons) {
                        $is_completed = true;
                    }
                }
            }
        }

        return view('frontend.pages.course-details.index', compact('course', 'total_lecture', 'course_content', 'similarCourses', 'all_category', 'more_course_instructor', 'total_minutes', 'total_lecture_duration', 'is_enrolled', 'is_completed'));
    }

    public function allCourses(Request $request)
    {
        $query = Course::where('status', 1)->with('user', 'category');

        if ($request->filled('categories')) {
            $query->whereIn('category_id', $request->categories);
        }

        if ($request->filled('instructors')) {
            $query->whereIn('instructor_id', $request->instructors);
        }

        if ($request->filled('price')) {
            if ($request->price == 'free') {
                $query->where('selling_price', 0);
            } elseif ($request->price == 'paid') {
                $query->where('selling_price', '>', 0);
            }
        }

        $courses = $query->paginate(12);
        $categories = Category::withCount('course')->get();
        $instructors = User::where('role', 'instructor')->withCount('courses')->get();

        return view('frontend.course.index', compact('courses', 'categories', 'instructors'));
    }

    public function categoryDetails($slug)
    {
        $category = Category::where('slug', $slug)->firstOrFail();
        $courses = Course::where('category_id', $category->id)
            ->where('status', 1)
            ->with(['user', 'category'])
            ->paginate(12);
        $categories = Category::withCount('course')->get();
        $instructors = User::where('role', 'instructor')->withCount('courses')->get();

        return view('frontend.course.index', compact('courses', 'category', 'categories', 'instructors'));
    }

    public function subcategoryDetails($slug)
    {
        $subcategory = Subcategory::where('slug', $slug)->firstOrFail();
        $courses = Course::where('subcategory_id', $subcategory->id)
            ->where('status', 1)
            ->with(['user', 'category'])
            ->paginate(12);
        $categories = Category::withCount('course')->get();
        $instructors = User::where('role', 'instructor')->withCount('courses')->get();

        return view('frontend.course.index', compact('courses', 'subcategory', 'categories', 'instructors'));
    }
}
