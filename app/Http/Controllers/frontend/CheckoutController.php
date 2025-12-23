<?php

namespace App\Http\Controllers\frontend;

use App\Http\Controllers\Controller;
use App\Models\Cart;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class CheckoutController extends Controller
{


    public function index(Request $request)
    {
        // Ensure only authenticated users can access checkout
        if (!\Illuminate\Support\Facades\Auth::check()) {
            return redirect()->route('login')->with('error', 'Please login to proceed to checkout.');
        }
        $guestToken = $request->cookie('guest_token') ?? \Illuminate\Support\Str::uuid();
        $cart = Cart::with('course')->where('guest_token', $guestToken)->get();
        // Calculate the total
        $total = $cart->sum(function ($item) {
            return $item->course->discount_price ?? $item->course->selling_price;
        });
        $user = Auth::user();
        return view('frontend.pages.checkout.index', compact('cart', 'total', 'user'));
    }


}
