<?php

namespace App\Http\Controllers\backend;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;

class AdminUserController extends Controller
{
    /**
     * Display a listing of all users (students).
     */
    public function index()
    {
        $all_users = User::where('role', 'user')->latest()->get();
        return view('backend.admin.user.all_user', compact('all_users'));
    }

    /**
     * Update user status (Active/Inactive).
     */
    public function updateStatus(Request $request)
    {
        $user = User::find($request->user_id);
        if ($user) {
            $user->status = $request->status;
            $user->save();

            return response()->json(['success' => true, 'message' => 'User status updated successfully!']);
        }

        return response()->json(['success' => false, 'message' => 'User not found!']);
    }

    /**
     * Delete user account.
     */
    public function delete($id)
    {
        $user = User::findOrFail($id);
        $user->delete();

        $notification = array(
            'message' => 'User deleted successfully',
            'alert-type' => 'success'
        );

        return redirect()->back()->with($notification);
    }
}
