{{-- <section class="course-area pb-120px">
    <div class="container">
        <div class="section-heading text-center">
            <h5 class="ribbon ribbon-lg mb-2">Choose your desired courses</h5>
            <h2 class="section__title">The world's largest selection of courses</h2>
            <span class="section-divider"></span>
        </div><!-- end section-heading -->

        <ul class="nav nav-tabs generic-tab justify-content-center pb-4" id="myTab" role="tablist">

            @foreach ($categories as $index => $item)
            <li class="nav-item">
                <button class="nav-link {{ $index == 0 ? 'active' : '' }}" id="{{ $item->slug }}-tab"
                    data-bs-toggle="tab" data-bs-target="#{{ $item->slug }}" type="button" role="tab"
                    aria-controls="{{ $item->slug }}" aria-selected="{{ $index == 0 ? 'true' : 'false' }}">{{
                    $item->name }}</button>
            </li>
            @endforeach

        </ul>
    </div><!-- end container -->
    <div class="card-content-wrapper bg-gray pt-50px pb-120px">
        <div class="container">
            <div class="tab-content" id="myTabContent">

                @foreach ($course_category as $index => $data)
                <div class="tab-pane fade {{ $index == 0 ? 'show active' : '' }}" id="{{ $data->slug }}" role="tabpanel"
                    aria-labelledby="{{ $data->slug }}-tab">
                    <div class="row">

                        @foreach ($data['course'] as $course)
                        <div class="col-lg-4 responsive-column-half">
                            <div class="card card-item card-preview"
                                data-tooltip-content="#{{ $course->course_name_slug }}">
                                <div class="card-image">
                                    <a href="{{ route('course-details', $course->course_name_slug) }}" class="d-block">

                                        <img class="card-img-top lazy" width="240" height="240"
                                            src="{{ asset($course->course_image) }}"
                                            data-src="{{ asset($course->course_image) }}" alt="Card image cap">

                                    </a>
                                    <div class="course-badge-labels">
                                        <div class="course-badge">

                                            @if ($course->bestseller == 'yes')
                                            Bestseller
                                            @elseif($course->featured == 'yes')
                                            Featured
                                            @else
                                            HighestRated
                                            @endif

                                        </div>
                                        <div class="course-badge blue">

                                            -{{ round((($course->selling_price - $course->discount_price) /
                                            $course->selling_price) * 100) }}%

                                        </div>
                                    </div>
                                </div><!-- end card-image -->
                                <div class="card-body">
                                    <h6 class="ribbon ribbon-blue-bg fs-14 mb-3">All Levels</h6>

                                    <h5 class="card-title">
                                        <a href="{{ route('course-details', $course->course_name_slug) }}">
                                            {{ \Illuminate\Support\Str::limit($course->course_name, 50) }}
                                        </a>
                                    </h5>

                                    <p class="card-text">
                                        <a href="#">
                                            {{ $course['user']['name'] }}
                                        </a>
                                    </p>
                                    <div class="rating-wrap d-flex align-items-center py-2">
                                        <div class="review-stars">
                                            <span class="rating-number">4.4</span>
                                            <span class="la la-star"></span>
                                            <span class="la la-star"></span>
                                            <span class="la la-star"></span>
                                            <span class="la la-star"></span>
                                            <span class="la la-star-o"></span>
                                        </div>
                                        <span class="rating-total pl-1">(20,230)</span>
                                    </div><!-- end rating-wrap -->
                                    <div class="d-flex justify-content-between align-items-center">

                                        <p class="card-price text-black font-weight-bold">
                                            ₹{{ $course->discount_price }} <span
                                                class="before-price font-weight-medium">₹{{ $course->selling_price
                                                }}</span>
                                        </p>


                                        <div class="icon-element icon-element-sm shadow-sm cursor-pointer wishlist-icon"
                                            title="Add to Wishlist" data-course-id="{{ $course->id }}">

                                            <?php
                                                    $isEnrolled = false;
                                                    $inCart = false;
                                                    $isWishlisted = false;

                                                    if (auth()->check()) {
                                                        $user_id = auth()->user()->id;
                                                        $isEnrolled = \App\Models\Enrollment::where('user_id', $user_id)->where('course_id', $course->id)->exists();
                                                        $inCart = \App\Models\Cart::where('user_id', $user_id)->where('course_id', $course->id)->exists();
                                                        $isWishlisted = \App\Models\Wishlist::where('user_id', $user_id)->where('course_id', $course->id)->first();
                                                    }
                                                    ?>

                                            @if ($isEnrolled)
                                            <i class="la la-graduation-cap" title="You purchased this course"></i>
                                            @elseif ($isWishlisted)
                                            <i class="la la-heart" title="Already in Wishlist"></i>
                                            @else
                                            <i class="la la-heart-o"
                                                title="{{ $inCart ? 'Already in Cart' : 'Add to Wishlist' }}"></i>
                                            @endif



                                        </div>




                                    </div>
                                </div><!-- end card-body -->
                            </div><!-- end card -->
                        </div><!-- end col-lg-4 -->
                        @endforeach


                    </div><!-- end row -->
                </div><!-- end tab-pane -->
                @endforeach

            </div><!-- end tab-content -->
            <div class="more-btn-box mt-4 text-center">
                <a href="{{ route('all.courses') }}" class="btn theme-btn">Browse all Courses <i
                        class="la la-arrow-right icon ml-1"></i></a>
            </div><!-- end more-btn-box -->
        </div><!-- end container -->
    </div><!-- end card-content-wrapper -->
</section> --}}
<!-- end courses-area -->


