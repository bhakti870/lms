 <section class="instructor-section py-5 bg-white" data-aos="fade-up" data-aos-delay="100">
        <div class="container py-4">

            <div class="text-center mb-5">
                <span class="text-theme fw-bold text-uppercase small">Mentors</span>
                <h2 class="fw-bold">Your Learning Guides</h2>
            </div>

            <div class="row g-4">

                @foreach($top_instructors as $instructor)
                <div class="col-lg-3 col-md-6 col-sm-6">
                    <div class="instructor-card">
                        <div class="instructor-img-wrapper">
                            <a href="{{ route('instructor.details', $instructor->id) }}">
                                <img src="{{ $instructor->photo ? asset($instructor->photo) : 'https://placehold.co/270x320/5b50d6/ffffff?text='.urlencode($instructor->name) }}" alt="{{ $instructor->name }}" style="width: 100%; height: 320px; object-fit: cover;">
                            </a>
                            {{-- Social links could be dynamic if user has them --}}
                            {{-- <div class="social-notch">
                                <a href="#"><i class="bi bi-facebook"></i></a>
                                <a href="#"><i class="bi bi-linkedin"></i></a>
                            </div> --}}
                        </div>
                        <div class="instructor-info mt-3">
                            <h5 class="fw-bold mb-1">
                                <a href="{{ route('instructor.details', $instructor->id) }}" class="text-reset text-decoration-none">{{ $instructor->name }}</a>
                            </h5>
                            <p class="text-muted small">{{ $instructor->designation ?? 'Instructor' }}</p>
                        </div>
                    </div>
                </div>
                @endforeach

            </div>
        </div>
    </section>
