<div class="course-overview-card pt-5">
    <h3 class="fs-24 fw-bold pb-4 text-dark">Reviews</h3>
    <div class="review-wrap">
        @php
            $reviews = $course->reviews;
        @endphp

        @forelse($reviews as $review)
        <div class="card border-0 shadow-sm rounded-4 mb-4 p-4">
            <div class="d-flex align-items-start gap-4">
                <div class="flex-shrink-0">
                     <img class="rounded-circle object-fit-cover shadow-sm"
                            src="{{ $review->user->photo ? $review->user->photo : asset('uploads/no_image.jpg') }}"
                            alt="{{ $review->user->name }}" width="60" height="60">
                </div>
                <div class="flex-grow-1">
                    <div class="d-flex justify-content-between align-items-center mb-2">
                        <div>
                            <h5 class="fw-bold mb-1">{{ $review->user->name }}</h5>
                            <span class="text-muted small">{{ $review->created_at->diffForHumans() }}</span>
                        </div>
                        <div class="text-warning">
                            @for($i = 1; $i <= 5; $i++)
                                @if($i <= $review->rating)
                                    <i class="bi bi-star-fill"></i>
                                @else
                                    <i class="bi bi-star"></i>
                                @endif
                            @endfor
                        </div>
                    </div>
                    
                    <p class="text-secondary lh-lg mb-0">{{ $review->comment }}</p>
                </div>
            </div>
        </div>
        @empty
            <div class="text-center py-5 bg-light rounded-4">
                <i class="bi bi-chat-square-text text-muted fs-1 mb-3"></i>
                <p class="text-muted">No reviews yet. Be the first to share your thoughts!</p>
            </div>
        @endforelse
    </div>
</div>


