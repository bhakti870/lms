<?php

namespace App\Repositories;

use Razorpay\Api\Api;
use Illuminate\Support\Facades\Session;

class RazorpayRepository
{
    public function handlePayment(array $data)
    {
        $api = new Api(config('razorpay.razor_key'), config('razorpay.razor_secret'));
        
        // Calculate total amount in paise (INR)
        // Adjust logic if you have different currency needs
        $amount = round($data['total_price'] * 100); 

        $orderData = [
            'receipt'         => 'rcptid_' . uniqid(),
            'amount'          => $amount, 
            'currency'        => 'INR',
            'payment_capture' => 1 
        ];
        
        $razorpayOrder = $api->order->create($orderData);
        
        // Store necessary data in session to access in callback
        session()->put('razorpay_order_id', $razorpayOrder['id']);
        session()->put('order_payload', $data);

        return view('frontend.pages.checkout.razorpay', [
            'order_id' => $razorpayOrder['id'],
            'amount' => $amount,
            'currency' => 'INR',
            'key' => config('razorpay.razor_key'),
            'user_name' => $data['first_name'] . ' ' . $data['last_name'],
            'user_email' => $data['email'],
            'user_phone' => $data['phone'],
            'description' => 'Course Enrollment'
        ]);
    }
}
