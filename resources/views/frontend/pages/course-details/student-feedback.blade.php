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

<div class="course-overview-card pt-5">
    <h3 class="fs-24 fw-bold pb-4 text-dark">Student Feedback</h3>
    
    <div class="card border-0 bg-light rounded-4 p-4 p-md-5">
        <div class="row align-items-center g-4">
            {{-- Big Rating Number --}}
            <div class="col-md-4 text-center border-end border-light-subtle">
                <div class="display-1 fw-bold text-dark">{{ $avg_rating > 0 ? $avg_rating : '0.0' }}</div>
                <div class="text-warning fs-5 mb-2">
                    @for($i = 1; $i <= 5; $i++)
                        @if($i <= $avg_rating)
                            <i class="bi bi-star-fill"></i>
                        @elseif($i - 0.5 <= $avg_rating)
                            <i class="bi bi-star-half"></i>
                        @else
                            <i class="bi bi-star"></i>
                        @endif
                    @endfor
                </div>
                <p class="fw-bold text-muted mb-0">Course Rating</p>
            </div>

            {{-- Progress Bars --}}
            <div class="col-md-8">
                @foreach($stars as $star)
                <div class="d-flex align-items-center mb-2">
                    <div class="progress w-100 rounded-pill" style="height: 8px; background-color: #e9ecef;">
                        <div class="progress-bar rounded-pill bg-warning" role="progressbar" 
                             style="width: {{ $percentages[$star] }}%" 
                             aria-valuenow="{{ $percentages[$star] }}" aria-valuemin="0" aria-valuemax="100"></div>
                    </div>
                    <div class="d-flex align-items-center ms-3" style="min-width: 100px;">
                        <div class="text-warning me-2">
                            @for($i=0; $i<5; $i++)
                                <i class="bi {{ $i < $star ? 'bi-star-fill' : 'bi-star' }} small"></i>
                            @endfor
                        </div>
                        <span class="fs-6 fw-bold text-secondary">{{ $percentages[$star] }}%</span>
                    </div>
                </div>
                @endforeach
            </div>
        </div>
    </div>
</div>
