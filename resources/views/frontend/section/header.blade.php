
<?php
$categories = getCategories();
?>

<nav class="navbar navbar-expand-xl bg-white shadow-sm sticky-top py-3">
    <div class="container-fluid px-lg-5">
        <a class="navbar-brand fw-bold fs-3 d-flex align-items-center me-4" href="{{ route('frontend.home') }}">
            <i class="bi bi-mortarboard-fill text-theme me-2"></i>
            <span>skillpoint</span>
        </a>

        <!-- Mobile Icons (Show before burger on small screens) -->
        <div class="d-flex align-items-center gap-2 ms-auto d-xl-none me-2">
            @auth
            <a href="{{ route('user.wishlist.index') }}" class="cart-wishlist-icon text-dark fs-5">
                <i class="bi bi-heart"></i>
            </a>
            <a href="{{ route('cart') }}" class="cart-wishlist-icon text-dark fs-5">
                <i class="bi bi-cart"></i>
            </a>
            @endauth
        </div>

        <button class="navbar-toggler border-0 shadow-none" type="button" data-bs-toggle="collapse"
            data-bs-target="#navbarContent">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0 align-items-center">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor"
                            class="bi bi-list-ul" viewBox="0 0 16 16">
                            <path fill-rule="evenodd"
                                d="M5 11.5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5m0-4a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5m0-4a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5m-3 1a1 1 0 1 0 0-2 1 1 0 0 0 0 2m0 4a1 1 0 1 0 0-2 1 1 0 0 0 0 2m0 4a1 1 0 1 0 0-2 1 1 0 0 0 0 2" />
                        </svg>
                        Categories
                    </a>
                    <ul class="dropdown-menu shadow-lg">
                        @foreach($categories as $item)
                        <li class="dropend">
                            <a class="dropdown-item dropdown-toggle" href="{{ route('category.details', $item->slug) }}">
                                {{$item->name}}
                            </a>
                            <ul class="dropdown-menu shadow-lg">
                                @foreach ($item['subcategory'] as $data)
                                <li><a class="dropdown-item" href="{{ route('subcategory.details', $data->slug) }}">{{$data->name}}</a></li>
                                @endforeach
                            </ul>
                        </li>
                        @endforeach
                    </ul>
                </li>

                <li class="nav-item"><a class="nav-link" href="{{ route('frontend.home') }}">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="{{ route('all.courses') }}">Courses</a></li>
                <li class="nav-item"><a class="nav-link" href="{{ route('all.instructors') }}">Instructors</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Blog</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Contact</a></li>
            </ul>

            <div class="d-flex align-items-center gap-3 mt-3 mt-xl-0 ms-auto">
                <div class="d-flex align-items-center gap-2 d-none d-xl-flex">
                    <!-- Wishlist -->
                    <div class="position-relative" id='wishlist-menu'>
                        <a href="{{ route('user.wishlist.index') }}" class="cart-wishlist-icon text-dark fs-4 d-inline-block">
                            <i class="bi bi-heart"></i>
                            <span class="badge badge-dot rounded-pill bg-theme" id="wishlist-count">
                                @auth
                                    {{ \App\Models\Wishlist::where('user_id', auth()->id())->count() }}
                                @else
                                    0
                                @endauth
                            </span>
                        </a>
                        <div id="wishlist-course"></div>
                    </div>

                    <!-- Cart AJAX container -->
                    <div id="cart" class="position-relative"></div>
                </div>

                @guest
                    <a href="{{ route('login') }}" class="btn btn-theme btn-theme-sm ms-2">Login/Signup &rarr;</a>
                @endguest

                @auth
                <div class="dropdown ms-2">
                    <a href="#" class="d-flex align-items-center text-dark text-decoration-none dropdown-toggle dashboard-toggle" data-bs-toggle="dropdown">
                        <img src="{{ auth()->user()->photo ? asset(auth()->user()->photo) : asset('frontend/images/small-avatar-1.jpg')}}" alt="user" width="35" height="35" class="rounded-circle me-2 border shadow-sm">
                        <span class="d-none d-md-inline fw-semibold small">{{ auth()->user()->name }}</span>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end shadow-lg border-0 mt-3 rounded-4 p-2" style="min-width: 240px;">
                        <li class="p-3 border-bottom mb-2 bg-light rounded-4">
                            <p class="mb-0 fw-bold text-dark">{{ auth()->user()->name }}</p>
                            <p class="mb-0 small text-muted opacity-75">{{ auth()->user()->email }}</p>
                        </li>
                        @if(auth()->user()->role == 'user')
                            <li><a class="dropdown-item py-2 px-3 rounded-3" href="{{ route('user.dashboard') }}"><i class="bi bi-speedometer2 me-2"></i> Dashboard</a></li>
                            <li><a class="dropdown-item py-2 px-3 rounded-3" href="{{ route('user.profile') }}"><i class="bi bi-person me-2"></i> Profile Settings</a></li>
                            <li><a class="dropdown-item py-2 px-3 rounded-3" href="{{ route('user.purchase.history') }}"><i class="bi bi-collection-play me-2"></i> My Library</a></li>
                            <li><a class="dropdown-item py-2 px-3 rounded-3" href="{{ route('user.wishlist.index') }}"><i class="bi bi-heart-fill me-2 text-danger"></i> Saved Items</a></li>
                        @elseif(auth()->user()->role == 'admin')
                            <li><a class="dropdown-item py-2 px-3 rounded-3" href="{{ route('admin.dashboard') }}"><i class="bi bi-shield-lock me-2"></i> Administration</a></li>
                        @elseif(auth()->user()->role == 'instructor')
                            <li><a class="dropdown-item py-2 px-3 rounded-3" href="{{ route('instructor.dashboard') }}"><i class="bi bi-briefcase me-2"></i> Instructor Panel</a></li>
                        @endif
                        <li><hr class="dropdown-divider opacity-10"></li>
                        <li>
                            <a class="dropdown-item text-danger py-2 px-3 rounded-3" href="#" onclick="event.preventDefault(); document.getElementById('logout-form-header').submit();">
                                <i class="bi bi-box-arrow-right me-2"></i> Sign Out
                            </a>
                            <form id="logout-form-header" action="{{ route('logout') }}" method="POST" style="display: none;">
                                @csrf
                            </form>
                        </li>
                    </ul>
                </div>
                @endauth
            </div>
        </div>
    </div>
</nav>
