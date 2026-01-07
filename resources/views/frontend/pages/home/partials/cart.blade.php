<a href="{{ route('cart') }}" class="cart-wishlist-icon text-dark fs-4 d-inline-block">
    <i class="bi bi-cart3"></i>
    <span class="badge badge-dot rounded-pill bg-theme" id="cart-count">
        {{ count($cart) }}
    </span>
</a>

<ul class="dropdown-menu dropdown-menu-end shadow p-4 border-0" id="cart-dropdown">
    <li class="mb-3 border-bottom pb-2">
        <h6 class="fw-bold mb-0">Shopping Cart</h6>
    </li>
    
    @if($cart->count() > 0)
        @foreach($cart as $item)
            <li class="mb-3 d-flex align-items-center">
                <img src="{{ asset($item->course->course_image) }}" alt="{{ $item->course->course_name }}" width="50" height="50" class="rounded me-3 object-fit-cover border">
                <div class="flex-grow-1 min-w-0">
                    <h6 class="mb-0 small fw-bold text-truncate">{{ $item->course->course_name }}</h6>
                    <p class="mb-0 small text-theme fw-bold">₹{{ number_format($item->course->discount_price ?? $item->course->selling_price, 2) }}</p>
                </div>
                <button class="btn btn-sm text-danger ms-2 remove-course-btn" data-id="{{ $item->id }}"><i class="bi bi-trash"></i></button>
            </li>
        @endforeach
        <li><hr class="dropdown-divider"></li>
        <li class="d-flex justify-content-between mb-3 align-items-center">
            <span class="text-muted small">Subtotal</span>
            <span class="fw-bold fs-5 text-theme">₹{{ number_format($subTotal, 2) }}</span>
        </li>
        <li>
            <a href="{{ route('checkout.index') }}" class="btn btn-theme w-100 py-2 text-white">Checkout Now</a>
        </li>
    @else
        <li class="p-4 text-center text-muted">
            <i class="bi bi-cart-x fs-1 opacity-25 d-block mb-3"></i>
            <h6 class="fw-bold text-dark">Your cart is empty</h6>
            <p class="small mb-3">Looks like you haven't added anything yet.</p>
            <a href="{{ route('all.courses') }}" class="btn btn-theme-sm btn-theme w-100 pb-2 text-white">Browse Courses</a>
        </li>
    @endif

</ul>








