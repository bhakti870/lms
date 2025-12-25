<?php

namespace App\Http\Controllers\backend;

use App\Http\Controllers\Controller;
use App\Models\Order;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class InstructorOrderController extends Controller
{
    public function index()
    {
        $id = Auth::id();
        $orders = Order::where('instructor_id', $id)
            ->with(['user', 'course'])
            ->latest()
            ->get();
            
        return view('backend.instructor.order.index', compact('orders'));
    }

    public function show($id)
    {
        $instructor_id = Auth::id();
        $order = Order::where('id', $id)
            ->where('instructor_id', $instructor_id)
            ->with(['user', 'course', 'payment'])
            ->firstOrFail();
            
        return view('backend.instructor.order.view', compact('order'));
    }
}