<section class="courses-section py-5">
    <div class="container" data-aos="fade-up" data-aos-delay="200">

        <div class="d-flex justify-content-between align-items-end mb-5">
            <div>
                <span class="text-theme fw-bold text-uppercase small">Top Notch</span>
                <h2 class="fw-bold mb-0">Our Popular Courses</h2>
            </div>
            <a href="#" class="btn btn-outline-theme d-none d-sm-inline-block">View All Courses</a>
        </div>

        <div class="row g-4">

            <div class="col-lg-3 col-md-6">
                <div class="course-product-card">

                    <div class="cp-img-wrapper">
                        <img src="./upload/course/67b93abb78dce.jpg" class="img-front" alt="Course Front">

                        <img src="./upload/course/67b93baab82f7.jpg" class="img-back" alt="Course Back">


                        <div class="cp-hover-info">
                            <div class="d-flex align-items-center gap-2 mb-1">
                                <i class="bi bi-person-circle text-theme"></i>
                                <span class="small fw-bold">Jeff Way</span>
                            </div>
                            <div class="d-flex align-items-center gap-2">
                                <i class="bi bi-bar-chart-fill text-theme"></i>
                                <span class="small">Intermediate</span>
                            </div>
                        </div>
                    </div>

                    <div class="cp-content">
                        <h5 class="cp-title"><a href="#">Application Development</a></h5>

                        <div class="cp-rating mb-2">
                            <i class="bi bi-star-fill text-warning"></i>
                            <i class="bi bi-star-fill text-warning"></i>
                            <i class="bi bi-star-fill text-warning"></i>
                            <i class="bi bi-star-fill text-warning"></i>
                            <i class="bi bi-star-half text-warning"></i>
                            <span class="text-muted ms-1 small">(4.8)</span>
                        </div>

                        <div class="d-flex justify-content-between align-items-center mt-3">
                            <div class="cp-price">
                                <span class="old-price">$15.00</span>
                                <span class="new-price">$12.00</span>
                            </div>

                            <div class="cp-actions">
                                <button class="btn btn-sm btn-theme-icon" title="Add to Cart">
                                    <i class="bi bi-basket2-fill"></i>
                                </button>
                                <button class="btn btn-sm btn-theme-icon" title="Wishlist">
                                    <i class="bi bi-heart"></i>
                                </button>
                            </div>
                        </div>
                    </div>

                </div>
            </div>

            <div class="col-lg-3 col-md-6">
                <div class="course-product-card">
                    <div class="cp-img-wrapper">
                        <img src="cover1.jpg" class="img-front" alt="Course Front">
                        <img src="cover2.jpg" class="img-back" alt="Course Back">
                        <div class="cp-hover-info">
                            <div class="d-flex align-items-center gap-2 mb-1">
                                <i class="bi bi-person-circle text-theme"></i>
                                <span class="small fw-bold">Alex Brown</span>
                            </div>
                            <div class="d-flex align-items-center gap-2">
                                <i class="bi bi-bar-chart-fill text-theme"></i>
                                <span class="small">Beginner</span>
                            </div>
                        </div>
                    </div>
                    <div class="cp-content">
                        <h5 class="cp-title"><a href="#">Python for Data Science</a></h5>
                        <div class="cp-rating mb-2">
                            <i class="bi bi-star-fill text-warning"></i>
                            <i class="bi bi-star-fill text-warning"></i>
                            <i class="bi bi-star-fill text-warning"></i>
                            <i class="bi bi-star-fill text-warning"></i>
                            <i class="bi bi-star text-warning"></i>
                            <span class="text-muted ms-1 small">(4.0)</span>
                        </div>
                        <div class="d-flex justify-content-between align-items-center mt-3">
                            <div class="cp-price">
                                <span class="old-price">$89.00</span>
                                <span class="new-price">$49.00</span>
                            </div>
                            <div class="cp-actions">
                                <button class="btn btn-sm btn-theme-icon"><i class="bi bi-basket2-fill"></i></button>
                                <button class="btn btn-sm btn-theme-icon"><i class="bi bi-heart"></i></button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-3 col-md-6">
                <div class="course-product-card">
                    <div class="cp-img-wrapper">
                        <img src="cover1.jpg" class="img-front" alt="Course Front">
                        <img src="cover2.jpg" class="img-back" alt="Course Back">
                        <div class="cp-hover-info">
                            <div class="d-flex align-items-center gap-2 mb-1">
                                <i class="bi bi-person-circle text-theme"></i>
                                <span class="small fw-bold">Sarah Jenkins</span>
                            </div>
                            <div class="d-flex align-items-center gap-2">
                                <i class="bi bi-bar-chart-fill text-theme"></i>
                                <span class="small">Advanced</span>
                            </div>
                        </div>
                    </div>
                    <div class="cp-content">
                        <h5 class="cp-title"><a href="#">UI/UX Design Masterclass</a></h5>
                        <div class="cp-rating mb-2">
                            <i class="bi bi-star-fill text-warning"></i>
                            <i class="bi bi-star-fill text-warning"></i>
                            <i class="bi bi-star-fill text-warning"></i>
                            <i class="bi bi-star-fill text-warning"></i>
                            <i class="bi bi-star-fill text-warning"></i>
                            <span class="text-muted ms-1 small">(5.0)</span>
                        </div>
                        <div class="d-flex justify-content-between align-items-center mt-3">
                            <div class="cp-price">
                                <span class="old-price">$35.00</span>
                                <span class="new-price">$25.00</span>
                            </div>
                            <div class="cp-actions">
                                <button class="btn btn-sm btn-theme-icon"><i class="bi bi-basket2-fill"></i></button>
                                <button class="btn btn-sm btn-theme-icon"><i class="bi bi-heart"></i></button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-3 col-md-6">
                <div class="course-product-card">
                    <div class="cp-img-wrapper">
                        <img src="cover1.jpg" class="img-front" alt="Course Front">
                        <img src="cover2.jpg" class="img-back" alt="Course Back">
                        <div class="cp-hover-info">
                            <div class="d-flex align-items-center gap-2 mb-1">
                                <i class="bi bi-person-circle text-theme"></i>
                                <span class="small fw-bold">Luke Down</span>
                            </div>
                            <div class="d-flex align-items-center gap-2">
                                <i class="bi bi-bar-chart-fill text-theme"></i>
                                <span class="small">Intermediate</span>
                            </div>
                        </div>
                    </div>
                    <div class="cp-content">
                        <h5 class="cp-title"><a href="#">ReactJS from Scratch</a></h5>
                        <div class="cp-rating mb-2">
                            <i class="bi bi-star-fill text-warning"></i>
                            <i class="bi bi-star-fill text-warning"></i>
                            <i class="bi bi-star-fill text-warning"></i>
                            <i class="bi bi-star-half text-warning"></i>
                            <i class="bi bi-star text-warning"></i>
                            <span class="text-muted ms-1 small">(3.9)</span>
                        </div>
                        <div class="d-flex justify-content-between align-items-center mt-3">
                            <div class="cp-price">
                                <span class="old-price">$120.00</span>
                                <span class="new-price">$99.00</span>
                            </div>
                            <div class="cp-actions">
                                <button class="btn btn-sm btn-theme-icon"><i class="bi bi-basket2-fill"></i></button>
                                <button class="btn btn-sm btn-theme-icon"><i class="bi bi-heart"></i></button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>

        <div class="text-center mt-4 d-block d-sm-none">
            <a href="#" class="btn btn-outline-theme w-100">View All Courses</a>
        </div>
    </div>
</section>