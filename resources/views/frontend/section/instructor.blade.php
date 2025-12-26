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
                            <img src="{{ $instructor->photo ? asset($instructor->photo) : asset('frontend/images/small-avatar-1.jpg') }}" alt="{{ $instructor->name }}">

                            <div class="social-notch">
                                <a href="#"><i class="bi bi-facebook"></i></a>
                                <a href="#"><i class="bi bi-linkedin"></i></a>
                            </div>
                        </div>
                        <div class="instructor-info mt-3">
                            <h5 class="fw-bold mb-1">{{ $instructor->name }}</h5>
                            <p class="text-muted small">Specialist Instructor</p>
                        </div>
                    </div>
                </div>
            @endforeach
        </div>
    </div>
</section>
