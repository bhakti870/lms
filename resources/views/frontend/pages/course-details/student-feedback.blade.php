@php
    $reviews = $course->reviews;
    $total_reviews = $reviews->count();
    $avg_rating = $total_reviews > 0 ? round($reviews->avg('rating'), 1) : 0;
    
    $stars = [5, 4, 3, 2, 1];
    $percentages = [];
    foreach($stars as $star) {
        $count = $reviews->where('rating', $star)->count();
        $percentages[$star] = $total_reviews > 0 ? round(($count / $total_reviews) * 100) : 0;
    }
@endphp

<div class="course-overview-card pt-4">
    <h3 class="fs-24 font-weight-semi-bold pb-40px">Student feedback</h3>
    <div class="feedback-wrap">
        <div class="media media-card align-items-center">
            <div class="review-rating-summary">
                <span class="stats-average__count">{{ $avg_rating > 0 ? $avg_rating : '0.0' }}</span>
                <div class="rating-wrap pt-1">
                    <div class="review-stars">
                       @for($i = 1; $i <= 5; $i++)
                            @if($i <= $avg_rating)
                                <span class="la la-star"></span>
                            @elseif($i - 0.5 <= $avg_rating)
                                <span class="la la-star-half-o"></span>
                            @else
                                <span class="la la-star-o"></span>
                            @endif
                        @endfor
                    </div>
                    <span class="rating-total d-block">({{ $total_reviews }})</span>
                    <span>Course Rating</span>
                </div><!-- end rating-wrap -->
            </div><!-- end review-rating-summary -->
            <div class="media-body">
                @foreach($stars as $star)
                <div class="review-bars d-flex align-items-center mb-2">
                    <div class="review-bars__text">{{ $star }} stars</div>
                    <div class="review-bars__fill">
                        <div class="skillbar-box">
                            <div class="skillbar" data-percent="{{ $percentages[$star] }}%">
                                <div class="skillbar-bar bg-3" style="width: {{ $percentages[$star] }}%;"></div>
                            </div> <!-- End Skill Bar -->
                        </div>
                    </div><!-- end review-bars__fill -->
                    <div class="review-bars__percent">{{ $percentages[$star] }}%</div>
                </div><!-- end review-bars -->
                @endforeach
            </div><!-- end media-body -->
        </div>
    </div><!-- end feedback-wrap -->
</div><!-- end course-overview-card -->
