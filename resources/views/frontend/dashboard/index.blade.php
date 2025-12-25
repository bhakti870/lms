@extends('frontend.master')

@section('content')
@include('frontend.section.breadcrumb', ['title' => 'My Dashboard'])

<section class="py-5 bg-light">
    <div class="container">
        <div class="row g-4">
            <!-- Sidebar -->
            <div class="col-lg-4 col-xl-3">
                @include('frontend.dashboard.user_dashboard_sidebar')
            </div>

            <!-- Content -->
            <div class="col-lg-8 col-xl-9">
                <div class="text-start mb-5 mt-2">
                    <h2 class="fw-bold text-dark">Welcome back, <span class="text-theme">{{ auth()->user()->name }}</span>!</h2>
                    <p class="text-muted">Manage your courses, profile, and track your learning progress from here.</p>
                </div>
                
                <div class="row g-4 mb-5">
                    <div class="col-lg-4 col-md-6">
                        <div class="card border-0 shadow-sm rounded-4 h-100 overflow-hidden">
                            <div class="card-body p-4 d-flex align-items-center">
                                <div class="bg-primary-subtle text-primary p-3 rounded-4 me-4 d-flex align-items-center justify-content-center" style="width: 70px; height: 70px;">
                                    <i class="bi bi-play-circle-fill fs-1"></i>
                                </div>
                                <div>
                                    <p class="text-muted small fw-bold text-uppercase mb-1">Enrolled Courses</p>
                                    <h3 class="fw-bold mb-0 text-dark">{{ $enrolledCourses }}</h3>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="card border-0 shadow-sm rounded-4 h-100 overflow-hidden">
                            <div class="card-body p-4 d-flex align-items-center">
                                <div class="bg-danger-subtle text-danger p-3 rounded-4 me-4 d-flex align-items-center justify-content-center" style="width: 70px; height: 70px;">
                                    <i class="bi bi-heart-fill fs-1"></i>
                                </div>
                                <div>
                                    <p class="text-muted small fw-bold text-uppercase mb-1">Wishlist Items</p>
                                    <h3 class="fw-bold mb-0 text-dark">{{ $wishlistCount }}</h3>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-12">
                        <div class="card border-0 shadow-sm rounded-4 h-100 overflow-hidden">
                            <div class="card-body p-4 d-flex align-items-center">
                                <div class="bg-success-subtle text-success p-3 rounded-4 me-4 d-flex align-items-center justify-content-center" style="width: 70px; height: 70px;">
                                    <i class="bi bi-wallet2 fs-1"></i>
                                </div>
                                <div>
                                    <p class="text-muted small fw-bold text-uppercase mb-1">Total Spent</p>
                                    <h3 class="fw-bold mb-0 text-dark">₹{{ number_format($totalPurchase, 2) }}</h3>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="card border-0 shadow-sm rounded-4 overflow-hidden mb-5">
                    <div class="card-body p-5 text-center">
                        <div class="mb-4">
                            <i class="bi bi-rocket-takeoff text-theme opacity-25" style="font-size: 5rem;"></i>
                        </div>
                        <h4 class="fw-bold mb-3">Ready to continue your journey?</h4>
                        <p class="text-muted mb-4 mx-auto" style="max-width: 500px;">Access your enrolled courses and pick up right where you left off. Every expert was once a beginner.</p>
                        <div class="d-flex justify-content-center gap-3">
                            <a href="{{ route('user.purchase.history') }}" class="btn btn-theme px-5 py-3 rounded-pill text-white fw-bold shadow-theme">
                                <i class="bi bi-folder2-open me-2"></i> My Course Library
                            </a>
                            <a href="{{ route('all.courses') }}" class="btn btn-outline-theme px-5 py-3 rounded-pill fw-bold">
                                <i class="bi bi-search me-2"></i> Browse More
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
@endsection
