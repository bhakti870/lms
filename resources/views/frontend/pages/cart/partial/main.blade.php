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
                                        <a href="course-details.html" class="media-img mr-0">
                                            <img src="{{ asset($item->course->course_image) }}" alt="Cart image">
                                        </a>
                                    </div>
                                </th>
                                <td>
                                    <a href="course-details.html"
                                        class="text-black font-weight-semi-bold">{{ $item->course->course_name }}</a>
                                    <p class="fs-14 text-gray lh-20">By <a href="teacher-detail.html"
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
                    <form id="couponForm">
                        @csrf
                        @foreach ($cart as $item)
                            <input type="hidden" name="course_id[]" value="{{ $item->course->id }}">
                            <input type="hidden" name="instructor_id[]" value="{{ $item->course->user->id }}">
                        @endforeach

                        @if (!session()->get('coupon'))
                            <div class="input-group mb-2">
                                <input class="form-control form--control pl-3" type="text" name="coupon"
                                    id="couponInput" placeholder="Enter Coupon Code">
                                <div class="input-group-append">
                                    <button type="button" id="applyCouponBtn" class="btn theme-btn">
                                        Apply Code
                                    </button>
                                </div>
                            </div>
                        @endif
                    </form>
                    <a href="#" class="btn theme-btn mb-2 sr-only">Update Cart</a>
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
                            <span id="subTotalValue">₹{{ $subTotal }}</span> <!-- Update ID for easy targeting -->
                        </li>



                        <!-- Total Discount -->


                        <li id="totalDiscountItem"
                            class="d-flex align-items-center justify-content-between font-weight-semi-bold" 
                            style="{{ session()->has('coupon') ? '' : 'display: none !important' }}">
                            <span class="text-black">Total Discount: 
                                <a href="javascript:void(0)" id="removeCoupon" class="text-danger ml-1" title="Remove Coupon"><i class="la la-times-circle"></i></a>
                            </span>
                            <span id="totalDiscount">
                                -₹{{ session()->get('coupon') ?? '0.00' }}
                            </span>
                        </li>

                        <li class="d-flex align-items-center justify-content-between font-weight-semi-bold">
                            <span class="text-black">Total:</span>
                            <span id="totalAmount">
                                ₹{{ $subTotal - (session()->get('coupon') ?? 0) }}
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
        $('#applyCouponBtn').click(function() {
            let formData = $('#couponForm').serialize(); // Serialize form data

            $.ajax({
                url: "/apply-coupon", // Replace with your route name
                type: "POST",
                data: formData,
                success: function(response) {
                    let totalDiscount = response.discounts.reduce((sum, item) => {
                        return sum + parseFloat(item.discount); 
                    }, 0);

                    $('#totalDiscount').text(`-₹${totalDiscount.toFixed(2)}`);
                    $('#totalDiscountItem').show(); 

                    let subTotal = parseFloat("{{ $subTotal }}");
                    let totalAmount = subTotal - totalDiscount;
                    $('#totalAmount').text(`₹${totalAmount.toFixed(2)}`);

                    $('#couponForm').hide(); 

                    Swal.fire({
                        position: 'top-end',
                        icon: 'success',
                        title: 'Coupon applied successfully!',
                        showConfirmButton: false,
                        toast: true,
                        timer: 3000,
                        background: '#28a745',
                        color: '#fff'
                    });
                },
                error: function(xhr) {
                    let errorMessage = 'Coupon not applied successfully!';
                    
                    if (xhr.status === 422) {
                        let errors = xhr.responseJSON.errors;
                        errorMessage = '';
                        for (let field in errors) {
                            errorMessage += errors[field].join('<br>') + '<br>';
                        }
                    } else if (xhr.responseJSON && xhr.responseJSON.message) {
                        errorMessage = xhr.responseJSON.message;
                    }

                    // On error, we should make sure the discount is not displayed if it's invalid
                    // However, if there was a previous valid coupon, we might want to keep it.
                    // But usually, an invalid attempt shouldn't destroy the current one unless specified.
                    // "destroy the discount price not dispaly yet" -> maybe hide it on error?
                    // $('#totalDiscountItem').hide(); // Uncomment if requirement is strictly hide on error

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

        // Coupon Remove
        $(document).on('click', '#removeCoupon', function() {
            $.ajax({
                url: "/coupon-remove",
                type: "GET",
                success: function(response) {
                    $('#totalDiscountItem').hide();
                    $('#totalDiscount').text('₹0.00');
                    
                    let subTotal = parseFloat("{{ $subTotal }}");
                    $('#totalAmount').text(`₹${subTotal.toFixed(2)}`);
                    
                    $('#couponForm').show();
                    $('#couponInput').val('');

                    Swal.fire({
                        position: 'top-end',
                        icon: 'success',
                        title: response.success,
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
