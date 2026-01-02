<?php

namespace App\Http\Controllers\backend;

use App\Models\Enrollment;
use App\Models\QuizResult;
use App\Models\CourseProgress;
use App\Models\Course;
use App\Models\Order;
use App\Models\Wishlist;
use App\Models\Certificate;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Http\RedirectResponse;
use Illuminate\Support\Facades\Auth;

class UserController extends Controller
{
    public function dashboard(){
        $id = Auth::user()->id;
        $user = Auth::user();
        $enrolledCourses = Enrollment::where('user_id', $id)->count();
        $wishlistCount = Wishlist::where('user_id', $id)->count();
        $totalPurchase = Order::where('user_id', $id)->sum('price');
        
        $recentNotifications = $user->notifications()->take(5)->get();
        
        // Clear success messages if they exist to prevent repeats in Turbo navigation
        session()->forget('purchase_success');

        return view('frontend.dashboard.index', compact('enrolledCourses', 'wishlistCount', 'totalPurchase', 'recentNotifications'));
    }

    public function notifications() {
        $notifications = Auth::user()->notifications()->paginate(10);
        return view('frontend.dashboard.notifications', compact('notifications'));
    }

    public function markNotificationAsRead($id) {
        $notification = Auth::user()->notifications()->where('id', $id)->first();
        if ($notification) {
            $notification->markAsRead();
        }
        return redirect()->back()->with('success', 'Notification marked as read');
    }

    public function markAllNotificationsAsRead() {
        Auth::user()->unreadNotifications->markAsRead();
        return redirect()->back()->with('success', 'All notifications marked as read');
    }

    public function deleteNotification($id) {
        $notification = Auth::user()->notifications()->where('id', $id)->first();
        if ($notification) {
            $notification->delete();
        }
        return redirect()->back()->with('success', 'Notification deleted successfully');
    }

    public function deleteAllNotifications() {
        Auth::user()->notifications()->delete();
        return redirect()->back()->with('success', 'All notifications cleared');
    }

    public function purchaseHistory(){
        $id = Auth::user()->id;
        $courses = Enrollment::where('user_id', $id)->with('course')->get();
        
        // Clear success messages
        session()->forget('purchase_success');

        return view('frontend.dashboard.purchase_history', compact('courses'));
    }

    public function leaderboard() {
        // Top 10 users by total quiz score
        // We assume 'quizResults' relationship is set up on User model
        $leaders = \App\Models\User::withSum('quizResults', 'score')
            ->orderByDesc('quiz_results_sum_score')
            ->take(10)
            ->get();
            
        return view('frontend.dashboard.leaderboard', compact('leaders'));
    }

    public function certificates() {
        $id = Auth::user()->id;
        
        // 1. Earned Certificates
        $certificates = Certificate::where('user_id', $id)->with('course')->get();
        
        // 2. Earnable Certificates (Enrolled courses not yet earned)
        $earnedCourseIds = $certificates->pluck('course_id')->toArray();
        
        $earnableCourses = Enrollment::where('user_id', $id)
            ->whereNotIn('course_id', $earnedCourseIds)
            ->where('status', 'active')
            ->with(['course' => function($q) {
                // Ensure we get counts for progress calculation
                $q->withCount(['lectures', 'quizzes', 'materials']);
            }])
            ->get();
            
        // Calculate progress for each earnable course
        foreach ($earnableCourses as $enrollment) {
            $course = $enrollment->course;
            if (!$course) continue;

            $totalItems = $course->lectures_count + $course->quizzes_count + $course->materials_count;
            
            $completedItems = CourseProgress::where('user_id', $id)
                ->where('course_id', $enrollment->course_id)
                ->where('is_completed', true)
                ->count();
                
            $enrollment->progress_percent = ($totalItems > 0) ? min(100, round(($completedItems / $totalItems) * 100)) : 0;
            $enrollment->completed_items = $completedItems;
            $enrollment->total_items = $totalItems;

            // Trigger certificate generation if 100% (syncing)
            if ($enrollment->progress_percent >= 100 && $totalItems > 0) {
                 $this->syncCertificateRecord($id, $enrollment->course_id);
            }
        }

        // Re-fetch certificates in case some were just generated
        $certificates = Certificate::where('user_id', $id)->with('course')->get();
        // Filter out earneable courses that just became earned
        $earnedCourseIds = $certificates->pluck('course_id')->toArray();
        $earnableCourses = $earnableCourses->reject(function($e) use ($earnedCourseIds) {
            return in_array($e->course_id, $earnedCourseIds);
        });

        return view('frontend.dashboard.certificates', compact('certificates', 'earnableCourses'));
    }

    private function syncCertificateRecord($user_id, $course_id)
    {
        if (!Certificate::where('user_id', $user_id)->where('course_id', $course_id)->exists()) {
            Certificate::create([
                'user_id' => $user_id,
                'course_id' => $course_id,
                'certificate_number' => 'CERT-' . strtoupper(uniqid()),
                'issued_at' => now(),
            ]);
        }
    }
    
    public function downloadInvoice($id) {
        // Ensure user owns this payment via orders
        $payment = \App\Models\Payment::where('id', $id)
                    ->whereHas('orders', function($q) {
                        $q->where('user_id', Auth::id());
                    })
                    ->with('orders')
                    ->firstOrFail();

        return view('frontend.dashboard.invoice', compact('payment'));
    }

    public function destroy(Request $request): RedirectResponse
    {
        Auth::guard('web')->logout();

        $request->session()->invalidate();

        $request->session()->regenerateToken();

        return redirect('/login');
    }

    public function removeCourse($id)
    {
        $enrollment = Enrollment::where('user_id', Auth::id())->where('id', $id)->firstOrFail();
        $enrollment->delete();

        return redirect()->back()->with('success', 'Course removed from your enrollment successfully.');
    }
}
