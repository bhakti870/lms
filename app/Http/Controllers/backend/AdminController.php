<?php

namespace App\Http\Controllers\backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Http\RedirectResponse;
use Illuminate\Support\Facades\Auth;

class AdminController extends Controller
{
    public function login()
    {

        return view('backend.admin.login.index');
    }

    public function dashboard()
    {
        $total_orders = \App\Models\Order::count();
        $total_revenue = \App\Models\Payment::where('status', 'completed')->sum('total_amount');
        $total_courses = \App\Models\Course::count();
        $total_instructors = \App\Models\User::where('role', 'instructor')->count();
        $total_students = \App\Models\User::where('role', 'user')->count();
        $recent_orders = \App\Models\Order::latest()->limit(10)->get();

        return view('backend.admin.dashboard.index', compact('total_orders', 'total_revenue', 'total_courses', 'total_instructors', 'total_students', 'recent_orders'));
    }

    public function loginStore(Request $request): RedirectResponse
    {
        $credentials = $request->validate([
            'email' => ['required', 'email'],
            'password' => ['required'],
        ]);

        if (Auth::attempt($credentials, $request->boolean('remember'))) {
            $user = Auth::user();
            
            // Check if user is admin
            if ($user->role !== 'admin') {
                Auth::logout();
                return back()->withErrors([
                    'email' => 'You are not authorized to access admin panel.',
                ])->onlyInput('email');
            }

            // Check if user is banned
            if ($user->status === '0') {
                Auth::logout();
                return back()->withErrors([
                    'email' => 'Your account is banned. Please contact support.',
                ])->onlyInput('email');
            }

            $request->session()->regenerate();
            return redirect()->intended('/admin/dashboard');
        }

        return back()->withErrors([
            'email' => 'The provided credentials do not match our records.',
        ])->onlyInput('email');
    }

    public function markAllAsRead()
    {
        auth()->user()->unreadNotifications->markAsRead();
        return response()->json(['success' => true]);
    }

    public function destroy(Request $request): RedirectResponse
    {
        Auth::guard('web')->logout();

        $request->session()->invalidate();

        $request->session()->regenerateToken();

        return redirect('/admin/login');
    }
}
