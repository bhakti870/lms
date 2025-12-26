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
                         src="{{ $review->user->photo ? asset('uploads/user_images/'.$review->user->photo) : asset('uploads/no_image.jpg') }}" 
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

@auth
    @php
        $isEnrolled = App\Models\Enrollment::where('user_id', Auth::id())->where('course_id', $course->id)->exists();
    @endphp

    @if($isEnrolled)
    <div class="course-overview-card pt-5">
        <h3 class="fs-24 fw-bold pb-4 text-dark">Write a Review</h3>
        <div class="card border-0 shadow-sm rounded-4 p-4 bg-light">
            <form action="{{ route('store.review') }}" method="post">
                @csrf
                <input type="hidden" name="course_id" value="{{ $course->id }}">
                
                <div class="mb-4">
                    <label class="form-label fw-bold">Your Rating</label>
                    <div class="leave-rating leave--rating d-flex gap-2">
                        <input type="radio" name='rating' id="star5" value="5" required />
                        <label for="star5" class="fs-4"></label>
                        <input type="radio" name='rating' id="star4" value="4" />
                        <label for="star4" class="fs-4"></label>
                        <input type="radio" name='rating' id="star3" value="3" />
                        <label for="star3" class="fs-4"></label>
                        <input type="radio" name='rating' id="star2" value="2" />
                        <label for="star2" class="fs-4"></label>
                        <input type="radio" name='rating' id="star1" value="1" />
                        <label for="star1" class="fs-4"></label>
                    </div>
                </div>

                <div class="mb-4">
                    <label class="form-label fw-bold">Your Review</label>
                    <textarea class="form-control border-0 shadow-inner rounded-3 p-3" name="comment" placeholder="Share your experience..." rows="5" required style="resize: none;"></textarea>
                </div>
                
                <button class="btn btn-theme rounded-pill px-5 fw-bold" type="submit">Submit Review</button>
            </form>
        </div>
    </div>
    @endif
@else
    <div class="course-overview-card pt-5">
        <div class="alert alert-light border-0 shadow-sm rounded-4 d-flex align-items-center gap-3" role="alert">
            <i class="bi bi-info-circle-fill text-theme fs-4"></i>
            <div>
                Please <a href="{{ route('login') }}" class="fw-bold text-theme text-decoration-none">login</a> to leave a review.
            </div>
        </div>
    </div>
@endauth
