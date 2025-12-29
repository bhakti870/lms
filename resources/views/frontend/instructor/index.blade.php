@extends('frontend.master')

@section('content')
@include('frontend.section.breadcrumb', ['title' => 'Our Expert Instructors'])

<section class="instructor-area pt-100px pb-100px bg-gray-light">
    <div class="container">
        <div class="row">
            <div class="col-lg-3">
                <div class="sidebar mb-5">
                    <form action="{{ route('all.instructors') }}" method="GET">
                        
                        <div class="card card-item">
                            <div class="card-body">
                                <h3 class="card-title fs-18 pb-2">Search Filter</h3>
                                <div class="divider"><span></span></div>
                                
                                <div class="mb-3">
                                    <h4 class="fs-15 font-weight-semi-bold">Categories</h4>
                                    <div class="custom-control-group mt-2">
                                        @foreach($categories as $cat)
                                            <div class="custom-control custom-checkbox mb-2">
                                                <input type="checkbox" class="custom-control-input" id="cat{{ $cat->id }}" name="categories[]" value="{{ $cat->id }}" {{ in_array($cat->id, request('categories', [])) ? 'checked' : '' }}>
                                                <label class="custom-control-label" for="cat{{ $cat->id }}">
                                                    {{ $cat->name }} 
                                                    <!-- <span class="text-gray ml-1">({{ $cat->course_count ?? 0 }})</span> -->
                                                </label>
                                            </div>
                                        @endforeach
                                    </div>
                                </div>

                                <div class="mb-3">
                                    <h4 class="fs-15 font-weight-semi-bold">Rating</h4>
                                    <div class="custom-control-group mt-2">
                                        <div class="custom-control custom-radio mb-2">
                                            <input type="radio" class="custom-control-input" id="ratingAny" name="rating" value="" {{ request('rating') == '' ? 'checked' : '' }}>
                                            <label class="custom-control-label" for="ratingAny">Any Rating</label>
                                        </div>
                                        <div class="custom-control custom-radio mb-2">
                                            <input type="radio" class="custom-control-input" id="rating45" name="rating" value="4.5" {{ request('rating') == '4.5' ? 'checked' : '' }}>
                                            <label class="custom-control-label" for="rating45">
                                                <span class="review-stars">
                                                    <span class="la la-star text-warning"></span>
                                                    <span class="la la-star text-warning"></span>
                                                    <span class="la la-star text-warning"></span>
                                                    <span class="la la-star text-warning"></span>
                                                    <span class="la la-star-half-o text-warning"></span>
                                                </span> 
                                                4.5 & up
                                            </label>
                                        </div>
                                        <div class="custom-control custom-radio mb-2">
                                            <input type="radio" class="custom-control-input" id="rating40" name="rating" value="4.0" {{ request('rating') == '4.0' ? 'checked' : '' }}>
                                            <label class="custom-control-label" for="rating40">
                                                <span class="review-stars">
                                                    <span class="la la-star text-warning"></span>
                                                    <span class="la la-star text-warning"></span>
                                                    <span class="la la-star text-warning"></span>
                                                    <span class="la la-star text-warning"></span>
                                                    <span class="la la-star-o text-warning"></span>
                                                </span> 
                                                4.0 & up
                                            </label>
                                        </div>
                                         <div class="custom-control custom-radio mb-2">
                                            <input type="radio" class="custom-control-input" id="rating30" name="rating" value="3.0" {{ request('rating') == '3.0' ? 'checked' : '' }}>
                                            <label class="custom-control-label" for="rating30">
                                                <span class="review-stars">
                                                    <span class="la la-star text-warning"></span>
                                                    <span class="la la-star text-warning"></span>
                                                    <span class="la la-star text-warning"></span>
                                                    <span class="la la-star-half-o text-warning"></span>
                                                    <span class="la la-star-o text-warning"></span>
                                                </span> 
                                                3.0 & up
                                            </label>
                                        </div>
                                    </div>
                                </div>

                                <div class="mb-3">
                                    <h4 class="fs-15 font-weight-semi-bold">Experience</h4>
                                    <div class="mt-2">
                                        <input type="text" name="experience" class="form-control form--control fs-14" placeholder="Keywords (e.g. Senior, 5 Years)" value="{{ request('experience') }}">
                                    </div>
                                </div>

                                <button type="submit" class="btn theme-btn w-100">Apply Filter</button>
                            </div>
                        </div>

                    </form>
                </div>
            </div>

            <div class="col-lg-9">
                 <div class="filter-bar d-flex flex-wrap align-items-center justify-content-between mb-4">
                    <p class="fs-14">We found <span class="text-color font-weight-bold">{{ $instructors->total() }}</span> instructors for you</p>
                </div>

                <div class="row">
                    @forelse($instructors as $instructor)
                        <div class="col-lg-4 responsive-column-half">
                            <div class="instructor-card mb-4">
                                <div class="instructor-img-wrapper">
                                    <a href="{{ route('instructor.details', $instructor->id) }}">
                                        <img src="{{ $instructor->photo ? asset($instructor->photo) : asset('upload/no_image.jpg') }}" alt="{{ $instructor->name }}" style="width: 100%; height: 300px; object-fit: cover; border-radius: 8px;">
                                    </a>
                                    <div class="social-notch">
                                        <a href="#"><i class="la la-facebook"></i></a>
                                        <a href="#"><i class="la la-twitter"></i></a>
                                        <a href="#"><i class="la la-instagram"></i></a>
                                        <a href="#"><i class="la la-linkedin"></i></a>
                                    </div>
                                </div>
                                <div class="instructor-info mt-3">
                                    <h5 class="fw-bold mb-1"><a href="{{ route('instructor.details', $instructor->id) }}" class="text-black">{{ $instructor->name }}</a></h5>
                                    <p class="text-muted small mb-2">{{ $instructor->experience ?? 'Professional Instructor' }}</p>
                                    
                                    <div class="d-flex align-items-center justify-content-between">
                                        <span class="badge badge-info px-2 py-1 fs-12 text-white bg-theme">{{ $instructor->courses_count }} Courses</span>
                                        <div class="review-stars fs-14 d-flex align-items-center">
                                            <span class="la la-star text-warning"></span>
                                            <span class="text-black font-weight-bold ml-1">{{ $instructor->avg_rating }}</span>
                                        </div>
                                    </div>
                                    
                                    <p class="fs-14 text-gray line-height-24 mt-3">
                                        {{ Str::limit($instructor->bio, 100) }}
                                    </p>
                                </div>
                            </div>
                        </div><!-- end col-lg-4 -->
                    @empty
                        <div class="col-lg-12 text-center py-5">
                            <div class="icon-element mx-auto mb-4 bg-light text-muted">
                                <i class="la la-user-times fs-40"></i>
                            </div>
                            <h3 class="fs-22 font-weight-semi-bold">No instructors found.</h3>
                            <p class="pt-2">Try adjusting your filters or browse all instructors.</p>
                            <a href="{{ route('all.instructors') }}" class="btn theme-btn mt-4">Reset Filters</a>
                        </div>
                    @endforelse
                </div><!-- end row -->
                
                <div class="text-center pt-3">
                    {{ $instructors->withQueryString()->links('vendor.pagination.bootstrap-4') }}
                </div>
            </div>
        </div>
    </div>
</section>
@endsection
