<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Carbon\Carbon;
use App\Models\Coupon;
use App\Models\Cart;
use Illuminate\Support\Facades\Auth;

class ApplyCouponRequest extends FormRequest
{
    public function authorize(): bool
    {
        return true;
    }

    public function rules(): array
    {
        return [
            'coupon' => [
                'required',
                'string',
                'exists:coupons,coupon_name',
                function ($attribute, $value, $fail) {

                    $coupon = Coupon::where('coupon_name', $value)->first();

                    if (!$coupon) {
                        $fail('Invalid coupon code.');
                        return;
                    }

                    //  Coupon expiry
                    if (Carbon::now()->gt(
                        Carbon::parse($coupon->coupon_validity)->endOfDay()
                    )) {
                        $fail('The coupon has expired.');
                    }

                    //  Max 2 coupons
                    $appliedCoupons = session()->get('applied_coupon_names', []);
                    if (count($appliedCoupons) >= 2) {
                        $fail('You can apply maximum 2 coupons only.');
                    }

                    //  Same coupon again
                    if (in_array($value, $appliedCoupons)) {
                        $fail('This coupon is already applied.');
                    }
                },
            ],

            'course_id' => [
                'required',
                'array',
                function ($attribute, $value, $fail) {
                    if (empty($value)) {
                        $fail('No course found in cart.');
                    }
                }
            ],
            'course_id.*' => 'exists:courses,id',

            'instructor_id' => 'required|array',
            'instructor_id.*' => 'exists:users,id',
        ];
    }

    /**
     * Extra validation after rules()
     */
    protected function withValidator($validator)
    {
        $validator->after(function ($validator) {

            if ($validator->errors()->any()) {
                return;
            }

            // Cart total calculation
            $cart = Auth::check()
                ? Cart::where('user_id', Auth::id())->get()
                : Cart::where('guest_token', request()->cookie('guest_token'))->get();

            $totalPrice = collect($cart)->sum(function ($item) {
                if (!$item->course) return 0;
                $price = $item->course->discount_price ?? $item->course->selling_price;
                return ($item->quantity ?? 1) * $price;
            });

            // Applied discounts
            $existingDiscount = session()->get('coupon', 0);

            // Coupon discount simulation
            $coupon = Coupon::where('coupon_name', $this->coupon)->first();
            if ($coupon && $coupon->discount_amount >= $totalPrice) {
                $validator->errors()->add(
                    'coupon',
                    'Coupon discount cannot be greater than or equal to total price.'
                );
            }

            if ($existingDiscount >= $totalPrice) {
                $validator->errors()->add(
                    'coupon',
                    'Total discount cannot be greater than or equal to total price.'
                );
            }
        });
    }
}
