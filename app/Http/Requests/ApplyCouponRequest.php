<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Carbon\Carbon;

class ApplyCouponRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
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
                    $coupon = \App\Models\Coupon::where('coupon_name', $value)->first();
                    // if ($coupon && \Carbon\Carbon::now()->endOfDay($coupon->coupon_validity)) 
                    // {
                    //     $fail('The coupon has expired.');
                    // }

                       if (Carbon::now()->gt(Carbon::parse($coupon->coupon_validity)->endOfDay())) {
                        $fail('The coupon has expired.');
                    }


                    // max 2 couppon apply
                     $appliedCoupons = session()->get('applied_coupon_names', []);
                    if (count($appliedCoupons) >= 2) {
                        $fail('You can apply maximum 2 coupons only.');
                    }



                    //not apply same coupon
                      if (in_array($value, $appliedCoupons)) {
                        $fail('This coupon is already applied.');
                    }


                },
            ],
            'course_id' => 'required|array',
            'course_id.*' => 'exists:courses,id', 
            'instructor_id' => 'required|array',
            'instructor_id.*' => 'exists:users,id', 
        ];
    }
}
