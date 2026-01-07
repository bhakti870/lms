<?php


namespace App\Services;

use App\Repositories\StripeRepository;


class PaymentService
{
    protected $stripeRepository;
    protected $razorpayRepository;

    public function __construct(StripeRepository $stripeRepository, \App\Repositories\RazorpayRepository $razorpayRepository)
    {
        $this->stripeRepository = $stripeRepository;
        $this->razorpayRepository = $razorpayRepository;
    }

    public function processPayment(array $data)
    {
        switch ($data['payment_type']) {
            case 'stripe':
                return $this->stripeRepository->handlePayment($data);

            case 'razorpay':
                return $this->razorpayRepository->handlePayment($data);

            case 'paypal':
                return "paypal";

            default:
                throw new \Exception('Unsupported payment type');
        }
    }
}
