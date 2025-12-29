@extends('frontend.master')

@section('content')
<section class="breadcrumb-area section-padding img-bg-2">
    <div class="overlay"></div>
    <div class="container">
        <div class="breadcrumb-content d-flex flex-wrap align-items-center justify-content-between">
            <div class="section-heading">
                <h2 class="section__title text-white">All Courses</h2>
            </div>
            <ul class="generic-list-item generic-list-item-white generic-list-item-arrow d-flex flex-wrap align-items-center">
                <li><a href="{{ url('/') }}">Home</a></li>
                <li>Courses</li>
            </ul>
        </div>
    </div>
</section>

<section class="course-area section--padding">
    <div class="container">
        <div class="row">
            <div class="col-lg-3">
                <div class="sidebar mb-5">
                    <form action="{{ route('all.courses') }}" method="GET">
                        
                        <div class="card card-item">
                            <div class="card-body">
                                <h3 class="card-title fs-18 pb-2">Search Filter</h3>
                                <div class="divider"><span></span></div>
                                
                                <div class="mb-3">
                                    <h4 class="fs-15 font-weight-semi-bold">Categories</h4>
                                    <div class="custom-control-group mt-2">
                                        @foreach($categories as $cat)
                                            <div class="custom-control custom-checkbox mb-2">
                                                <input type="checkbox" class="custom-control-input" id="catCheck{{ $cat->id }}" name="categories[]" value="{{ $cat->id }}" {{ in_array($cat->id, request('categories', [])) ? 'checked' : '' }}>
                                                <label class="custom-control-label" for="catCheck{{ $cat->id }}">
                                                    {{ $cat->name }} <span class="text-gray ml-1">({{ $cat->course_count }})</span>
                                                </label>
                                            </div>
                                        @endforeach
                                    </div>
                                </div>

                                <div class="mb-3">
                                    <h4 class="fs-15 font-weight-semi-bold">Instructors</h4>
                                    <div class="custom-control-group mt-2">
                                        @foreach($instructors as $instructor)
                                            <div class="custom-control custom-checkbox mb-2">
                                                <input type="checkbox" class="custom-control-input" id="instCheck{{ $instructor->id }}" name="instructors[]" value="{{ $instructor->id }}" {{ in_array($instructor->id, request('instructors', [])) ? 'checked' : '' }}>
                                                <label class="custom-control-label" for="instCheck{{ $instructor->id }}">
                                                    {{ $instructor->name }} <span class="text-gray ml-1">({{ $instructor->courses_count }})</span>
                                                </label>
                                            </div>
                                        @endforeach
                                    </div>
                                </div>

                                <div class="mb-3">
                                    <h4 class="fs-15 font-weight-semi-bold">Price</h4>
                                    <div class="custom-control-group mt-2">
                                        <div class="custom-control custom-radio mb-2">
                                            <input type="radio" class="custom-control-input" id="priceAll" name="price" value="" {{ request('price') == '' ? 'checked' : '' }}>
                                            <label class="custom-control-label" for="priceAll">All</label>
                                        </div>
                                        <div class="custom-control custom-radio mb-2">
                                            <input type="radio" class="custom-control-input" id="priceFree" name="price" value="free" {{ request('price') == 'free' ? 'checked' : '' }}>
                                            <label class="custom-control-label" for="priceFree">Free</label>
                                        </div>
                                        <div class="custom-control custom-radio mb-2">
                                            <input type="radio" class="custom-control-input" id="pricePaid" name="price" value="paid" {{ request('price') == 'paid' ? 'checked' : '' }}>
                                            <label class="custom-control-label" for="pricePaid">Paid</label>
                                        </div>
                                    </div>
                                </div>

                                <button type="submit" class="btn theme-btn w-100">Apply Filter</button>
                            </div>
                        </div>

                    </form>
                </div>
            </div>

            <div class="col-lg-9">
                <div class="filter-bar mb-4">
                    <div class="filter-bar-inner d-flex flex-wrap align-items-center justify-content-between">
                        <p class="fs-14">We found <span class="text-black font-weight-semi-bold">{{ $courses->total() }}</span> courses available for you</p>
                    </div>
                </div>

                <div class="row">
                    @foreach ($courses as $course)
                        <div class="col-lg-6 responsive-column-half">
                             <div class="card card-item card-preview" data-tooltip-content="#tooltip_{{ $course->id }}">
                                <div class="card-image">
                                    <a href="{{ route('course-details', $course->course_name_slug) }}" class="d-block">
                                        <img class="card-img-top lazy" src="{{ asset($course->course_image) }}" alt="{{ $course->course_name }}" style="height:250px; object-fit:cover;">
                                    </a>
                                    @if($course->bestseller == 'yes' || $course->featured == 'yes')
                                    <div class="course-badge-labels">
                                        <div class="course-badge border-0 {{ $course->bestseller == 'yes' ? '' : 'blue' }}">
                                            {{ $course->bestseller == 'yes' ? 'Bestseller' : 'Featured' }}
                                        </div>
                                    </div>
                                    @endif
                                </div>
                                <div class="card-body">
                                    <h6 class="ribbon ribbon-blue-bg fs-14 mb-3">{{ $course->label ?? 'All Levels' }}</h6>
                                    <h5 class="card-title">
                                        <a href="{{ route('course-details', $course->course_name_slug) }}">
                                            {{ \Illuminate\Support\Str::limit($course->course_name, 50) }}
                                        </a>
                                    </h5>
                                    <p class="card-text">
                                        <a href="#">{{ $course->user->name }}</a>
                                    </p>
                                    <div class="rating-wrap d-flex align-items-center py-2">
                                        <div class="review-stars">
                                            <span class="rating-number">4.5</span>
                                            <span class="la la-star"></span>
                                            <span class="la la-star"></span>
                                            <span class="la la-star"></span>
                                            <span class="la la-star"></span>
                                            <span class="la la-star-half-o"></span>
                                        </div>
                                        <span class="rating-total pl-1">(20)</span>
                                    </div>
                                    <div class="d-flex justify-content-between align-items-center">
                                        @if($course->discount_price > 0)
                                            <p class="card-price text-black font-weight-bold">
                                                ₹{{ $course->discount_price }} <span class="before-price font-weight-medium">₹{{ $course->selling_price }}</span>
                                            </p>
                                        @else
                                            <p class="card-price text-black font-weight-bold">
                                                ₹{{ $course->selling_price }}
                                            </p>
                                        @endif
                                        <div class="icon-element icon-element-sm shadow-sm cursor-pointer wishlist-icon" title="Add to Wishlist" data-course-id="{{ $course->id }}">
                                           <i class="la la-heart-o"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    @endforeach
                </div>
                
                <div class="text-center pt-3">
                     {{ $courses->withQueryString()->links('vendor.pagination.bootstrap-4') }}
                </div>
            </div>
        </div>
    </div>
</section>
@endsection