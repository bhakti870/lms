<div class="sidebar-widget p-0 border-0 bg-transparent">
    <div class="card border-0 shadow-lg rounded-4 overflow-hidden sticky-top" style="top: 100px; z-index: 900;">
        {{-- Video Preview --}}
        <div class="position-relative">
            <a href="javascript:void(0)" data-toggle="modal" data-target="#previewModal" class="d-block position-relative group-hover">
                <img src="{{ asset($course->course_image) }}" alt="course-img" class="w-100 object-fit-cover" style="height: 200px;">
                <div class="position-absolute top-0 start-0 w-100 h-100 bg-dark opacity-25 transition-all"></div>
                <div class="position-absolute top-50 start-50 translate-middle">
                    <div class="btn btn-white rounded-circle shadow-lg p-3 d-flex align-items-center justify-content-center" style="width: 60px; height: 60px;">
                        <i class="bi bi-play-fill fs-2 text-dark ms-1"></i>
                    </div>
                </div>
                <div class="position-absolute bottom-0 start-0 w-100 p-3 text-center text-white bg-gradient-to-t from-black-50">
                    <span class="fw-bold">Preview this course</span>
                </div>
            </a>
        </div>

        <div class="card-body p-4 bg-white">
            {{-- Price Section --}}
            <div class="d-flex align-items-end gap-2 mb-3">
                @if($course->discount_price)
                    <h2 class="fw-bold mb-0 text-dark">₹{{ $course->discount_price }}</h2>
                    <span class="text-decoration-line-through text-muted fs-5">₹{{ $course->selling_price }}</span>
                    @php
                        $discount = (($course->selling_price - $course->discount_price) / $course->selling_price) * 100;
                    @endphp
                    <span class="badge bg-danger bg-opacity-10 text-danger rounded-pill px-2 ms-auto">{{ round($discount) }}% OFF</span>
                @else
                    <h2 class="fw-bold mb-0 text-dark">₹{{ $course->selling_price }}</h2>
                @endif
            </div>

            <div class="text-danger small mb-4">
                <i class="bi bi-alarm me-1"></i> <span class="fw-bold">5 hours</span> left at this price!
            </div>

            {{-- Action Buttons --}}
            <div class="d-grid gap-2 mb-4">
                @php
                    $in_cart = false;
                    $in_wishlist = false;
                    
                    // Check cart using guest_token (same logic as CartRepository)
                    $guestToken = request()->cookie('guest_token');
                    if ($guestToken) {
                        $in_cart = \App\Models\Cart::where('guest_token', $guestToken)
                            ->where('course_id', $course->id)
                            ->exists();
                    }
                    
                    // Check wishlist for authenticated users
                    if (Auth::check()) {
                        $user_id = Auth::id();
                        $in_wishlist = \App\Models\Wishlist::where('user_id', $user_id)
                            ->where('course_id', $course->id)
                            ->exists();
                    }
                @endphp

                @if($is_enrolled)
                    <div class="d-grid gap-2">
                        @if($is_completed)
                            <div class="alert alert-success d-flex align-items-center mb-0 rounded-pill px-4">
                                <i class="bi bi-patch-check-fill me-2 fs-4"></i>
                                <span class="fw-bold">You completed this course!</span>
                            </div>
                            <a href="{{ route('user.course.learn', $course->id) }}" class="btn btn-outline-dark btn-lg rounded-pill fw-bold">
                                Go to Course
                            </a>
                            <a href="{{ route('user.course.certificate', $course->id) }}" class="btn btn-theme btn-lg rounded-pill fw-bold">
                                <i class="bi bi-award me-1"></i> Download Certificate
                            </a>
                        @else
                            <a href="{{ route('user.course.learn', $course->id) }}" class="btn btn-dark btn-lg rounded-pill fw-bold">
                                Go to Course
                            </a>
                        @endif
                    </div>
                @elseif($in_cart)
                    <a href="{{ route('cart') }}" class="btn btn-dark btn-lg rounded-pill fw-bold">
                        Go to Cart
                    </a>
                @else
                    <button type="button" class="btn btn-theme btn-lg rounded-pill fw-bold add-to-cart-btn shadow-theme" data-course-id="{{ $course->id }}">
                        Add to Cart
                    </button>
                    <!-- <button type="button" class="btn btn-outline-dark btn-lg rounded-pill fw-bold buy-now-btn" data-course-id="{{ $course->id }}">
                        Buy Now
                    </button> -->
                @endif
            </div>

            <p class="text-center text-muted small mb-4">30-Day Money-Back Guarantee</p>

            {{-- Includes --}}
            <div class="mb-4">
                <h6 class="fw-bold mb-3">This course includes:</h6>
                <ul class="list-unstyled d-flex flex-column gap-2 small text-secondary">
                    <li class="d-flex align-items-center"><i class="bi bi-camera-video me-2 text-dark"></i> 24 hours on-demand video</li>
                    <li class="d-flex align-items-center"><i class="bi bi-file-earmark-text me-2 text-dark"></i> 15 articles</li>
                    <li class="d-flex align-items-center"><i class="bi bi-download me-2 text-dark"></i> 10 downloadable resources</li>
                    <li class="d-flex align-items-center"><i class="bi bi-infinity me-2 text-dark"></i> Full lifetime access</li>
                    <li class="d-flex align-items-center"><i class="bi bi-phone me-2 text-dark"></i> Access on mobile and TV</li>
                    <li class="d-flex align-items-center"><i class="bi bi-award me-2 text-dark"></i> Certificate of completion</li>
                </ul>
            </div>
                    </div>
    </div>
</div>
