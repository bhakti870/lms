@if($wishlist->count() > 0)
    @foreach($wishlist as $item)
    <div class="col-lg-4 mb-4">
        <div class="card border-0 shadow-sm h-100 overflow-hidden rounded-4">
            <div class="position-relative">
                <a href="{{ route('course-details', $item->course->course_name_slug) }}">
                    <img src="{{ asset($item->course->course_image) }}" class="card-img-top object-fit-cover" alt="Course Image" style="height: 200px;">
                </a>
                <div class="position-absolute top-0 end-0 p-3">
                    @if($item->course->bestseller == 'yes')
                         <span class="badge bg-warning text-dark rounded-pill px-3">Bestseller</span>
                    @endif
                </div>
            </div>
            <div class="card-body p-4">
                <h6 class="fw-bold mb-2">
                    <a href="{{ route('course-details', $item->course->course_name_slug) }}" class="text-dark text-decoration-none">
                        {{ $item->course->course_name }}
                    </a>
                </h6>
                <p class="text-muted small mb-3">By <span class="text-theme">{{ $item->course->user->name }}</span></p>
                
                <div class="d-flex justify-content-between align-items-center mt-3">
                    <div>
                        <span class="fw-bold fs-5 text-theme">₹{{ number_format($item->course->discount_price ?? $item->course->selling_price, 2) }}</span>
                        @if($item->course->discount_price && $item->course->selling_price > $item->course->discount_price)
                            <span class="text-muted text-decoration-line-through small ms-1">₹{{ number_format($item->course->selling_price, 2) }}</span>
                        @endif
                    </div>
                    <div class="d-flex gap-2">
                        <a href="{{ route('course-details', $item->course->course_name_slug) }}" class="btn btn-sm btn-outline-theme rounded-circle p-2" title="View Course">
                            <i class="bi bi-eye"></i>
                        </a>
                        <button class="btn btn-sm btn-outline-danger rounded-circle p-2 remove-wishlist" data-id="{{ $item->id }}" title="Remove from wishlist">
                            <i class="bi bi-trash"></i>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    @endforeach
@else
    <div class="col-12 text-center py-5">
        <div class="mb-4">
            <i class="bi bi-heart text-muted opacity-25" style="font-size: 5rem;"></i>
        </div>
        <h3 class="fw-bold">Your wishlist is empty.</h3>
        <p class="text-muted">Start adding courses you're interested in.</p>
        <a href="{{ route('all.courses') }}" class="btn btn-theme mt-3">Browse Courses</a>
    </div>
@endif

