@extends('frontend.master')

@section('content')
@include('frontend.section.breadcrumb', ['title' => 'My Dashboard'])

<section class="dashboard-area pt-60px pb-120px">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="dashboard-heading mb-5 text-center">
                    <h2 class="fs-30 font-weight-semi-bold">Welcome back, {{ auth()->user()->name }}!</h2>
                    <p class="pt-2">Manage your courses, profile, and track your learning progress from here.</p>
                </div>
                
                <div class="row">
                    <div class="col-lg-4 responsive-column-half">
                        <div class="card card-item dashboard-info-card shadow-sm border-0">
                            <div class="card-body d-flex align-items-center">
                                <div class="icon-element flex-shrink-0 bg-1 text-white">
                                    <i class="la la-play-circle"></i>
                                </div>
                                <div class="pl-4">
                                    <p class="card-text fs-18">Enrolled Courses</p>
                                    <h5 class="card-title pt-2 fs-26">{{ $enrolledCourses }}</h5>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 responsive-column-half">
                        <div class="card card-item dashboard-info-card shadow-sm border-0">
                            <div class="card-body d-flex align-items-center">
                                <div class="icon-element flex-shrink-0 bg-2 text-white">
                                    <i class="la la-heart"></i>
                                </div>
                                <div class="pl-4">
                                    <p class="card-text fs-18">Wishlist</p>
                                    <h5 class="card-title pt-2 fs-26">{{ $wishlistCount }}</h5>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 responsive-column-half">
                        <div class="card card-item dashboard-info-card shadow-sm border-0">
                            <div class="card-body d-flex align-items-center">
                                <div class="icon-element flex-shrink-0 bg-3 text-white">
                                    <i class="la la-shopping-cart"></i>
                                </div>
                                <div class="pl-4">
                                    <p class="card-text fs-18">Total Spend</p>
                                    <h5 class="card-title pt-2 fs-26">${{ number_format($totalPurchase, 2) }}</h5>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="text-center mt-5">
                    <a href="{{ route('user.purchase.history') }}" class="btn theme-btn mx-2"><i class="la la-file-video-o mr-1"></i> My Courses</a>
                    <a href="{{ route('user.profile') }}" class="btn theme-btn theme-btn-transparent mx-2"><i class="la la-gear mr-1"></i> Account Settings</a>
                </div>
            </div>
        </div>
    </div>
</section>
@endsection
