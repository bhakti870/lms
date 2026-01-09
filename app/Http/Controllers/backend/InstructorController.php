<?php

namespace App\Http\Controllers\backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Http\RedirectResponse;
use Illuminate\Support\Facades\Auth;

class InstructorController extends Controller
{
    public function login(){
        return view('backend.instructor.login.index');

    }

    public function register()
    { 
        return view('backend.instructor.login.register');
    }

    public function instructorRegister(Request $request)
    {
        $request->validate([
            'name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'string', 'lowercase', 'email', 'max:255', 'unique:users'],
            'password' => ['required', 'confirmed'],
        ]);

        $user = \App\Models\User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => \Illuminate\Support\Facades\Hash::make($request->password),
            'role' => 'instructor',
            'status' => '0', // Pending approval
        ]);

        // Notify Admin
        $admins = \App\Models\User::where('role', 'admin')->get();
        \Illuminate\Support\Facades\Notification::send($admins, new \App\Notifications\InstructorRegistrationNotification($user));

        $notification = array(
            'message' => 'Instructor Registered Successfully. Please wait for Admin approval.',
            'alert-type' => 'success'
        );

        \Illuminate\Support\Facades\Auth::login($user);

        // Note: existing return statement retained
        return redirect()->route('instructor.dashboard')->with($notification);
    }

    // Existing dashboard method retained
    public function dashboard()
    {
        $id = Auth::id();
        $total_orders = \App\Models\Order::where('instructor_id', $id)->count();
        $total_revenue = \App\Models\Order::where('instructor_id', $id)->sum('price');
        $total_courses = \App\Models\Course::where('instructor_id', $id)->count();
        $total_students = \App\Models\Order::where('instructor_id', $id)->distinct('user_id')->count();
        $recent_orders = \App\Models\Order::where('instructor_id', $id)->latest()->limit(10)->get();

        return view('backend.instructor.dashboard.index', compact('total_orders', 'total_revenue', 'total_courses', 'total_students', 'recent_orders'));
    }

    /**
     * Handle instructor login POST request.
     */
    public function loginStore(Request $request): RedirectResponse
    {
        $credentials = $request->validate([
            'email' => ['required', 'email'],
            'password' => ['required'],
        ]);

        if (Auth::attempt($credentials, $request->boolean('remember'))) {
            $user = Auth::user();

            // Ensure the user is an instructor
            if ($user->role !== 'instructor') {
                Auth::logout();
                return back()->withErrors([
                    'email' => 'You are not authorized to access instructor panel.',
                ])->onlyInput('email');
            }

            // Check if instructor account is pending approval (status == '0')
            if ($user->status === '0') {
                Auth::logout();
                return back()->withErrors([
                    'email' => 'Your instructor account is pending approval.',
                ])->onlyInput('email');
            }

            $request->session()->regenerate();
            return redirect()->intended('/instructor/dashboard');
        }

        return back()->withErrors([
            'email' => 'The provided credentials do not match our records.',
        ])->onlyInput('email');
    }

    public function destroy(Request $request): RedirectResponse
    {
        Auth::guard('web')->logout();

        $request->session()->invalidate();

        $request->session()->regenerateToken();

        return redirect('/instructor/login');
    }

    public function markAsRead($id)
    {
        $notification = auth()->user()->notifications()->where('id', $id)->first();
        if ($notification) {
            $notification->markAsRead();
        }
        return response()->json(['success' => true]);
    }

    public function markAllAsRead()
    {
        auth()->user()->unreadNotifications->markAsRead();
        
        $notification = array(
            'message' => 'All notifications marked as read',
            'alert-type' => 'success'
        );

        return redirect()->back()->with($notification);
    }


}
