@extends('frontend.master')

@section('content')

@php
    // Force page reload if cart was just updated
    if (session()->has('cart_updated')) {
        session()->forget('cart_updated');
    }
@endphp



    @include('frontend.section.breadcrumb', ['title' => 'Checkout'])
    <!-- ================================
                                END BREADCRUMB AREA
                            ================================= -->

    <!-- ================================
                                   START CONTACT AREA
                            ================================= -->
    <form id="payment-form" method="post" action="{{ route('order') }}" data-turbo="false">
        @csrf

        <section class="cart-area section--padding">
            <div class="container">
                <div class="row">
                    <div class="col-lg-7">
                        <div class="card card-item">
                            <div class="card-body">
                                <h3 class="card-title fs-22 pb-3">Billing Details</h3>
                                <div class="divider"><span></span></div>

                                @if ($errors->any())
                                    <div class="alert alert-danger">
                                        <ul>
                                            @foreach ($errors->all() as $error)
                                                <li>{{ $error }}</li>
                                            @endforeach
                                        </ul>
                                    </div>
                                @endif





                                <div class="row">

                                    <div class="input-box col-lg-6">
                                        <label class="label-text">First Name</label>
                                        <div class="form-group">
                                            <input class="form-control form--control" type="text" name="first_name"
                                                placeholder="e.g. Alex" value="{{ $user ? $user->first_name : '' }}"
                                                required>
                                            <span class="la la-user input-icon"></span>
                                        </div>
                                    </div><!-- end input-box -->
                                    <div class="input-box col-lg-6">
                                        <label class="label-text">Last Name</label>
                                        <div class="form-group">
                                            <input class="form-control form--control" type="text" name="last_name"
                                                placeholder="e.g. Smith" value="{{ $user ? $user->last_name : '' }}"
                                                required>
                                            <span class="la la-user input-icon"></span>
                                        </div>
                                    </div><!-- end input-box -->
                                    <div class="input-box col-lg-12">
                                        <label class="label-text">Email Address</label>
                                        <div class="form-group">
                                            <input class="form-control form--control" type="email" name="email"
                                                placeholder="e.g. alexsmith@gmail.com"
                                                value="{{ $user ? $user->email : '' }}" required>
                                            <span class="la la-envelope input-icon"></span>
                                        </div>
                                    </div><!-- end input-box -->
                                    <div class="input-box col-lg-12">
                                        <label class="label-text">Phone Number</label>
                                        <div class="form-group">
                                            <input id="phone" class="form-control form--control" type="tel" name="phone"
                                                value="{{ $user ? $user->phone : '' }}" required>
                                            <span class="la la-phone input-icon"></span>
                                        </div>
                                    </div><!-- end input-box -->
                                    <div class="input-box col-lg-12">
                                        <label class="label-text">Address</label>
                                        <div class="form-group">
                                            <input class="form-control form--control" type="text" name="address"
                                                placeholder="e.g. 12345 Little Baker St, Melbourne"
                                                value="{{ $user ? $user->address : '' }}" required>
                                            <span class="la la-map-marker input-icon"></span>
                                        </div>
                                    </div><!-- end input-box -->



                                </div>






                            </div><!-- end card-body -->
                        </div><!-- end card -->

                        <div class="card card-item">
                            <div class="card-body">
                                <h3 class="card-title fs-22 pb-3">Select Payment Method</h3>
                                <div class="divider"><span></span></div>
                                <div class="payment-option-wrap">



                                    <div class="payment-tab">
                                        <div class="payment-tab-toggle">
                                            <input checked id="razorpay" name="payment_type" type="radio" value="razorpay">
                                            <label for="razorpay">Razorpay Secure Payment</label>
                                            <img class="payment-logo" src="https://razorpay.com/assets/razorpay-glyph.svg"
                                                style="width: 30px; margin-left:10px;" alt="">
                                        </div>
                                        <div class="payment-tab-content">
                                            <p class="fs-15 lh-24">Pay securely with Credit/Debit Card, UPI, NetBanking, and
                                                Wallets via Razorpay.</p>
                                        </div>
                                    </div><!-- end payment-tab -->


                                </div>
                            </div>
                            <!-- end card-body -->
                        </div>




                        <!-- end card -->
                    </div><!-- end col-lg-7 -->
                    <div class="col-lg-5">
                        <div class="card card-item">
                            <div class="card-body">
                                <h3 class="card-title fs-22 pb-3">Order Details</h3>
                                <div class="divider"><span></span></div>
                                <div class="order-details-lists">

                                    @forelse($cart as $item)
                                        <div class="media media-card border-bottom border-bottom-gray pb-3 mb-3">
                                            <a href="course-details.html" class="media-img">
                                                <img src="{{ asset($item->course->course_image) }}" alt="Cart image">
                                            </a>

                                            <input type="hidden" name="course_id[]" value="{{ $item->course->id }}" />
                                            <input type="hidden" name="course_name[]"
                                                value="{{ $item->course->course_name }}" />
                                            <input type="hidden" name="course_image[]"
                                                value="{{ $item->course->course_image }}" />
                                            <input type="hidden" name="course_price[]"
                                                value="{{ $item->course->discount_price ? $item->course->discount_price : $item->course->selling_price }}" />
                                            <input type="hidden" name="instructor_id[]"
                                                value="{{$item->course->instructor_id}}" />
                                            <div class="media-body">
                                                <h5 class="fs-15 pb-2"><a
                                                        href="{{ route('course-details', $item->course->course_name_slug) }}">{{ $item->course->course_name_slug }}</a>
                                                </h5>
                                                <p class="text-black font-weight-semi-bold lh-18">
                                                    ₹{{ $item->course->discount_price ? $item->course->discount_price : $item->course->selling_price }}
                                                </p>
                                            </div>
                                        </div><!-- end media -->
                                    @empty

                                        <p>No Cart Data Found !</p>
                                    @endforelse

                                </div><!-- end order-details-lists -->
                                <a href="/cart" class="btn-text"><i class="la la-edit mr-1"></i>Edit</a>
                            </div><!-- end card-body -->
                        </div><!-- end card -->
                        <div class="card card-item">
                            <div class="card-body">
                                <h3 class="card-title fs-22 pb-3">Order Summary</h3>
                                <div class="divider"><span></span></div>
                                <ul class="generic-list-item generic-list-item-flash fs-15">
                                    <!-- <li class="d-flex align-items-center justify-content-between font-weight-semi-bold">
                                        <span class="text-black">Original price:</span>
                                        <span id="originalPrice">₹{{ $total }}</span>
                                        <input type="hidden" name="original_price" value="{{ $total }}" />
                                    </li> -->

                                    <!-- <li class="mt-3">
                                        <div id="couponAreaCheckout">
                                            @foreach ($cart as $item)
                                                <input type="hidden" class="coupon-course-id" name="course_id[]"
                                                    value="{{ $item->course->id }}">
                                                <input type="hidden" class="coupon-instructor-id" name="instructor_id[]"
                                                    value="{{ $item->course->user->id }}">
                                            @endforeach
                                            <div class="input-group">
                                                <input class="form-control form--control pl-3" type="text" name="coupon"
                                                    id="couponInput" placeholder="Coupon Code">
                                                <div class="input-group-append">
                                                    <button type="button" id="applyCouponBtnCheckout"
                                                        class="btn theme-btn">Apply</button>
                                                </div>
                                            </div>
                                        </div>
                                    </li> -->

                                    <li id="couponDiscountItem"
                                        class="d-flex align-items-center justify-content-between font-weight-semi-bold"
                                        style="{{ session()->get('coupon') ? '' : 'display: none !important' }}">
                                        <span class="text-black">Coupon discounts:
                                            <a href="javascript:void(0)" id="removeCouponCheckout" class="text-danger ml-1"
                                                title="Remove Coupon"><i class="la la-times-circle"></i></a>
                                        </span>
                                        <span id="couponDiscountAmount">
                                            @if (session()->get('coupon'))
                                                -₹{{ session()->get('coupon') }}
                                            @else
                                                -₹0
                                            @endif
                                        </span>
                                    </li>
                                    <li class="d-flex align-items-center justify-content-between font-weight-bold">
                                        <span class="text-black">Total:</span>
                                        <span id="checkoutTotalAmount">₹{{ $total - session()->get('coupon') }}</span>
                                        <input type="hidden" name="total_price" id="totalPriceInput"
                                            value="{{ $total - session()->get('coupon') }}" />
                                    </li>
                                </ul>
                                <div class="btn-box border-top border-top-gray pt-3">
                                    <p class="fs-14 lh-22 mb-2">SkillPoint is required by law to collect applicable
                                        transaction
                                        taxes for purchases made in certain tax jurisdictions.</p>
                                    <p class="fs-14 lh-22 mb-3">By completing your purchase you agree to these <a href="#"
                                            class="text-color hover-underline">Terms of Service.</a></p>
                                    <button type="submit" class="btn theme-btn w-100">Proceed <i
                                            class="la la-arrow-right icon ml-1"></i></button>
                                </div>
                            </div><!-- end card-body -->
                        </div><!-- end card -->
                    </div><!-- end col-lg-5 -->
                </div><!-- end row -->
            </div><!-- end container -->
        </section>

    </form>
