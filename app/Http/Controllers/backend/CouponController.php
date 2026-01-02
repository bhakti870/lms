<?php

namespace App\Http\Controllers\backend;

use App\Http\Controllers\Controller;
use App\Http\Requests\ApplyCouponRequest;
use App\Http\Requests\CouponRequest;
use App\Models\Coupon;
use App\Services\ApplyCouponService;
use App\Services\CouponService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class CouponController extends Controller
{
    /**
     * Display a listing of the resource.
     */

    protected $couponService, $applyCouponService;

    public function __construct(CouponService $couponService, ApplyCouponService $applyCouponService)
    {
        $this->couponService = $couponService;
        $this->applyCouponService = $applyCouponService;
    }

    public function index()
    {
        $instructor_id = Auth::user()->id;
        $all_coupon = Coupon::where('instructor_id', $instructor_id)->latest()->get();
        return view('backend.instructor.coupon.index', compact('all_coupon'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('backend.instructor.coupon.create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(CouponRequest $request)
    {
        //
        $this->couponService->saveCoupon($request->validated());
        return redirect()->back()->with('success', 'Coupon Created successfully');
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        $coupon = Coupon::find($id);
        return view('backend.instructor.coupon.edit', compact('coupon'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(CouponRequest $request, string $id)
    {
        $this->couponService->updateCoupon($request->validated(), $id);
        return redirect()->back()->with('success', 'Coupon Updated successfully');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $coupon = Coupon::findOrFail($id);

        $coupon->delete();

        return redirect()->route('instructor.coupon.index')->with('success', 'Coupon deleted successfully.');
    }

    // public function applyCoupon(ApplyCouponRequest $request)
    // {
    //     // Validate the input
    //     $validated = $request->validated();

    //     $couponName = $validated['coupon'];
    //     $courseIds = $validated['course_id'];
    //     $instructorIds = $validated['instructor_id'];

    //     $discounts =  $this->applyCouponService->applyCoupon($couponName, $courseIds, $instructorIds);

    //     // If no valid coupon found
    //     if (empty($discounts)) {
    //         return response()->json([
    //             'success' => false,
    //             'message' => 'No valid coupon found for the selected courses.',
    //         ], 400);    
    //     }


    //     // Validate if coupon discount is greater than course price
    //     foreach ($discounts as $item) {
    //         if ($item['course_price'] < $item['discount']) {
    //             return response()->json([
    //                 'success' => false,
    //                 'message' => 'The coupon discount (₹' . $item['discount'] . ') is greater than the course price (₹' . $item['course_price'] . '). It cannot be applied.',
    //             ], 400);
    //         }
    //     }
  
    //     // Calculate total discount
    //     $totalDiscount = collect($discounts)->sum('discount');

    //     // Store total discount and applied coupons in session
    //     session(['coupon' => $totalDiscount]);
    //     session(['applied_coupons' => $discounts]);


    //     // Success response
    //     return response()->json([
    //         'success' => true,
    //         'message' => 'Coupon applied successfully!',
    //         'discounts' => $discounts,
    //     ]);
    // }


    public function applyCoupon(ApplyCouponRequest $request)
    {
        // Validated data
        $validated = $request->validated();

        $couponName    = $validated['coupon'];
        $courseIds     = $validated['course_id'];
        $instructorIds = $validated['instructor_id'];

        // Get coupon
        $coupon = Coupon::where('coupon_name', $couponName)->first();

        if (!$coupon) {
            return response()->json([
                'success' => false,
                'message' => 'Invalid coupon code.',
            ], 400);
        }

        // Already applied coupons
        $appliedCouponNames = session()->get('applied_coupon_names', []);
        $couponDiscounts = session()->get('coupon_discounts', []);

        // Max 2 coupons allowed
        if (count($appliedCouponNames) >= 2) {
            return response()->json([
                'success' => false,
                'message' => 'You can apply maximum 2 coupons only.',
            ], 422);
        }

        // Same coupon cannot be applied twice
        if (in_array($couponName, $appliedCouponNames)) {
            return response()->json([
                'success' => false,
                'message' => 'This coupon is already applied.',
            ], 422);
        }

        // Apply coupon via service
        $discounts = $this->applyCouponService
            ->applyCoupon($couponName, $courseIds, $instructorIds);

        // No valid discount
        if (empty($discounts)) {
            return response()->json([
                'success' => false,
                'message' => 'This coupon does not apply to any courses in your cart.',
            ], 400);
        }

        // Calculate this coupon total discount
        $currentCouponDiscount = collect($discounts)->sum('discount');
        $oldDiscount = session()->get('coupon', 0);
        $newTotalDiscount = $oldDiscount + $currentCouponDiscount;

        // Calculate Subtotal consistent with CartController
        $cart = [];
        if (Auth::check()) {
            $cart = \App\Models\Cart::where('user_id', Auth::id())->get();
        } else {
            $guestToken = request()->cookie('guest_token');
            if ($guestToken) {
                $cart = \App\Models\Cart::where('guest_token', $guestToken)->get();
            }
        }

        $totalPrice = collect($cart)->sum(function ($cartItem) {
            if (!$cartItem->course) return 0;
            $price = $cartItem->course->discount_price ?? $cartItem->course->selling_price;
            return ($cartItem->quantity ?? 1) * ($price ?? 0);
        });

        if ($newTotalDiscount >= $totalPrice) {
            return response()->json([
                'success' => false,
                'message' => 'Total discount cannot be greater than or equal to total price.',
            ], 400);
        }

        // Store updated discount
        session()->put('coupon', $newTotalDiscount);

        // Store applied coupon name
        $appliedCouponNames[] = $couponName;
        session()->put('applied_coupon_names', $appliedCouponNames);

        // Store discount details
        $couponDiscounts[] = [
            'coupon'   => $couponName,
            'discount' => $currentCouponDiscount,
            'courses'  => $discounts,
        ];
        session()->put('coupon_discounts', $couponDiscounts);

        // Success response
        return response()->json([
            'success'        => true,
            'message'        => 'Coupon applied successfully!',
            'total_discount' => session()->get('coupon'),
            'coupon_count'   => count($appliedCouponNames),
            'applied_coupons' => $appliedCouponNames,
        ]);
    }

    public function couponRemove(Request $request)
    {
        $couponToRemove = $request->coupon_name;
        $appliedCoupons  = session()->get('applied_coupon_names', []);
        $couponDiscounts = session()->get('coupon_discounts', []);

        if (empty($appliedCoupons)) {
            return response()->json([
                'success' => true,
                'message' => 'No coupon applied.',
                'total_discount' => 0,
                'coupon_count' => 0,
            ]);
        }

        // If coupon_name is provided, remove that specific one. Otherwise remove last one (fallback).
        if ($couponToRemove) {
            $index = array_search($couponToRemove, $appliedCoupons);
            if ($index !== false) {
                unset($appliedCoupons[$index]);
                // Re-index appliedCoupons if it's not and we want it to be a clean array for session
                $appliedCoupons = array_values($appliedCoupons);

                // Also remove from couponDiscounts
                foreach ($couponDiscounts as $k => $v) {
                    if ($v['coupon'] == $couponToRemove) {
                        unset($couponDiscounts[$k]);
                        break;
                    }
                }
                $couponDiscounts = array_values($couponDiscounts);
            }
        } else {
            // Default behavior if no name provided
            array_pop($appliedCoupons);
            array_pop($couponDiscounts);
        }

        $totalDiscount = collect($couponDiscounts)->sum('discount');

        if (!empty($appliedCoupons)) {
            session()->put('coupon', $totalDiscount);
            session()->put('applied_coupon_names', $appliedCoupons);
            session()->put('coupon_discounts', $couponDiscounts);
        } else {
            // CLEAR EVERYTHING
            session()->forget([
                'coupon',
                'applied_coupon_names',
                'coupon_discounts'
            ]);
            $totalDiscount = 0;
        }

        return response()->json([
            'success' => true,
            'message' => 'Coupon removed successfully!',
            'total_discount' => $totalDiscount,
            'coupon_count' => count($appliedCoupons),
            'applied_coupons' => $appliedCoupons,
        ]);
    }
}
