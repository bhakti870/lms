<section class="about-section py-5">
    <div class="container">
        <div class="row align-items-center">

            <div class="col-lg-6 mb-5 mb-lg-0 position-relative">
                <div class="about-image-wrapper" data-aos="fade-up" data-aos-delay="300">


                    <img src="{{ asset('frontend/new_design/about2.jpg') }}" alt="About Student" class="about-main-img">

                    <div class="about-card card-top-right shadow-sm">
                        <div class="icon-wrapper mb-2">
                            <i class="bi bi-people text-theme fs-4"></i>
                        </div>
                        <h4 class="fw-bold mb-0">{{ $active_learners_count }}+</h4>
                        <span class="text-muted small">Active Learners</span>
                    </div>

                    <div class="about-card card-bottom-left shadow-lg">
                        <div class="icon-wrapper mb-2">
                            <i class="bi bi-person-video3 text-white fs-4"></i>
                        </div>
                        <h4 class="fw-bold mb-0 text-white">{{ $instructors_count }}+</h4>
                        <span class="text-white small opacity-75">Expert Instructors</span>
                    </div>
                </div>
            </div>

            <div class="col-lg-6 ps-lg-5" data-aos="fade-up" data-aos-delay="450">
                <span class="text-theme fw-bold text-uppercase small">About Skillpoint</span>
                <h2 class="display-5 fw-bold mb-4 mt-2">One Platform. Infinite <br> Learning Possibilities.</h2>

                <p class="text-muted mb-4">
                    At Skillpoint, we believe quality education should be accessible, engaging, and empowering—for
                    everyone, everywhere.
                </p>

                <div class="about-features d-flex flex-column gap-3 mb-4">

                    <div class="d-flex align-items-start">
                        <div class="feature-icon me-3">
                            <i class="bi bi-check-lg text-white bg-theme rounded-circle p-1"></i>
                        </div>
                        <div>
                            <h6 class="fw-bold mb-1">Learn from Anywhere</h6>
                            <p class="text-muted small mb-0">Access your courses anytime, on any device—at home, at
                                work, or on the go.</p>
                        </div>
                    </div>

                    <div class="d-flex align-items-start">
                        <div class="feature-icon me-3">
                            <i class="bi bi-check-lg text-white bg-theme rounded-circle p-1"></i>
                        </div>
                        <div>
                            <h6 class="fw-bold mb-1">Teach with Confidence</h6>
                            <p class="text-muted small mb-0">All the tools you need to build, launch, and scale your
                                courses stress-free.</p>
                        </div>
                    </div>

                    <div class="d-flex align-items-start">
                        <div class="feature-icon me-3">
                            <i class="bi bi-check-lg text-white bg-theme rounded-circle p-1"></i>
                        </div>
                        <div>
                            <h6 class="fw-bold mb-1">Earn Real Certificates</h6>
                            <p class="text-muted small mb-0">Complete courses and receive professional certificates
                                to boost your career.</p>
                        </div>
                    </div>

                </div>

                <a href="#" class="btn btn-theme btn-lg text-white">Learn More About Us &rarr;</a>
            </div>

        </div>
    </div>
</section>
