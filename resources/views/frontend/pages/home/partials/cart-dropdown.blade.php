<li class="d-flex justify-content-between align-items-center mb-2">
    <h6 class="fw-bold mb-0">My Cart</h6>
    <a href="{{ route('cart') }}" class="small text-decoration-none">View All</a>
</li>
<li><hr class="dropdown-divider"></li>
<div class="cart-items" style="max-height: 250px; overflow-y: auto;">
    @forelse($cart as $item)
        <li class="d-flex align-items-center mb-3">
            <img src="{{ asset($item->course->course_image) }}" alt="img" class="rounded me-2" style="width: 50px; height: 50px; object-fit: cover;">
            <div class="flex-grow-1">
                <a href="{{ route('course-details', $item->course->course_name_slug) }}" class="text-reset text-decoration-none d-block small fw-bold text-truncate" style="max-width: 180px;">{{ $item->course->course_name }}</a>
                <small class="text-muted fw-bold">${{ $item->course->discount_price ?? $item->course->selling_price }}</small>
            </div>
        </li>
    @empty
        <li class="text-center py-3">
            <i class="bi bi-cart-x text-muted fs-1"></i>
            <p class="text-muted small mb-0">Your cart is empty</p>
        </li>
    @endforelse
</div>
@if($cart->count() > 0)
<li><hr class="dropdown-divider"></li>
<li class="d-flex justify-content-between pt-2">
    <a href="{{ route('cart') }}" class="btn btn-outline-primary btn-sm w-100 me-2">View Cart</a>
    <a href="{{ route('checkout.index') }}" class="btn btn-primary btn-sm w-100">Checkout</a>
</li>
@endif
