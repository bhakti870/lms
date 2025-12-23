@extends('frontend.master')

@section('content')
<section class="breadcrumb-area section-padding img-bg-2">
    <div class="overlay"></div>
    <div class="container">
        <div class="breadcrumb-content d-flex flex-wrap align-items-center justify-content-between">
            <div class="section-heading">
                <h2 class="section__title text-white">
                    @if(isset($category))
                        {{ $category->name }}
                    @elseif(isset($subcategory))
                        {{ $subcategory->name }}
                    @else
                        All Courses
                    @endif
                </h2>
            </div>
            <ul class="generic-list-item generic-list-item-white generic-list-item-arrow d-flex flex-wrap align-items-center">
                <li><a href="{{ url('/') }}">Home</a></li>
                <li>Courses</li>
                <li>
                    @if(isset($category))
                        {{ $category->name }}
                    @elseif(isset($subcategory))
                        {{ $subcategory->name }}
                    @else
                        All Courses
                    @endif
                </li>
            </ul>
        </div><!-- end breadcrumb-content -->
    </div><!-- end container -->
</section>

<section class="course-area section--padding">
    <div class="container">
        <div class="filter-bar mb-4">
            <div class="filter-bar-inner d-flex flex-wrap align-items-center justify-content-between">
                <p class="fs-14">We found <span class="text-black font-weight-semi-bold">{{ $courses->total() }}</span> courses available for you</p>
            </div><!-- end filter-bar-inner -->
        </div><!-- end filter-bar -->
        <div class="row">
            @foreach ($courses as $course)
                <div class="col-lg-4 responsive-column-half">
                    <div class="card card-item card-preview">
                        <div class="card-image">
                            <a href="{{ route('course-details', $course->course_name_slug) }}" class="d-block">
                                <img class="card-img-top lazy" src="{{ asset($course->course_image) }}" alt="{{ $course->course_name }}">
                            </a>
                            @if($course->bestseller == 'yes' || $course->featured == 'yes')
                            <div class="course-badge-labels">
                                <div class="course-badge border-0 {{ $course->bestseller == 'yes' ? '' : 'blue' }}">
                                    {{ $course->bestseller == 'yes' ? 'Bestseller' : 'Featured' }}
                                </div>
                            </div>
                            @endif
                        </div><!-- end card-image -->
                        <div class="card-body">
                            <h6 class="ribbon ribbon-blue-bg fs-14 mb-3">All Levels</h6>
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
                                @if($course->discount_price)
                                    <p class="card-price text-black font-weight-bold">
                                        ${{ $course->discount_price }} <span class="before-price font-weight-medium">${{ $course->selling_price }}</span>
                                    </p>
                                @else
                                    <p class="card-price text-black font-weight-bold">
                                        ${{ $course->selling_price }}
                                    </p>
                                @endif
                                <div class="icon-element icon-element-sm shadow-sm cursor-pointer wishlist-icon" title="Add to Wishlist" data-course-id="{{ $course->id }}">
                                    @php
                                        $isWishlisted = false;
                                        if (auth()->check()) {
                                            $isWishlisted = \App\Models\Wishlist::where('user_id', auth()->id())->where('course_id', $course->id)->exists();
                                        }
                                    @endphp
                                    @if ($isWishlisted)
                                        <i class="la la-heart"></i>
                                    @else
                                        <i class="la la-heart-o"></i>
                                    @endif
                                </div>
                            </div>
                        </div><!-- end card-body -->
                    </div><!-- end card -->
                </div><!-- end col-lg-4 -->
            @endforeach
        </div><!-- end row -->
        <div class="text-center pt-3">
            {{ $courses->links('vendor.pagination.bootstrap-4') }}
        </div>
    </div><!-- end container -->
</section>
@endsection
 