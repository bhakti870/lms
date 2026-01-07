 <nav class="navbar navbar-expand-xl bg-white shadow-sm sticky-top py-3">
        <div class="container-fluid px-lg-5"> <a class="navbar-brand fw-bold fs-3 d-flex align-items-center me-4"
                href="#">
                <i class="bi bi-mortarboard-fill text-theme me-2"></i>
                <span>skillpoint</span>
            </a>

            <button class="navbar-toggler border-0 shadow-none" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarContent">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0 align-items-center">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-display="static" aria-expanded="false">
                            <i class="bi bi-grid-3x3-gap me-1"></i> Categories
                        </a>
                        <ul class="dropdown-menu">
                            @foreach($header_categories as $cat)
                                @if($cat->subcategory->count() > 0)
                                    <li class="dropend">
                                        <a class="dropdown-item dropdown-toggle" href="#" data-bs-display="static">
                                            {{ $cat->name }}
                                        </a>
                                        <ul class="dropdown-menu">
                                            @foreach($cat->subcategory as $sub)
                                                <li><a class="dropdown-item" href="{{ route('subcategory.details', $sub->slug) }}">{{ $sub->name }}</a></li>
                                            @endforeach
                                        </ul>
                                    </li>
                                @else
                                    <li><a class="dropdown-item" href="{{ route('category.details', $cat->slug) }}">{{ $cat->name }}</a></li>
                                @endif
                            @endforeach
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item" href="{{ route('all.courses') }}">All Courses</a></li>
                        </ul>
                    </li>

                    <li class="nav-item"><a class="nav-link" href="{{ route('frontend.home') }}">Home</a></li>
                    
                    <li class="nav-item"><a class="nav-link" href="{{ route('all.instructors') }}">Instructors</a></li>
                    <li class="nav-item"><a class="nav-link" href="{{ route('all.courses') }}">Courses</a></li>
                    <li class="nav-item"><a class="nav-link" href="{{ route('cart') }}">cart</a></li>
                </ul>

                <div class="d-flex align-items-center gap-3 mt-3 mt-xl-0">

                    
                    @auth
                    <!-- Cart Dropdown -->
                    <div class="dropdown">
                        <a href="#" class="btn btn-light rounded-circle border-0 shadow-sm position-relative d-flex align-items-center justify-content-center dropdown-toggle no-arrow" data-bs-display="static" style="width: 40px; height: 40px;">
                            <i class="bi bi-cart"></i>
                            <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger cart-count" style="font-size: 10px;">
                                {{ $header_cart_items->count() }}
                            </span>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end p-3 shadow" style="min-width: 300px;">
                            <div id="cart-dropdown-content">
                                <li class="d-flex justify-content-between align-items-center mb-2">
                                    <h6 class="fw-bold mb-0">My Cart</h6>
                                    <a href="{{ route('cart') }}" class="small text-decoration-none">View All</a>
                                </li>
                                <li><hr class="dropdown-divider"></li>
                                <div class="cart-items" style="max-height: 250px; overflow-y: auto;">
                                    @forelse($header_cart_items as $item)
                                        <li class="d-flex align-items-center mb-3">
                                            <img src="{{ asset($item->course->course_image) }}" alt="img" class="rounded me-2" style="width: 50px; height: 50px; object-fit: cover;">
                                            <div class="flex-grow-1">
                                                <a href="{{ route('course-details', $item->course->course_name_slug) }}" class="text-reset text-decoration-none d-block small fw-bold text-truncate" style="max-width: 180px;">{{ $item->course->course_name }}</a>
                                                <small class="text-muted fw-bold">${{ $item->course->selling_price }}</small>
                                            </div>
                                        </li>
                                    @empty
                                        <li class="text-center py-3">
                                            <i class="bi bi-cart-x text-muted fs-1"></i>
                                            <p class="text-muted small mb-0">Your cart is empty</p>
                                        </li>
                                    @endforelse
                                </div>
                                @if($header_cart_items->count() > 0)
                                <li><hr class="dropdown-divider"></li>
                                <li class="d-flex justify-content-between pt-2">
                                    <a href="{{ route('cart') }}" class="btn btn-outline-primary btn-sm w-100 me-2">View Cart</a>
                                    <a href="{{ route('checkout.index') }}" class="btn btn-primary btn-sm w-100">Checkout</a>
                                </li>
                                @endif
                            </div>
                        </ul>
                    </div>

                    <!-- Wishlist Dropdown -->
                    <div class="dropdown">
                        <a href="#" class="btn btn-light rounded-circle border-0 shadow-sm position-relative d-flex align-items-center justify-content-center dropdown-toggle no-arrow" data-bs-display="static" style="width: 40px; height: 40px;">
                            <i class="bi bi-heart"></i>
                            <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger" id="wishlist-count" style="font-size: 10px;">
                                {{ $header_wishlist_items->count() }}
                            </span>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end p-3 shadow" style="min-width: 300px;">
                            <li class="d-flex justify-content-between align-items-center mb-2">
                                <h6 class="fw-bold mb-0">My Wishlist</h6>
                                <a href="{{ route('user.wishlist.index') }}" class="small text-decoration-none">View All</a>
                            </li>
                            <li><hr class="dropdown-divider"></li>
                            <div class="wishlist-items" style="max-height: 250px; overflow-y: auto;">
                                @forelse($header_wishlist_items as $item)
                                    <li class="d-flex align-items-center mb-3">
                                        <img src="{{ asset($item->course->course_image) }}" alt="img" class="rounded me-2" style="width: 50px; height: 50px; object-fit: cover;">
                                        <div class="flex-grow-1">
                                            <a href="{{ route('course-details', $item->course->course_name_slug) }}" class="text-reset text-decoration-none d-block small fw-bold text-truncate" style="max-width: 180px;">{{ $item->course->course_name }}</a>
                                            <small class="text-muted fw-bold">${{ $item->course->selling_price }}</small>
                                        </div>
                                    </li>
                                @empty
                                    <li class="text-center py-3">
                                        <i class="bi bi-heart text-muted fs-1"></i>
                                        <p class="text-muted small mt-2 mb-0">No items in wishlist</p>
                                    </li>
                                @endforelse
                            </div>
                        </ul>
                    </div>

                    <!-- Notification Dropdown -->
                    <div class="dropdown">
                        <a href="#" class="btn btn-light rounded-circle border-0 shadow-sm position-relative d-flex align-items-center justify-content-center dropdown-toggle no-arrow" data-bs-display="static" style="width: 40px; height: 40px;">
                            <i class="bi bi-bell"></i>
                            <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger" id="notification-count" style="font-size: 10px;">
                                {{ $header_unread_count }}
                            </span>
                        </a>
                         <ul class="dropdown-menu dropdown-menu-end p-0 shadow" style="min-width: 320px;">
                            <li class="p-3 border-bottom d-flex justify-content-between align-items-center">
                                <div>
                                    <h6 class="fw-bold mb-0">Notifications</h6>
                                    @if($header_unread_count > 0)
                                        <small class="text-theme">{{ $header_unread_count }} Unread</small>
                                    @endif
                                </div>
                                @if($header_unread_count > 0)
                                    <a href="{{ route('user.notifications.markAllRead') }}" class="small text-decoration-none">Mark all read</a>
                                @else
                                    <a href="{{ route('user.notifications.index') }}" class="small text-decoration-none">View All</a>
                                @endif
                            </li>
                            <div class="notification-items" style="max-height: 300px; overflow-y: auto;">
                                @forelse($header_notifications as $notification)
                                    <li>
                                        <a href="{{ route('user.notifications.index') }}" class="dropdown-item p-3 border-bottom {{ is_null($notification->read_at) ? 'bg-light' : '' }}">
                                            <div class="d-flex align-items-center mb-1">
                                                <span class="badge bg-{{ $notification->data['color'] ?? 'primary' }} p-1 me-2 rounded-circle">
                                                    <i class="bi {{ $notification->data['icon'] ?? 'bi-bell' }}" style="font-size: 0.6rem;"></i>
                                                </span>
                                                <h6 class="mb-0 small fw-bold">{{ $notification->data['title'] ?? 'Notification' }}</h6>
                                                <small class="ms-auto text-muted" style="font-size: 0.7rem;">{{ $notification->created_at->diffForHumans() }}</small>
                                            </div>
                                            <p class="mb-0 text-wrap small text-muted" style="line-height: 1.4; display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical; overflow: hidden;">
                                                {{ $notification->data['message'] ?? 'New notification' }}
                                            </p>
                                        </a>
                                    </li>
                                @empty
                                    <li class="text-center py-4">
                                        <i class="bi bi-bell-slash text-muted fs-1"></i>
                                        <p class="text-muted small mt-2 mb-0">No new notifications</p>
                                    </li>
                                @endforelse
                            </div>
                            @if($header_notifications->count() > 0)
                                <li class="p-2 text-center border-top">
                                    <a href="{{ route('user.notifications.index') }}" class="small text-decoration-none fw-bold">See all notifications</a>
                                </li>
                            @endif
                        </ul>
                    </div>

                    <!-- Profile Dropdown -->
                    <div class="dropdown">
                        <a href="#" class="d-flex align-items-center text-decoration-none dropdown-toggle no-arrow" id="dropdownUser1" data-bs-display="static" aria-expanded="false">
                            <img src="{{ Auth::user()->photo ? asset(Auth::user()->photo) : 'https://placehold.co/40x40' }}" alt="mdo" width="40" height="40" class="rounded-circle border object-fit-cover">
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end text-small shadow" aria-labelledby="dropdownUser1" style="min-width: 200px;">
                             <li class="px-3 py-2 border-bottom">
                                <div class="d-flex align-items-center">
                                    <img src="{{ Auth::user()->photo ? asset(Auth::user()->photo) : 'https://placehold.co/40x40' }}" alt="" width="32" height="32" class="rounded-circle me-2 object-fit-cover">
                                    <div>
                                        <h6 class="mb-0 text-truncate" style="max-width: 150px;">{{ Auth::user()->name }}</h6>
                                        <small class="text-muted text-truncate d-block" style="max-width: 150px;">{{ Auth::user()->email }}</small>
                                    </div>
                                </div>
                            </li>
                            
                            @if(Auth::user()->role === 'admin')
                                <li><a class="dropdown-item py-2" href="{{ route('admin.dashboard') }}"><i class="bi bi-speedometer2 me-2"></i> Dashboard</a></li>
                            @elseif(Auth::user()->role === 'instructor')
                                <li><a class="dropdown-item py-2" href="{{ route('instructor.dashboard') }}"><i class="bi bi-speedometer2 me-2"></i> Dashboard</a></li>
                            @else
                                <li><a class="dropdown-item py-2" href="{{ route('user.dashboard') }}"><i class="bi bi-speedometer2 me-2"></i> Dashboard</a></li>
                            @endif
                            
                            <li><a class="dropdown-item py-2" href="{{ route('user.profile') }}"><i class="bi bi-person me-2"></i> Profile</a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li>
                                <form method="POST" action="{{ route('logout') }}">
                                    @csrf
                                    <button type="submit" class="dropdown-item py-2 text-danger"><i class="bi bi-box-arrow-right me-2"></i> Sign out</button>
                                </form>
                            </li>
                        </ul>
                    </div>
                    @else
                    <a href="{{ route('login') }}" class="btn btn-theme">Login/Signup &rarr;</a>
                    @endauth
                </div>


            </div>
        </div>
    </nav>