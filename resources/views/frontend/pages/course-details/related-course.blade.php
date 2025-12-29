<section class="related-course-area bg-light rounded-4 p-4">
    <div class="">
        <div class="related-course-wrap">

            <h3 class="fs-28 font-weight-semi-bold pb-35px">More Courses by <a href="#"
                    class="text-color hover-underline">{{ $course->user->name }}</a></h3>

            <div class="row">

                @forelse ($more_course_instructor as $course)
                    <div class="col-lg-4 col-md-6 mb-4">
                        <div class="card card-item card-preview" data-tooltip-content="#tooltip_content_{{ $course->id }}">
                             <div class="card-image">
                                <a href="{{ route('course-details', $course->course_name_slug) }}" class="d-block">
                                    <img class="card-img-top lazy" src="{{ asset($course->course_image) }}" data-src="{{ asset($course->course_image) }}" alt="{{ $course->course_name }}" style="height: 240px; object-fit: cover;">
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
                                            <i class="la {{ \App\Models\Wishlist::where('user_id', auth()->id())->where('course_id', $course->id)->exists() ? 'la-heart' : 'la-heart-o' }}"></i>
                                        </div>
                                         <div class="icon-element icon-element-sm shadow-sm cursor-pointer add-to-cart-btn" title="Add to Cart" data-course-id="{{ $course->id }}">
                                            <i class="la la-shopping-cart"></i>
                                        </div>
                                    </div>
                                </div>
                            </div><!-- end card-body -->
                        </div><!-- end card -->
                    </div>
                @empty
                    <div class="col-12">
                         <h4>No Course Found</h4>
                    </div>
                @endforelse

            </div><!-- end row -->
        </div><!-- end related-course-wrap -->
    </div><!-- end wrapper -->
</section><!-- end related-course-area -->
