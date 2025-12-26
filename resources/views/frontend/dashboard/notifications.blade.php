@extends('frontend.master')

@section('content')
@include('frontend.section.breadcrumb', ['title' => 'My Notifications'])

<section class="py-5 bg-light">
    <div class="container">
        <div class="row g-4">
            <!-- Sidebar -->
            <div class="col-lg-4 col-xl-3">
                @include('frontend.dashboard.user_dashboard_sidebar')
            </div>

            <!-- Content -->
            <div class="col-lg-8 col-xl-9">
                <div class="card border-0 shadow-sm rounded-4 overflow-hidden">
                    <div class="card-header bg-white py-4 px-4 d-flex justify-content-between align-items-center border-bottom">
                        <div>
                            <h5 class="fw-bold mb-0">Recent Notifications</h5>
                            <p class="text-muted small mb-0">Stay updated with your learning progress</p>
                        </div>
                        <div class="d-flex gap-2">
                            @if(auth()->user()->unreadNotifications->count() > 0)
                                <a href="{{ route('user.notifications.markAllRead') }}" class="btn btn-sm btn-outline-theme rounded-pill px-3">
                                    <i class="bi bi-check-all me-1"></i> Mark All Read
                                </a>
                            @endif
                            @if($notifications->count() > 0)
                                <a href="{{ route('user.notifications.deleteAll') }}" class="btn btn-sm btn-outline-danger rounded-pill px-3" onclick="return confirm('Are you sure you want to delete all notifications?')">
                                    <i class="bi bi-trash me-1"></i> Clear All
                                </a>
                            @endif
                        </div>
                    </div>
                    <div class="card-body p-0">
                        @if ($notifications->count() > 0)
                            <div class="list-group list-group-flush">
                                @foreach ($notifications as $notification)
                                    @php
                                        $data = $notification->data;
                                        $isUnread = is_null($notification->read_at);
                                    @endphp
                                    <div class="list-group-item p-4 {{ $isUnread ? 'bg-light border-start border-theme border-4' : '' }}">
                                        <div class="d-flex align-items-start">
                                            <div class="flex-shrink-0">
                                                <div class="rounded-circle bg-{{ $data['color'] ?? 'primary' }}-subtle text-{{ $data['color'] ?? 'primary' }} d-flex align-items-center justify-content-center" style="width: 50px; height: 50px;">
                                                    <i class="bi {{ $data['icon'] ?? 'bi-bell' }} fs-4"></i>
                                                </div>
                                            </div>
                                            <div class="flex-grow-1 ms-3">
                                                <div class="d-flex justify-content-between align-items-start mb-1">
                                                    <div>
                                                        <h6 class="fw-bold mb-0">{{ $data['title'] ?? 'Generic Notification' }}</h6>
                                                        <small class="text-muted">{{ $notification->created_at->diffForHumans() }}</small>
                                                    </div>
                                                    <a href="{{ route('user.notifications.delete', $notification->id) }}" class="text-muted hover-danger p-1" title="Delete notification">
                                                        <i class="bi bi-x-lg"></i>
                                                    </a>
                                                </div>
                                                <p class="text-muted mb-2">{{ $data['message'] ?? '' }}</p>
                                                <div class="d-flex align-items-center gap-3">
                                                    @if(isset($data['link']))
                                                        <a href="{{ $data['link'] }}" class="btn btn-sm btn-theme text-white px-3 py-1 rounded-pill small">View Details</a>
                                                    @endif
                                                    
                                                    @if($isUnread)
                                                        <a href="{{ route('user.notifications.markRead', $notification->id) }}" class="text-theme small text-decoration-none fw-semibold">
                                                            Mark as read
                                                        </a>
                                                    @endif
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                @endforeach
                            </div>
                            
                            <div class="p-4 border-top">
                                {{ $notifications->links() }}
                            </div>
                        @else
                            <div class="text-center py-5">
                                <div class="mb-4">
                                    <i class="bi bi-bell-slash text-muted opacity-25" style="font-size: 4rem;"></i>
                                </div>
                                <h5 class="fw-bold text-muted">No notifications yet</h5>
                                <p class="text-muted mb-0">We'll notify you when something important happens.</p>
                            </div>
                        @endif
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
@endsection
