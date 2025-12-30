<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\Auth;

class CheckCourseAccess
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {
        $courseId = $request->route('course_id') ?? $request->input('course_id');

        if (!$courseId) {
            return $next($request);
        }

        if (!Auth::check()) {
            if ($request->expectsJson()) {
                return response()->json(['error' => 'Please login to access this course.'], 401);
            }
            return redirect()->route('login')->with('error', 'Please login to access this course.');
        }

        $user = Auth::user();

        // Admin and instructors (if it's their course) always have access
        if ($user->role === 'admin') {
            return $next($request);
        }

        // Check enrollment
        if (!$user->isEnrolled($courseId)) {
            // Check if it's an instructor viewing their own course
            $course = \App\Models\Course::find($courseId);
            if ($course && $user->role === 'instructor' && $course->instructor_id === $user->id) {
                return $next($request);
            }

            if ($request->expectsJson()) {
                return response()->json(['error' => 'You must enroll in this course to access the content.'], 403);
            }
            return redirect()->route('course-details', $course->slug ?? '')->with('error', 'You must enroll in this course to access the content.');
        }

        return $next($request);
    }
}
