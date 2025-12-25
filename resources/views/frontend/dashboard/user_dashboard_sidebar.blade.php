@php
    $route = Route::currentRouteName();
@endphp

<div class="card border-0 shadow-sm rounded-4 overflow-hidden mb-4 dashboard-sidebar">
    <div class="card-body p-0">
        <div class="p-4 border-bottom text-center bg-light">
            <div class="position-relative d-inline-block mb-3">
                <img src="{{ auth()->user()->photo ? asset(auth()->user()->photo) : asset('frontend/images/small-avatar-1.jpg')}}" alt="user" width="90" height="90" class="rounded-circle border border-3 border-white shadow-sm object-fit-cover">
            </div>
            <h6 class="fw-bold mb-0 text-dark">{{ auth()->user()->name }}</h6>
            <small class="text-muted">{{ auth()->user()->email }}</small>
        </div>
        <div class="list-group list-group-flush py-3">
            <a href="{{ route('user.dashboard') }}" class="list-group-item list-group-item-action border-0 px-4 py-3 d-flex align-items-center {{ $route == 'user.dashboard' ? 'active bg-theme text-white rounded-3 mx-3 mb-1' : 'bg-transparent text-muted' }}">
                <i class="bi bi-speedometer2 me-3 fs-5"></i>
                <span class="fw-semibold">Dashboard</span>
            </a>
            
            <a href="{{ route('user.purchase.history') }}" class="list-group-item list-group-item-action border-0 px-4 py-3 d-flex align-items-center {{ $route == 'user.purchase.history' ? 'active bg-theme text-white rounded-3 mx-3 mb-1' : 'bg-transparent text-muted' }}">
                <i class="bi bi-play-circle me-3 fs-5"></i>
                <span class="fw-semibold">My Courses</span>
            </a>

            <a href="{{ route('user.wishlist.index') }}" class="list-group-item list-group-item-action border-0 px-4 py-3 d-flex align-items-center {{ $route == 'user.wishlist.index' ? 'active bg-theme text-white rounded-3 mx-3 mb-1' : 'bg-transparent text-muted' }}">
                <i class="bi bi-heart me-3 fs-5"></i>
                <span class="fw-semibold">Wishlist</span>
            </a>

            <a href="{{ route('user.leaderboard') }}" class="list-group-item list-group-item-action border-0 px-4 py-3 d-flex align-items-center {{ $route == 'user.leaderboard' ? 'active bg-theme text-white rounded-3 mx-3 mb-1' : 'bg-transparent text-muted' }}">
                <i class="bi bi-trophy me-3 fs-5"></i>
                <span class="fw-semibold">Leaderboard</span>
            </a>

            <a href="{{ route('user.profile') }}" class="list-group-item list-group-item-action border-0 px-4 py-3 d-flex align-items-center {{ $route == 'user.profile' ? 'active bg-theme text-white rounded-3 mx-3 mb-1' : 'bg-transparent text-muted' }}">
                <i class="bi bi-person-gear me-3 fs-5"></i>
                <span class="fw-semibold">Account Settings</span>
            </a>

            <hr class="mx-4 my-2 opacity-10">

            <a href="#" onclick="event.preventDefault(); document.getElementById('logout-form-sidebar').submit();" class="list-group-item list-group-item-action border-0 px-4 py-3 d-flex align-items-center bg-transparent text-danger">
                <i class="bi bi-box-arrow-right me-3 fs-5"></i>
                <span class="fw-semibold">Logout</span>
            </a>
            <form id="logout-form-sidebar" action="{{ route('logout') }}" method="POST" style="display: none;">
                @csrf
            </form>
        </div>
    </div>
</div>

<style>
.dashboard-sidebar .list-group-item.active {
    box-shadow: 0 4px 15px rgba(91, 80, 214, 0.2);
}
.dashboard-sidebar .list-group-item:not(.active):hover {
    background-color: rgba(91, 80, 214, 0.05);
    color: var(--theme-color) !important;
}
</style>
