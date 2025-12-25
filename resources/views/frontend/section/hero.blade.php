@if($all_sliders->count() > 0)
<section class="hero-carousel-wrapper">
    <div id="heroCarousel" class="carousel slide carousel-fade" data-bs-ride="carousel">
        {{-- Indicators --}}
        @if($all_sliders->count() > 1)
        <div class="carousel-indicators">
            @foreach($all_sliders as $key => $slider)
                <button type="button" data-bs-target="#heroCarousel" data-bs-slide-to="{{ $key }}" class="{{ $key == 0 ? 'active' : '' }}" aria-current="{{ $key == 0 ? 'true' : 'false' }}" aria-label="Slide {{ $key + 1 }}"></button>
            @endforeach
        </div>
        @endif

        <div class="carousel-inner">
            @foreach($all_sliders as $key => $slider)
            <div class="carousel-item {{ $key == 0 ? 'active' : '' }}">
                <div class="image-container">
                    <img src="{{ asset($slider->image) }}" alt="{{ $slider->title }}" class="my-image">
                    
                    <div class="container position-relative content-layer">
                        <div class="row align-items-center">
                            {{-- Left Side Float --}}
                            <div class="col-lg-3 d-none d-lg-block">
                                <div class="image-group left-group">
                                    <img src="{{ asset('frontend/new_design/smile1.png') }}" class="hero-float-img float-back" alt="Left Image">
                                </div>
                            </div>

                            {{-- Center Content --}}
                            <div class="col-lg-5 text-center text-content">
                                <span class="badge bg-white text-primary mb-3 px-3 py-2 rounded-pill shadow-sm">
                                    <i class="bi bi-mortarboard-fill me-2"></i>Online Training
                                </span>
                                <h1 class="display-4 fw-bold mb-3 text-white">
                                    {{ $slider->title }}
                                </h1>
                                <p class="lead mb-4 text-white opacity-75">
                                    {{ $slider->short_description }}
                                </p>
                                <div class="d-flex justify-content-center gap-3">
                                    <a href="{{ route('all.courses') }}" class="btn btn-theme btn-lg text-white px-4">Start Learning</a>
                                    <a href="{{ route('all.instructors') }}" class="btn btn-outline-light btn-lg px-4">Our Instructors</a>
                                </div>
                            </div>

                            {{-- Right Side Images --}}
                            <div class="col-lg-4 d-none d-lg-block position-relative">
                                <div class="right-image-composition">
                                    <img src="{{ asset('frontend/new_design/smile2.jpg') }}" alt="Student" class="hero-img right-back-img">
                                    <img src="{{ asset('frontend/new_design/smile3.jpg') }}" alt="Student" class="hero-img right-front-img">

                                    <div class="active-learners-badge">
                                        <div class="avatar-group">
                                            <img src="https://i.pravatar.cc/150?u=1" alt="User">
                                            <img src="https://i.pravatar.cc/150?u=2" alt="User">
                                            <img src="https://i.pravatar.cc/150?u=3" alt="User">
                                        </div>
                                        <div class="learner-text">
                                            <strong>6.8k+</strong><br>
                                            <span>Active Learners</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="hero-wave-curves bottom-wave-section"></div>
                </div>
            </div>
            @endforeach
        </div>

        {{-- Controls --}}
        @if($all_sliders->count() > 1)
        <button class="carousel-control-prev" type="button" data-bs-target="#heroCarousel" data-bs-slide="prev">
            <span class="carousel-control-prev-icon p-3 rounded-circle bg-dark bg-opacity-25" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#heroCarousel" data-bs-slide="next">
            <span class="carousel-control-next-icon p-3 rounded-circle bg-dark bg-opacity-25" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
        @endif
    </div>
</section>
@else
{{-- Fallback Hero if no sliders --}}
<section>
    <div class="image-container">
        <img src="{{ asset('frontend/new_design/pastel-gradient-2.jpg') }}" alt="Background" class="my-image">

        <div class="container position-relative content-layer">
            <div class="row align-items-center">
                <div class="col-lg-3 d-none d-lg-block">
                    <div class="image-group left-group">
                        <img src="{{ asset('frontend/new_design/smile1.png') }}" class="hero-float-img float-back" alt="Left Image">
                    </div>
                </div>

                <div class="col-lg-5 text-center text-content">
                    <span class="badge bg-white text-primary mb-3 px-3 py-2 rounded-pill shadow-sm">
                        <i class="bi bi-mortarboard-fill me-2"></i>Online Training
                    </span>
                    <h1 class="display-4 fw-bold mb-3 text-white">
                        Level Up With Expert-Led <br>
                        <span class="text-theme">Online Training</span>
                    </h1>
                    <p class="lead mb-4 text-white opacity-75">
                        Flexible, career-focused courses designed to help individuals and teams grow.
                    </p>
                    <div class="d-flex justify-content-center gap-3">
                        <a href="{{ route('all.courses') }}" class="btn btn-theme btn-lg text-white">Start Learning</a>
                        <a href="{{ route('all.instructors') }}" class="btn btn-outline-light btn-lg">Browse Courses</a>
                    </div>
                </div>

                <div class="col-lg-4 d-none d-lg-block position-relative">
                    <div class="right-image-composition">
                        <img src="{{ asset('frontend/new_design/smile2.jpg') }}" alt="Student" class="hero-img right-back-img">
                        <img src="{{ asset('frontend/new_design/smile3.jpg') }}" alt="Student" class="hero-img right-front-img">
                        <div class="active-learners-badge">
                            <div class="avatar-group">
                                <img src="https://i.pravatar.cc/150?u=1" alt="User">
                                <img src="https://i.pravatar.cc/150?u=4" alt="User">
                                <img src="https://i.pravatar.cc/150?u=5" alt="User">
                            </div>
                            <div class="learner-text">
                                <strong>6.8k+</strong><br>
                                <span>Active Learners</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="hero-wave-curves bottom-wave-section"></div>
    </div>
</section>
@endif

<style>
.hero-carousel-wrapper .carousel-indicators [data-bs-target] {
    width: 10px;
    height: 10px;
    border-radius: 50%;
    margin: 0 5px;
}
.hero-carousel-wrapper .carousel-item {
    transition: transform 0.8s ease-in-out, opacity 0.8s ease-in-out;
}
</style>
