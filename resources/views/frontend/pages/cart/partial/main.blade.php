<section class="cart-area section-padding">
    <div class="container">
        <div id="cart-section">

            <div class="table-responsive">
                <table class="table generic-table">
                    <thead>
                        <tr>
                            <th scope="col">Image</th>
                            <th scope="col">Product Details</th>
                            <th scope="col">Price</th>

                            <th scope="col">Action</th>
                        </tr>
                    </thead>
                    <tbody>

                        @forelse($cart as $item)
                            <tr>
                                <th scope="row">
                                    <div class="media media-card">
                                        <a href="{{ route('course-details', $item->course->course_name_slug) }}" class="media-img mr-0">
                                            <img src="{{ asset($item->course->course_image) }}" alt="Cart image">
                                        </a>
                                    </div>
                                </th>
                                <td>
                                    <a href="{{ route('course-details', $item->course->course_name_slug) }}"
                                        class="text-black font-weight-semi-bold">{{ $item->course->course_name }}</a>
                                    <p class="fs-14 text-gray lh-20">By <a href="{{ route('instructor.details', $item->course->user->id) }}"
                                            class="text-color hover-underline">{{ $item->course->user->name }}</a>,{{ $item->course->course_title }}
                                        &amp; More!</p>
                                </td>
                                <td>
                                    <ul class="generic-list-item font-weight-semi-bold">
                                        @if($item->course->discount_price > 0)
                                            <li class="text-black lh-18">₹{{ $item->course->discount_price }}</li>
                                            <li class="before-price lh-18">₹{{ $item->course->selling_price }}</li>
                                        @else
                                            <li class="text-black lh-18">₹{{ $item->course->selling_price }}</li>
                                        @endif
                                    </ul>
                                </td>

                                <td>

                                    <button type="button"
                                        class="remove-course-btn icon-element icon-element-xs shadow-sm border-0"
                                        data-id="{{ $item->id }}" data-toggle="tooltip" data-placement="top"
                                        title="Remove">
                                        <i class="la la-times"></i>
                                    </button>

                                </td>
                            </tr>

                        @empty
                            <td colspan="3">No Data Found</td>
                        @endforelse




                    </tbody>
                </table>


                <div class="d-flex flex-wrap align-items-center justify-content-between pt-4">
                    <form id="couponForm" style="{{ count(session()->get('applied_coupon_names', [])) >= 2 ? 'display: none;' : '' }}">
                        @csrf
                        @foreach ($cart as $item)
                            <input type="hidden" name="course_id[]" value="{{ $item->course->id }}">
                            <input type="hidden" name="instructor_id[]" value="{{ $item->course->user->id }}">
                        @endforeach

                        <div class="input-group mb-2">
                            <input class="form-control form--control pl-3" type="text" name="coupon"
                                id="couponInput" placeholder="Enter Coupon Code">
                            <div class="input-group-append">
                                <button type="button" id="applyCouponBtn" class="btn theme-btn">
                                    Apply Code
                                </button>
                            </div>
                        </div>
                    </form>
                </div>

                <!-- Error/Success Message -->
                <div id="couponMessage" class="mt-2"></div>

            </div>
            <div class="col-lg-4 ml-auto">
                <div class="bg-gray p-4 rounded-rounded mt-40px">
                    <h3 class="fs-18 font-weight-bold pb-3">Cart Totals</h3>
                    <div class="divider"><span></span></div>

                    <ul class="generic-list-item pb-4">
                        <li class="d-flex align-items-center justify-content-between font-weight-semi-bold">
                            <span class="text-black">Subtotal:</span>
                            <span id="subTotalValue" data-value="{{ $subTotal }}">₹{{ $subTotal }}</span> 
                        </li>

                        <!-- Applied Coupons List -->
                        <div id="appliedCouponsList">
                            @php
                                $appliedCouponNames = session()->get('applied_coupon_names', []);
                                $couponDiscounts = session()->get('coupon_discounts', []);
                            @endphp
                            @foreach($couponDiscounts as $coupon)
                                <li class="d-flex align-items-center justify-content-between font-weight-semi-bold coupon-item" data-coupon="{{ $coupon['coupon'] }}">
                                    <span class="text-black">Coupon: <strong class="text-success">{{ $coupon['coupon'] }}</strong>
                                        <a href="javascript:void(0)" class="remove-specific-coupon text-danger ml-1" data-name="{{ $coupon['coupon'] }}" title="Remove Coupon">
                                            <i class="la la-times-circle"></i>
                                        </a>
                                    </span>
                                    <span class="text-success">-₹{{ number_format($coupon['discount'], 2) }}</span>
                                </li>
                            @endforeach
                        </div>

                        <li id="totalDiscountItem"
                            class="d-flex align-items-center justify-content-between font-weight-semi-bold" 
                            style="{{ session()->has('coupon') ? '' : 'display: none !important' }}">
                            <span class="text-black font-weight-bold">Total Discount:</span>
                            <span id="totalDiscount" class="text-danger font-weight-bold">
                                -₹{{ number_format(session()->get('coupon') ?? 0, 2) }}
                            </span>
                        </li>

                        <li class="d-flex align-items-center justify-content-between font-weight-semi-bold">
                            <span class="text-black">Total:</span>
                            <span id="totalAmount">
                                ₹{{ number_format($subTotal - (session()->get('coupon') ?? 0), 2) }}
                            </span>
                        </li>
                    </ul>

                    <a href="{{ route('checkout.index') }}" class="btn theme-btn w-100">Checkout <i
                            class="la la-arrow-right icon ml-1"></i></a>
                </div>
            </div>

        </div>

    </div><!-- end container -->
</section>

<script>
    $(document).ready(function() {
        // Apply Coupon
        $('#applyCouponBtn').off('click').on('click', function() {
            let formData = $('#couponForm').serialize(); 

            $.ajax({
                url: "/apply-coupon", 
                type: "POST",
                data: formData,
                success: function(response) {
                    // Refresh cart partial to get updated list and values
                    fetchCart(); 

                    Swal.fire({
                        position: 'top-end',
                        icon: 'success',
                        title: response.message || 'Coupon applied successfully!',
                        showConfirmButton: false,
                        toast: true,
                        timer: 3000,
                        background: '#28a745',
                        color: '#fff'
                    });
                },
                error: function(xhr) {
                    let errorMessage = 'Coupon not applied successfully!';
                    if (xhr.responseJSON && xhr.responseJSON.message) {
                        errorMessage = xhr.responseJSON.message;
                    }
                    Swal.fire({
                        position: 'top-end',
                        icon: 'error',
                        title: 'Oops...',
                        html: errorMessage,
                        showConfirmButton: false,
                        toast: true,
                        timer: 3000,
                        background: '#dc3545',
                        color: '#fff'
                    });
                }
            });
        });

        // Remove Specific Coupon
        $(document).off('click', '.remove-specific-coupon').on('click', '.remove-specific-coupon', function () {
            let couponName = $(this).data('name');

            $.ajax({
                url: "/coupon-remove",
                type: "GET",
                data: { coupon_name: couponName },
                success: function (response) {
                    // Refresh cart partial
                    fetchCart();

                    Swal.fire({
                        position: 'top-end',
                        icon: 'success',
                        title: response.message,
                        showConfirmButton: false,
                        toast: true,
                        timer: 3000,
                        background: '#28a745',
                        color: '#fff'
                    });
                }
            });
        });
    });
</script>
