<?php

namespace App\Http\Controllers\backend;

use App\Models\Enrollment;
use App\Models\QuizResult;
use App\Models\CourseProgress;
use App\Models\Course;
use App\Models\Order;
use App\Models\Wishlist;
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