@endsection




@push('scripts')
    <script>
        $(document).ready(function () {
            // Update header cart on page load
            if (typeof getCart === 'function') {
                getCart();
            }

            $('#applyCouponBtnCheckout').click(function () {
                let coupon = $('#couponInput').val();
                let courseIds = $('.coupon-course-id').map(function () { return $(this).val(); }).get();
                let instructorIds = $('.coupon-instructor-id').map(function () { return $(this).val(); }).get();

                $.ajax({
                    url: "/apply-coupon",
                    type: "POST",
                    data: {
                        coupon: coupon,
                        course_id: courseIds,
                        instructor_id: instructorIds
                    },
                    success: function (response) {
                        let totalDiscount = response.discounts.reduce((sum, item) => {
                            return sum + parseFloat(item.discount);
                        }, 0);

                        // Update UI
                        $('#couponDiscountAmount').text(`-₹${totalDiscount.toFixed(2)}`);
                        $('#couponDiscountItem').show();

                        let originalPrice = parseFloat("{{ $total }}");
                        let finalAmount = originalPrice - totalDiscount;

                        $('#checkoutTotalAmount').text(`₹${finalAmount.toFixed(2)}`);
                        $('#totalPriceInput').val(finalAmount.toFixed(2));

                        $('#couponAreaCheckout').fadeOut();

                        Swal.fire({
                            position: 'top-end',
                            icon: 'success',
                            title: 'Coupon applied successfully!',
                            showConfirmButton: false,
                            toast: true,
                            timer: 3000,
                            background: '#7079e7',
                            color: '#fff'
                        });
                    },
                    error: function (xhr) {
                        let message = 'Coupon could not be applied.';
                        if (xhr.status === 422) {
                            let errors = xhr.responseJSON.errors;
                            message = Object.values(errors).flat().join('<br>');
                        } else if (xhr.responseJSON && xhr.responseJSON.message) {
                            message = xhr.responseJSON.message;
                        }

                        // Hide discount on error as requested ("destroy the discount price")
                        $('#couponDiscountItem').hide();
                        let originalPrice = parseFloat("{{ $total }}");
                        $('#checkoutTotalAmount').text(`₹${originalPrice.toFixed(2)}`);
                        $('#totalPriceInput').val(originalPrice.toFixed(2));

                        Swal.fire({
                            position: 'top-end',
                            icon: 'error',
                            title: 'Oops...',
                            html: message,
                            toast: true,
                            timer: 3000,
                            showConfirmButton: false,
                            background: '#f27474',
                            color: '#fff'
                        });
                    }
                });
            });

            // Coupon Remove
            $(document).on('click', '#removeCouponCheckout', function () {
                $.ajax({
                    url: "/coupon-remove",
                    type: "GET",
                    success: function (response) {
                        $('#couponDiscountItem').hide();
                        $('#couponDiscountAmount').text('-₹0');

                        let originalPrice = parseFloat("{{ $total }}");
                        $('#checkoutTotalAmount').text(`₹${originalPrice.toFixed(2)}`);
                        $('#totalPriceInput').val(originalPrice.toFixed(2));

                        $('#couponAreaCheckout').fadeIn();
                        $('#couponInput').val('');

                        Swal.fire({
                            position: 'top-end',
                            icon: 'success',
                            title: response.success,
                            showConfirmButton: false,
                            toast: true,
                            timer: 3000,
                            background: '#7079e7',
                            color: '#fff'
                        });
                    }
                });
            });
        });
    </script>
@endpush