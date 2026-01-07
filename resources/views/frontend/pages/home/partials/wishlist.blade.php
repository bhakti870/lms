<ul class="dropdown-menu dropdown-menu-end shadow p-4 border-0" id="wishlist-dropdown" style="display: none; position: absolute; right: 0; top: 100%;">
    <li class="mb-3 border-bottom pb-2">
        <h6 class="fw-bold mb-0">My Wishlist</h6>
    </li>
    @forelse($wishlistItems as $item)
        <li class="mb-3 d-flex align-items-center">
            <img src="{{ asset($item->course->course_image) }}" alt="{{ $item->course->course_name }}" width="50" height="50" class="rounded me-3 object-fit-cover border">
            <div class="flex-grow-1 min-w-0">
                <h6 class="mb-0 small fw-bold text-truncate">{{ $item->course->course_name }}</h6>
                <p class="mb-0 small text-muted">₹{{ number_format($item->course->selling_price, 2) }}</p>
            </div>
            <a href="{{ route('course-details', $item->course->course_name_slug) }}" class="btn btn-sm btn-outline-theme ms-2"><i class="bi bi-eye"></i></a>
        </li>
    @empty
        <li class="p-4 text-center text-muted">
            <i class="bi bi-heart fs-1 opacity-25 d-block mb-2"></i>
            <span class="small">Your wishlist is empty</span>
        </li>
    @endforelse

    @if($wishlistItems->count() > 0)
    <li><hr class="dropdown-divider"></li>
    <li>
        <a href="{{ route('user.wishlist.index') }}" class="btn btn-theme w-100 py-2 text-white">View Full Wishlist</a>
    </li>
    @endif
</ul>

{{-- JS removed in favor of CSS hover and bridge for better stability --}}





