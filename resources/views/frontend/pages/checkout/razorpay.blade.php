@extends('frontend.master')

@section('content')
<div class="container pt-5 pb-5 text-center">
    <h3>Process Payment</h3>
    <p>Please wait while we open the payment gateway...</p>
</div>

<script>
    // Robustly load Razorpay and open modal
    (function() {
        var openRazorpay = function() {
            var options = {
                "key": "{{ $key }}", 
                "amount": "{{ $amount }}", 
                "currency": "{{ $currency }}",
                "name": "{{ config('app.name') }}",
                "description": "{{ $description }}",
                "image": "{{ asset('frontend/images/logo.png') }}",
                "order_id": "{{ $order_id }}", 
                "handler": function (response){
                    var form = document.createElement("form");
                    form.setAttribute("method", "POST");
                    form.setAttribute("action", "{{ route('razorpay.success') }}");
                    
                    var hiddenField = document.createElement("input");
                    hiddenField.setAttribute("type", "hidden");
                    hiddenField.setAttribute("name", "_token");
                    hiddenField.setAttribute("value", "{{ csrf_token() }}");
                    form.appendChild(hiddenField);
                    
                    var paymentIdField = document.createElement("input");
                    paymentIdField.setAttribute("type", "hidden");
                    paymentIdField.setAttribute("name", "razorpay_payment_id");
                    paymentIdField.setAttribute("value", response.razorpay_payment_id);
                    form.appendChild(paymentIdField);
                    
                    var orderIdField = document.createElement("input");
                    orderIdField.setAttribute("type", "hidden");
                    orderIdField.setAttribute("name", "razorpay_order_id");
                    orderIdField.setAttribute("value", response.razorpay_order_id);
                    form.appendChild(orderIdField);
                    
                    var signatureField = document.createElement("input");
                    signatureField.setAttribute("type", "hidden");
                    signatureField.setAttribute("name", "razorpay_signature");
                    signatureField.setAttribute("value", response.razorpay_signature);
                    form.appendChild(signatureField);
                    
                    document.body.appendChild(form);
                    form.submit();
                },
                "prefill": {
                    "name": "{{ $user_name }}",
                    "email": "{{ $user_email }}",
                    "contact": "{{ $user_phone }}"
                },
                "theme": {
                    "color": "#3399cc"
                },
                "modal": {
                    "ondismiss": function(){
                        window.location.href = "{{ route('razorpay.cancel') }}";
                    }
                }
            };
            
            var rzp1 = new Razorpay(options);
            rzp1.on('payment.failed', function (response){
                alert("Payment Failed: " + response.error.description);
                window.location.href = "{{ route('razorpay.cancel') }}";
            });
            rzp1.open();
        };

        // Dynamically load the script to ensure no race conditions
        var script = document.createElement('script');
        script.src = "https://checkout.razorpay.com/v1/checkout.js";
        script.onload = openRazorpay;
        script.onerror = function() {
            alert("Failed to load payment gateway. Please verify your internet connection.");
        };
        document.head.appendChild(script);
    })();
</script>
@endsection
