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
        if (!Auth::check()) {
            return redirect()->route('login')->with('error', 'Please login to proceed to checkout.');
        }
        
        $user = Auth::user();
        
        // Fetch cart items for authenticated user
        $cart = Cart::with('course', 'course.user')
            ->where('user_id', $user->id)
            ->get();
            
        // If cart is empty, check for guest cart and migrate
        if ($cart->isEmpty()) {
            $guestToken = $request->cookie('guest_token');
            if ($guestToken) {
                // Migrate guest cart to user cart
                Cart::where('guest_token', $guestToken)->update([
                    'user_id' => $user->id,
                    'guest_token' => null
                ]);
                // Reload cart
                $cart = Cart::with('course', 'course.user')
                    ->where('user_id', $user->id)
                    ->get();
            }
        }
        
        // Calculate the total
        $total = $cart->sum(function ($item) {
            return $item->course->discount_price ?? $item->course->selling_price;
        });
        
        return view('frontend.pages.checkout.index', compact('cart', 'total', 'user'));
    }


}
