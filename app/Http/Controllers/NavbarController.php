<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Cart;
use App\Models\Wishlist;

class NavbarController extends Controller
{
    public function cartCount()
    {
        return response()->json([
            'count' => Cart::where('user_id', auth()->id())->sum('qty')
        ]);
    }

    public function wishlistCount()
    {
        return response()->json([
            'count' => Wishlist::where('user_id', auth()->id())->count()
        ]);
    }

    public function notificationCount()
    {
        return response()->json([
            'count' => auth()->user()->unreadNotifications->count()
        ]);
    }
}
