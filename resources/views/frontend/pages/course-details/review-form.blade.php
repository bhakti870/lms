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
                        <input type="radio" name='rating' id="main-star5" value="5" required />
                        <label for="main-star5" class="fs-4"></label>
                        <input type="radio" name='rating' id="main-star4" value="4" />
                        <label for="main-star4" class="fs-4"></label>
                        <input type="radio" name='rating' id="main-star3" value="3" />
                        <label for="main-star3" class="fs-4"></label>
                        <input type="radio" name='rating' id="main-star2" value="2" />
                        <label for="main-star2" class="fs-4"></label>
                        <input type="radio" name='rating' id="main-star1" value="1" />
                        <label for="main-star1" class="fs-4"></label>
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
