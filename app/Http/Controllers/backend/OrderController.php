<?php

namespace App\Http\Controllers\backend;

use App\Http\Controllers\Controller;
use App\Http\Requests\OrderRequest;
use App\Models\Cart;
use App\Models\Order;
use App\Models\Payment;
use App\Services\PaymentService;
use Illuminate\Http\Request;
use Stripe\StripeClient;
use Illuminate\Support\Str;

class OrderController extends Controller
{

     protected $paymentService;

    public function __construct(PaymentService $paymentService)
    {
        $this->paymentService = $paymentService;
    }

    public function order(OrderRequest $request)
    {

        session()->put('stripe_data', $request->validated());
        // Call the service to process the payment
        return $this->paymentService->processPayment($request->validated());
    }

     public function success(Request $request)
    {
        // Get the session ID from the query string
        $sessionId = $request->query('session_id');
        $stripe = new StripeClient(config('stripe.stripe_sk'));

        try {
            // Retrieve the Stripe session details
            $session = $stripe->checkout->sessions->retrieve($sessionId);
            $paymentIntent = $stripe->paymentIntents->retrieve($session->payment_intent);

            /*Event start */

            $stripe_data = session()->get('stripe_data');

            $paymentData = $stripe_data;

            // Dispatch event
          //  PaymentSuccessful::dispatch($paymentData);

            /*Event End  */

            // Use request data for specific fields
            $this->createPaymentAndOrders($session, $paymentIntent, 'stripe');

            $firstCourseId = $stripe_data['course_id'][0] ?? null;
            $course = \App\Models\Course::find($firstCourseId);

            //delete cart data
            $guestToken = $request->cookie('guest_token') ?? Str::uuid();
            Cart::where('guest_token', $guestToken)->delete();

            //coupon session destroy
            session()->forget(['coupon', 'stripe_data']);

            $redirectUrl = $course ? route('course-details', $course->course_name_slug) : '/';
            return redirect($redirectUrl)->with('purchase_success', true);
        } catch (\Exception $e) {
            return back()->withErrors(['error' => $e->getMessage()]);
        }
    }

    public function cancel()
    {
        return view('frontend.pages.checkout.stripe.cancel');
    }

    private function createPaymentAndOrders($session, $paymentIntent, $type)
    {
        set_time_limit(60); // Increase time limit for email sending

        if ($type === 'stripe') {
            $payment = Payment::create([
                'transaction_id' => $paymentIntent->id,
                'name' => $session->customer_details->name,
                'email' => $session->customer_email,
                'total_amount' => $session->amount_total / 100,
                'payment_type' => 'stripe',
                'invoice_no' => 'INV-' . strtoupper(uniqid()),
                'order_date' => now()->toDateString(),
                'order_month' => now()->format('F'),
                'order_year' => now()->year,
                'status' => 'completed',
            ]);

            $orderData = session('stripe_data');
        } else {
            // Razorpay logic
            $orderPayload = session()->get('order_payload');
            $payment = Payment::create([
                'transaction_id' => $session['razorpay_payment_id'],
                'name' => $orderPayload['first_name'] . ' ' . $orderPayload['last_name'],
                'email' => $orderPayload['email'],
                'total_amount' => $orderPayload['total_price'],
                'payment_type' => 'razorpay',
                'invoice_no' => 'INV-' . strtoupper(uniqid()),
                'order_date' => now()->toDateString(),
                'order_month' => now()->format('F'),
                'order_year' => now()->year,
                'status' => 'completed',
            ]);

            $orderData = [
                'course_id' => $orderPayload['course_id'],
                'instructor_id' => $orderPayload['instructor_id'],
                'course_name' => $orderPayload['course_name'],
                'course_price' => $orderPayload['course_price'],
            ];
        }

        foreach ($orderData['course_id'] as $index => $courseId) {
            $order = Order::create([
                'payment_id' => $payment->id,
                'user_id' => auth()->user()->id,
                'course_id' => $courseId,
                'instructor_id' => $orderData['instructor_id'][$index],
                'course_title' => $orderData['course_name'][$index],
                'price' => $orderData['course_price'][$index],
            ]);

            // Notify Instructor
            $instructor = \App\Models\User::find($order->instructor_id);
            if ($instructor) {
                $instructor->notify(new \App\Notifications\CoursePurchaseNotification($order));
            }

            // Notify User
            auth()->user()->notify(new \App\Notifications\UserNotification([
                'title' => 'Course Purchased Successfully',
                'message' => 'Congratulations! You have unlocked ' . $order->course_title . '. Happy learning!',
                'link' => route('user.course.learn', $order->course_id),
                'type' => 'payment',
                'icon' => 'bi-bag-check-fill',
                'color' => 'success',
            ]));

            // Send Invoice Email (Try to use queue if available)
            try {
                \Illuminate\Support\Facades\Mail::to(auth()->user()->email)->queue(new \App\Mail\CourseInvoiceMail($order, auth()->user()));
            } catch (\Exception $e) {
                // Background queue might not be set up, fallback to sync or just ignore if it's the bottleneck
                \Illuminate\Support\Facades\Mail::to(auth()->user()->email)->send(new \App\Mail\CourseInvoiceMail($order, auth()->user()));
            }

            // Create Enrollment
            \App\Models\Enrollment::updateOrCreate(
                ['user_id' => auth()->user()->id, 'course_id' => $courseId],
                ['amount' => $orderData['course_price'][$index], 'status' => 'active', 'enrolled_at' => now()]
            );
        }
    }


    public function razorpaySuccess(Request $request)
    {
        $input = $request->all();
        $api = new \Razorpay\Api\Api(config('razorpay.razor_key'), config('razorpay.razor_secret'));
        
        try {
            $attributes = [
                'razorpay_order_id' => $input['razorpay_order_id'],
                'razorpay_payment_id' => $input['razorpay_payment_id'],
                'razorpay_signature' => $input['razorpay_signature']
            ];
            
            $api->utility->verifyPaymentSignature($attributes);
            
            // Payment successful
            $orderPayload = session()->get('order_payload');
            
            // Create Payment and Orders using helper
            $this->createPaymentAndOrders($input, null, 'razorpay');

            // Clear cart
             Cart::where('user_id', auth()->user()->id)->delete();
             $guestToken = $request->cookie('guest_token');
             if ($guestToken) Cart::where('guest_token', $guestToken)->delete();
             
             $firstCourseId = $orderPayload['course_id'][0] ?? null;
             $course = \App\Models\Course::find($firstCourseId);

             session()->forget(['order_payload', 'razorpay_order_id', 'coupon']);

             $redirectUrl = $course ? route('course-details', $course->course_name_slug) : '/';
             return redirect($redirectUrl)->with('purchase_success', true);

        } catch (\Exception $e) {
            return redirect()->route('checkout.index')->with('error', 'Payment verification failed: ' . $e->getMessage());
        }
    }

    public function razorpayCancel()
    {
        return redirect()->route('checkout.index')->with('error', 'Payment was cancelled');
    }
}
