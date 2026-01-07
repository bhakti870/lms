    <section class="testimonial-section py-5 bg-light position-relative">
        <div class="container py-4">

            <div class="text-center mb-5">
                <h2 class="fw-bold">What Our Learners Say</h2>
            </div>

            <div id="testimonialCarousel" class="carousel slide" data-bs-ride="carousel">

                <div class="carousel-indicators custom-dots">
                    @foreach($reviews as $key => $review)
                        <button type="button" data-bs-target="#testimonialCarousel" data-bs-slide-to="{{ $key }}" class="{{ $key == 0 ? 'active' : '' }}"
                            aria-current="{{ $key == 0 ? 'true' : 'false' }}" aria-label="Slide {{ $key + 1 }}"></button>
                    @endforeach
                </div>

                <div class="carousel-inner pb-5">
                    @forelse($reviews as $key => $review)
                    <div class="carousel-item {{ $key == 0 ? 'active' : '' }}">
                        <div class="testimonial-card text-center mx-auto" style="max-width: 800px;">

                            <div class="mb-4 position-relative d-inline-block">
                                <img src="{{ $review->user->photo ? asset($review->user->photo) : 'https://placehold.co/120x120/5b50d6/ffffff?text='.urlencode($review->user->name) }}"
                                    class="testimonial-img rounded-circle shadow-lg" alt="{{ $review->user->name }}">
                                <div class="quote-icon">
                                    <i class="bi bi-quote"></i>
                                </div>
                            </div>

                            <div class="testimonial-content">
                                <div class="mb-3 text-warning">
                                    @for($i = 0; $i < 5; $i++)
                                        @if($i < $review->rating)
                                            <i class="bi bi-star-fill"></i>
                                        @else
                                            <i class="bi bi-star"></i>
                                        @endif
                                    @endfor
                                </div>
                                <h4 class="fs-4 fw-normal fst-italic mb-4 text-muted lh-base">
                                    "{{ $review->comment }}"
                                </h4>
                                <div>
                                    <h5 class="fw-bold mb-1">{{ $review->user->name }}</h5>
                                    <span class="text-theme small fw-bold text-uppercase">{{ $review->user->designation ?? 'Student' }}</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    @empty
                    <div class="carousel-item active">
                         <div class="testimonial-card text-center mx-auto">
                            <p class="text-muted">No reviews yet.</p>
                         </div>
                    </div>
                    @endforelse
                </div>
            </div>
        </div>
    </section>
