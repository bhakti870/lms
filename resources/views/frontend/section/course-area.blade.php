<section class="course-area pb-90px">
    <div class="course-wrapper">
        <div class="container">
            <div class="section-heading text-center">
                <h5 class="ribbon ribbon-lg mb-2">Learn on your schedule</h5>
                <h2 class="section__title">Students are viewing</h2>
                <span class="section-divider"></span>
            </div><!-- end section-heading -->
            <div class="course-carousel owl-action-styled owl--action-styled mt-30px">
                @foreach($featured_courses as $course)
                <div class="card card-item card-preview" data-tooltip-content="#tooltip_content_{{ $course->id }}">
                    <div class="card-image">
                        <a href="{{ route('course-details', $course->course_name_slug) }}" class="d-block">
                             <img class="card-img-top" src="{{ $course->course_image ? asset($course->course_image) : 'https://placehold.co/240x160/5b50d6/ffffff?text='.urlencode($course->course_name) }}" alt="{{ $course->course_name }}" style="height: 240px; object-fit: cover;">
                        </a>
                        <div class="course-badge-labels">
                            @if($course->bestseller == 'yes')
                                <div class="course-badge">Bestseller</div>
                            @endif
                            @if($course->discount_price > 0)
                                @php
                                    $amount = $course->selling_price - $course->discount_price;
                                    $discount = ($amount / $course->selling_price) * 100;
                                @endphp
                                <div class="course-badge blue">-{{ round($discount) }}%</div>
                            @endif
                             @if($course->selling_price == 0)
                                <div class="course-badge green">Free</div>
                            @endif
                        </div>
                    </div><!-- end card-image -->
                    <div class="card-body">
                        <h6 class="ribbon ribbon-blue-bg fs-14 mb-3">{{ $course->label ?? 'All Levels' }}</h6>
                        <h5 class="card-title">
                            <a href="{{ route('course-details', $course->course_name_slug) }}">{{ Str::limit($course->course_name, 50) }}</a>
                        </h5>
                        <p class="card-text">
                            <a href="{{ route('instructor.details', $course->user->id) }}">{{ $course->user->name }}</a>
                        </p>
                        <div class="rating-wrap d-flex align-items-center py-2">
                            <div class="review-stars">
                                <span class="rating-number">{{ number_format($course->reviews->avg('rating'), 1) }}</span>
                                @php
                                    $rating = $course->reviews->avg('rating');
                                @endphp
                                @for($i=1; $i<=5; $i++)
                                    @if($i <= $rating)
                                        <span class="la la-star"></span>
                                    @elseif($i > $rating && $i - 1 < $rating)
                                         <span class="la la-star-half-o"></span>
                                    @else
                                        <span class="la la-star-o"></span>
                                    @endif
                                @endfor
                            </div>
                            <span class="rating-total pl-1">({{ $course->reviews->count() }})</span>
                        </div><!-- end rating-wrap -->
                        <div class="d-flex justify-content-between align-items-center">
                            @if($course->discount_price > 0)
                                <p class="card-price text-black font-weight-bold">₹{{ $course->discount_price }} <span class="before-price font-weight-medium">₹{{ $course->selling_price }}</span></p>
                            @elseif($course->selling_price > 0)
                                <p class="card-price text-black font-weight-bold">₹{{ $course->selling_price }}</p>
                            @else
                                <p class="card-price text-black font-weight-bold">Free</p>
                            @endif
                            
                            <div class="d-flex gap-2">
                                <div class="icon-element icon-element-sm shadow-sm cursor-pointer wishlist-icon" title="Add to Wishlist" data-course-id="{{ $course->id }}">
                                    <i class="la la-heart-o"></i>
                                </div>
                                <div class="icon-element icon-element-sm shadow-sm cursor-pointer add-to-cart-btn" title="Add to Cart" data-course-id="{{ $course->id }}">
                                    <i class="la la-shopping-cart"></i>
                                </div>
                            </div>
                        </div>
                    </div><!-- end card-body -->
                </div><!-- end card -->
                @endforeach
            </div><!-- end course-carousel -->
            
            <div class="text-center mt-5">
                <a href="{{ route('all.courses') }}" class="btn btn-theme">Browse All Courses</a>
            </div>
        </div><!-- end container -->
    </div><!-- end course-wrapper -->
</section><!-- end courses-area -->
