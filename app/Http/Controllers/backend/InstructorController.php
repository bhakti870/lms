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

        return redirect()->route('instructor.dashboard')->with($notification);
    }

    public function dashboard()
    {
        return view('backend.instructor.dashboard.index');
    }

    public function destroy(Request $request): RedirectResponse
    {
        Auth::guard('web')->logout();

        $request->session()->invalidate();

        $request->session()->regenerateToken();

        return redirect('/instructor/login');
    }


}
