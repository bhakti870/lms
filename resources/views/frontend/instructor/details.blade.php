@extends('frontend.master')

@section('content')
@include('frontend.section.breadcrumb', ['title' => 'Instructor Profile'])

<section class="teacher-details-area pt-100px pb-100px">
    <div class="container">
        <div class="row">
            <div class="col-lg-4">
                <div class="card card-item shadow-sm border-0 mb-4 text-center">
                    <div class="card-body p-5">
                        <div class="avatar-lg mx-auto mb-4" style="width: 150px; height: 150px; border-radius: 50%; overflow: hidden;">
                            <img src="{{ $instructor->photo ? asset($instructor->photo) : asset('upload/no_image.jpg') }}" alt="{{ $instructor->name }}" class="img-fluid" style="width: 100%; height: 100%; object-fit: cover;">
                        </div>
                        <h4 class="card-title fs-24 mb-1">{{ $instructor->name }}</h4>
                        <p class="card-text fs-16 text-color mb-3">{{ $instructor->experience ?? 'Instructor' }}</p>
                        <ul class="social-icons social-icons-styled justify-content-center">
                            <li><a href="#" class="facebook-bg"><i class="la la-facebook"></i></a></li>
                            <li><a href="#" class="twitter-bg"><i class="la la-twitter"></i></a></li>
                            <li><a href="#" class="instagram-bg"><i class="la la-instagram"></i></a></li>
                            <li><a href="#" class="linkedin-bg"><i class="la la-linkedin"></i></a></li>
                        </ul>
                    </div>
                </div><!-- end card -->
                
                <div class="card card-item shadow-sm border-0 mb-4">
                    <div class="card-body">
                        <h5 class="card-title border-bottom border-bottom-gray pb-3 mb-3">Quick Info</h5>
                        <ul class="generic-list-item">
                            <li class="d-flex align-items-center justify-content-between mb-2">
                                <span class="text-black font-weight-semi-bold">Email:</span>
                                <span>{{ $instructor->email }}</span>
                            </li>
                            <li class="d-flex align-items-center justify-content-between mb-2">
                                <span class="text-black font-weight-semi-bold">Phone:</span>
                                <span>{{ $instructor->phone ?? 'N/A' }}</span>
                            </li>
                            <li class="d-flex align-items-center justify-content-between mb-2">
                                <span class="text-black font-weight-semi-bold">Location:</span>
                                <span>{{ $instructor->city ?? 'Earth' }}, {{ $instructor->country ?? 'Global' }}</span>
                            </li>
                            <li class="d-flex align-items-center justify-content-between">
                                <span class="text-black font-weight-semi-bold">Member Since:</span>
                                <span>{{ $instructor->created_at->format('M Y') }}</span>
                            </li>
                        </ul>
                    </div>
                </div><!-- end card -->
            </div><!-- end col-lg-4 -->
            
            <div class="col-lg-8">
                <div class="card card-item shadow-sm border-0 mb-5">
                    <div class="card-body p-5">
                        <h3 class="fs-24 font-weight-semi-bold mb-4">About the Instructor</h3>
                        <p class="fs-16 line-height-28 text-gray">
                            {!! nl2br(e($instructor->bio ?? 'No bio available for this instructor.')) !!}
                        </p>
                    </div>
                </div><!-- end card -->

                <h3 class="fs-24 font-weight-semi-bold mb-4">Courses by {{ $instructor->name }}</h3>
                <div class="row">
                    @foreach($courses as $course)
                        <div class="col-lg-6 responsive-column-half">
                            <div class="card card-item shadow-sm border-0 hover-y mb-4">
                                <div class="card-image">
                                    <a href="{{ route('course-details', $course->course_name_slug) }}" class="d-block">
                                        <img class="card-img-top" src="{{ asset($course->course_image) }}" alt="Course Image">
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h6 class="ripple-above"><a href="{{ route('course-details', $course->course_name_slug) }}">{{ $course->course_name }}</a></h6>
                                    <div class="d-flex align-items-center pt-3">
                                        @if($course->discount_price > 0)
                                            <p class="text-black font-weight-semi-bold fs-18 mr-2">${{ $course->discount_price }}</p>
                                            <p class="before-price fs-14">${{ $course->selling_price }}</p>
                                        @else
                                            <p class="text-black font-weight-semi-bold fs-18">${{ $course->selling_price }}</p>
                                        @endif
                                    </div>
                                </div>
                            </div>
                        </div>
                    @endforeach
                </div>
            </div><!-- end col-lg-8 -->
        </div><!-- end row -->
    </div><!-- end container -->
</section>
@endsection
