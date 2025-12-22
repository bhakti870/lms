<div class="course-overview-card pt-4">
    <h3 class="fs-24 font-weight-semi-bold pb-4">Reviews</h3>
    <div class="review-wrap">
        @php
            $reviews = $course->reviews;
        @endphp

        @forelse($reviews as $review)
        <div class="media media-card border-bottom border-bottom-gray pb-4 mb-4">
            <div class="media-img mr-4 rounded-full">
                <img class="rounded-full lazy" src="{{ $review->user->photo ? asset('uploads/user_images/'.$review->user->photo) : asset('uploads/no_image.jpg') }}" alt="User image">
            </div>
            <div class="media-body">
                <div class="d-flex flex-wrap align-items-center justify-content-between pb-1">
                    <h5>{{ $review->user->name }}</h5>
                    <div class="review-stars">
                        @for($i = 1; $i <= 5; $i++)
                            @if($i <= $review->rating)
                                <span class="la la-star"></span>
                            @else
                                <span class="la la-star-o"></span>
                            @endif
                        @endfor
                    </div>
                </div>
                <span class="d-block lh-18 pb-2">{{ $review->created_at->diffForHumans() }}</span>
                <p class="pb-2">{{ $review->comment }}</p>
            </div>
        </div><!-- end media -->
        @empty
            <p>No reviews yet for this course.</p>
        @endforelse
    </div><!-- end review-wrap -->
</div><!-- end course-overview-card -->

@auth
    @php
        $isEnrolled = App\Models\Enrollment::where('user_id', Auth::id())->where('course_id', $course->id)->exists();
    @endphp

    @if($isEnrolled)
    <div class="course-overview-card pt-4">
        <h3 class="fs-24 font-weight-semi-bold pb-4">Add a Review</h3>
        <form action="{{ route('store.review') }}" method="post" class="row">
            @csrf
            <input type="hidden" name="course_id" value="{{ $course->id }}">
            
            <div class="leave-rating-wrap pb-4 col-lg-12">
                <div class="leave-rating leave--rating">
                    <input type="radio" name='rating' id="star5" value="5" required />
                    <label for="star5"></label>
                    <input type="radio" name='rating' id="star4" value="4" />
                    <label for="star4"></label>
                    <input type="radio" name='rating' id="star3" value="3" />
                    <label for="star3"></label>
                    <input type="radio" name='rating' id="star2" value="2" />
                    <label for="star2"></label>
                    <input type="radio" name='rating' id="star1" value="1" />
                    <label for="star1"></label>
                </div><!-- end leave-rating -->
            </div>

            <div class="input-box col-lg-12">
                <label class="label-text">Message</label>
                <div class="form-group">
                    <textarea class="form-control form--control pl-3" name="comment" placeholder="Write Message" rows="5" required></textarea>
                </div>
            </div><!-- end input-box -->
            <div class="btn-box col-lg-12">
                <button class="btn theme-btn" type="submit">Submit Review</button>
            </div><!-- end btn-box -->
        </form>
    </div><!-- end course-overview-card -->
    @endif
@else
    <div class="course-overview-card pt-4">
        <p>Please <a href="{{ route('login') }}">login</a> to leave a review.</p>
    </div>
@endauth
