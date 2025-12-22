<?php

namespace App\Http\Controllers\frontend;

use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\Course;
use App\Models\CourseLecture;
use App\Models\CourseSection;
use App\Models\InfoBox;
use App\Models\Slider;
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

        return view('frontend.index', compact('all_sliders', 'all_info', 'all_categories', 'categories', 'course_category'));
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
        if (Auth::check()) {
            $is_enrolled = \App\Models\Enrollment::where('user_id', Auth::id())
                ->where('course_id', $course->id)
                ->where('status', 'active')
                ->exists();
        }

        return view('frontend.pages.course-details.index', compact('course', 'total_lecture', 'course_content', 'similarCourses', 'all_category', 'more_course_instructor', 'total_minutes', 'total_lecture_duration', 'is_enrolled'));
    }

    public function allCourses()
    {
        $courses = Course::with('user', 'category')->paginate(12);
        return view('frontend.course.index', compact('courses'));
    }
}
