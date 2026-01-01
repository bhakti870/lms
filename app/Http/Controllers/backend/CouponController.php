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

        // Already applied coupons (names)
        $appliedCouponNames = session()->get('applied_coupon_names', []);

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
                'message' => 'No valid coupon found for the selected courses.',
            ], 400);
        }

        // Discount > course price check
        foreach ($discounts as $item) {
            if ($item['discount'] > $item['course_price']) {
                return response()->json([
                    'success' => false,
                    'message' => 'Coupon discount (₹' . $item['discount'] .
                        ') cannot be greater than course price (₹' .
                        $item['course_price'] . ').',
                ], 400);
            }
        }

        // Calculate this coupon total discount
        $currentCouponDiscount = collect($discounts)->sum('discount');

        // Old total discount (if any)
        $oldDiscount = session()->get('coupon', 0);

        // Store updated discount
        session()->put('coupon', $oldDiscount + $currentCouponDiscount);

        // Store applied coupon name
        $appliedCouponNames[] = $couponName;
        session()->put('applied_coupon_names', $appliedCouponNames);

        // Store discount details (optional for UI)
        $allDiscounts = session()->get('coupon_discounts', []);
        $allDiscounts[] = [
            'coupon'   => $couponName,
            'discount' => $currentCouponDiscount,
            'courses'  => $discounts,
        ];
        session()->put('coupon_discounts', $allDiscounts);

        // Success response
        return response()->json([
            'success'        => true,
            'message'        => 'Coupon applied successfully!',
            'discounts'      => $discounts,
            'total_discount' => session()->get('coupon'),
            'coupon_count'   => count($appliedCouponNames),
        ]);
    }

    

    public function couponRemove(Request $request)
    {
        $couponName = $request->coupon_name;

        if ($couponName) {
            $appliedCouponNames = session()->get('applied_coupon_names', []);
            $couponDiscounts = session()->get('coupon_discounts', []);

            // Remove the specific coupon name
            $appliedCouponNames = array_values(array_filter($appliedCouponNames, fn($name) => $name !== $couponName));
            
            // Remove the specific discount details
            $couponDiscounts = array_values(array_filter($couponDiscounts, fn($item) => $item['coupon'] !== $couponName));

            session()->put('applied_coupon_names', $appliedCouponNames);
            session()->put('coupon_discounts', $couponDiscounts);

            // Re-calculate total discount
            $totalDiscount = collect($couponDiscounts)->sum('discount');
            if ($totalDiscount <= 0) {
                session()->forget(['coupon', 'applied_coupon_names', 'coupon_discounts']);
                $totalDiscount = 0;
            } else {
                session()->put('coupon', $totalDiscount);
            }
            
            return response()->json([
                'status' => 'success',
                'success' => 'Coupon Removed Successfully', 
                'total_discount' => $totalDiscount,
                'coupon_count' => count($appliedCouponNames)
            ]);
        }

        // Default: remove all if no specific name provided
        session()->forget(['coupon', 'applied_coupon_names', 'coupon_discounts']);
        return response()->json([
            'status' => 'success',
            'success' => 'All Coupons Removed Successfully'
        ]);
    }
}
