@extends('frontend.master')

@section('content')
@include('frontend.section.breadcrumb', ['title' => 'Our Expert Instructors'])

<section class="instructor-area pt-100px pb-100px">
    <div class="container">
        <div class="filter-bar d-flex flex-wrap align-items-center justify-content-between mb-5 shadow-sm rounded p-3 bg-white">
            <p class="fs-18">We found <span class="text-color font-weight-bold">{{ $instructors->total() }}</span> instructors for you</p>
            
            <form action="{{ route('all.instructors') }}" method="GET" class="d-flex flex-wrap align-items-center">
                <div class="mr-3">
                    <select name="category" class="select-container-select" onchange="this.form.submit()">
                        <option value="">All Categories</option>
                        @foreach($categories as $cat)
                            <option value="{{ $cat->id }}" {{ request('category') == $cat->id ? 'selected' : '' }}>{{ $cat->category_name }}</option>
                        @endforeach
                    </select>
                </div>
                <div class="mr-3">
                    <select name="rating" class="select-container-select" onchange="this.form.submit()">
                        <option value="">Filter by Rating</option>
                        <option value="4.5" {{ request('rating') == '4.5' ? 'selected' : '' }}>4.5 & up</option>
                        <option value="4.0" {{ request('rating') == '4.0' ? 'selected' : '' }}>4.0 & up</option>
                        <option value="3.5" {{ request('rating') == '3.5' ? 'selected' : '' }}>3.5 & up</option>
                        <option value="3.0" {{ request('rating') == '3.0' ? 'selected' : '' }}>3.0 & up</option>
                    </select>
                </div>
                <div class="mr-3">
                    <input type="text" name="experience" class="form--control fs-14" placeholder="Experience (e.g. 5 years)" value="{{ request('experience') }}">
                </div>
                <button type="submit" class="btn theme-btn theme-btn-sm">Filter</button>
                <a href="{{ route('all.instructors') }}" class="btn theme-btn theme-btn-sm bg-gray text-black ml-2">Reset</a>
            </form>
        </div><!-- end filter-bar -->

        <div class="row">
            @forelse($instructors as $instructor)
                <div class="col-lg-3 responsive-column-half">
                    <div class="card card-item member-card text-center shadow-sm border-0 hover-y">
                        <div class="card-image mx-auto mt-4" style="width: 120px; height: 120px; border-radius: 50%; overflow: hidden;">
                            <img class="card-img-top" src="{{ $instructor->photo ? asset($instructor->photo) : asset('upload/no_image.jpg') }}" alt="{{ $instructor->name }}" style="width: 100%; height: 100%; object-fit: cover;">
                        </div>
                        <div class="card-body">
                            <h5 class="card-title fs-20"><a href="{{ route('instructor.details', $instructor->id) }}">{{ $instructor->name }}</a></h5>
                            <p class="card-text fs-14 pb-2 border-bottom border-bottom-gray mb-3">{{ $instructor->experience ?? 'Professional Instructor' }}</p>
                            
                            <div class="d-flex align-items-center justify-content-center mb-3">
                                <span class="badge bg-1 text-white px-2 py-1 fs-12 mr-2">{{ $instructor->courses_count }} Courses</span>
                                <div class="review-stars fs-14">
                                    <span class="la la-star text-warning"></span>
                                    <span class="text-black font-weight-bold ml-1">{{ $instructor->avg_rating }}</span>
                                </div>
                            </div>
                            
                            <p class="fs-14 text-gray line-height-24 mb-4">
                                {{ Str::limit($instructor->bio, 80) }}
                            </p>
                            
                            <a href="{{ route('instructor.details', $instructor->id) }}" class="btn theme-btn theme-btn-sm w-100">View Profile</a>
                        </div><!-- end card-body -->
                    </div><!-- end card -->
                </div><!-- end col-lg-3 -->
            @empty
                <div class="col-lg-12 text-center py-5">
                    <div class="icon-element mx-auto mb-4">
                        <i class="la la-user-times fs-40"></i>
                    </div>
                    <h3 class="fs-22 font-weight-semi-bold">No instructors found.</h3>
                    <p class="pt-2">Try adjusting your filters or browse all instructors.</p>
                    <a href="{{ route('all.instructors') }}" class="btn theme-btn mt-4">Reset Filters</a>
                </div>
            @endforelse
        </div><!-- end row -->

        <div class="text-center pt-50px">
            {{ $instructors->links('vendor.pagination.bootstrap-4') }}
        </div>
    </div><!-- end container -->
</section>
@endsection
