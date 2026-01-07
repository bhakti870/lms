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
                    <div class="card-header bg-white py-3 px-4 d-flex justify-content-between align-items-center border-bottom">
                        <h5 class="fw-bold mb-0">Recent Notifications</h5>
                        <a href="{{ route('user.notifications.index') }}" class="btn btn-sm btn-link text-theme text-decoration-none fw-bold">View All</a>
                    </div>
                    <div class="card-body p-0">
                        @if ($recentNotifications->count() > 0)
                            <div class="list-group list-group-flush">
                                @foreach ($recentNotifications as $notification)
                                    <div class="list-group-item p-4 border-0 border-bottom">
                                        <div class="d-flex align-items-start">
                                            <div class="rounded-circle bg-{{ $notification->data['color'] ?? 'primary' }}-subtle text-{{ $notification->data['color'] ?? 'primary' }} p-2 d-flex align-items-center justify-content-center me-3" style="width: 45px; height: 45px;">
                                                <i class="bi {{ $notification->data['icon'] ?? 'bi-bell' }} fs-5"></i>
                                            </div>
                                            <div class="flex-grow-1">
                                                <div class="d-flex justify-content-between">
                                                    <h6 class="fw-bold mb-1">{{ $notification->data['title'] }}</h6>
                                                    <div class="d-flex align-items-center gap-2">
                                                        <small class="text-muted">{{ $notification->created_at->diffForHumans() }}</small>
                                                        <a href="{{ route('user.notifications.delete', $notification->id) }}" class="text-muted small" title="Delete"><i class="bi bi-x-circle"></i></a>
                                                    </div>
                                                </div>
                                                <p class="text-muted small mb-0">{{ $notification->data['message'] }}</p>
                                            </div>
                                        </div>
                                    </div>
                                @endforeach
                            </div>
                        @else
                            <div class="text-center py-5">
                                <p class="text-muted mb-0">No new notifications</p>
                            </div>
                        @endif
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
