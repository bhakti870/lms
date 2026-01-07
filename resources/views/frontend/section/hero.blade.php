@if($all_sliders->count() > 0)
<section class="hero-carousel-wrapper">
    <div id="heroCarousel" class="carousel slide carousel-fade" data-bs-ride="carousel" data-bs-interval="5000">
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
                <div class="image-container hero-main-container">
                    <img src="{{ asset($slider->image) }}" alt="{{ $slider->title }}" class="my-image hero-bg-img">
                    <div class="hero-soft-overlay"></div>

                    <div class="container position-relative content-layer h-100">
                        <div class="row align-items-center h-100">
                            {{-- Left Side: Exact Match Circular Composition --}}
                            <div class="col-lg-4 d-none d-lg-block p-0">
                                <div class="instructor-circle-wrapper position-relative" data-aos="fade-right" data-aos-duration="1200">
                                    <div class="main-visual-container">
                                        {{-- Large Main Circle --}}
                                        <div class="instructor-main-circle shadow-lg">
                                            @if(isset($top_instructors) && count($top_instructors) >= 1)
                                                <img src="{{ asset($top_instructors[0]->photo) }}" alt="{{ $top_instructors[0]->name }}">
                                            @else
                                                <img src="{{ asset('frontend/new_design/smile3.jpg') }}" alt="Default">
                                            @endif
                                            
                                            {{-- Curved Text attached to the large circle --}}
                                            <div class="curved-text-overlay">
                                                <svg viewBox="0 0 200 200" class="curved-svg">
                                                    <path id="curve-{{ $key }}" d="M 185, 120 A 85, 85 0 0, 1 120, 185" fill="transparent" />
                                                    <text class="curved-svg-text">
                                                        <textPath xlink:href="#curve-{{ $key }}" startOffset="50%" text-anchor="middle">
                                                            Top Rated Instructors
                                                        </textPath>
                                                    </text>
                                                </svg>
                                            </div>
                                        </div>

                                        {{-- Smaller Top/Right Overlapping Circle --}}
                                        <div class="instructor-side-circle shadow-md">
                                            @if(isset($top_instructors) && count($top_instructors) >= 2)
                                                <img src="{{ asset($top_instructors[1]->photo) }}" alt="{{ $top_instructors[1]->name }}">
                                            @else
                                                <img src="{{ asset('frontend/new_design/smile1.png') }}" alt="Default">
                                            @endif
                                        </div>
                                    </div>
                                    
                                    {{-- Background Glow --}}
                                    <div class="hero-blue-glow"></div>
                                </div>
                            </div>

                            {{-- Center Content --}}
                            <div class="col-lg-4 text-center text-content">
                                <div class="hero-center-badge mb-4" data-aos="fade-down">
                                    <span class="badge bg-white text-dark px-3 py-2 rounded-pill shadow-sm border premium-badge">
                                        <i class="bi bi-mortarboard-fill me-2 text-primary"></i>
                                        Level Up with Flexible Online Training
                                    </span>
                                </div>
                                <h1 class="display-4 fw-bold mb-4 text-black hero-heading" data-aos="fade-up" data-aos-delay="100">
                                    @php
                                        $title = $slider->title;
                                        $keyword = "Online Training";
                                        $parts = explode($keyword, $title);
                                    @endphp
                                    @if(count($parts) > 1)
                                        {!! $parts[0] !!} <span class="position-relative hero-highlight">{{ $keyword }}<span class="title-underline"></span></span> {!! $parts[1] !!}
                                    @else
                                        {!! $title !!}
                                    @endif
                                </h1>
                                <p class="lead mb-5 text-black opacity-90 hero-text" data-aos="fade-up" data-aos-delay="200">
                                    {{ $slider->short_description }}
                                </p>
                                <div class="d-flex justify-content-center gap-3" data-aos="fade-up" data-aos-delay="300">
                                    <a href="{{ route('all.courses') }}" class="btn btn-primary btn-premium-pill px-4">Start Learning Now <i class="bi bi-arrow-right ms-2"></i></a>
                                    <a href="{{ route('all.courses') }}" class="btn btn-outline-dark btn-premium-pill px-4">Browse Courses</a>
                                </div>
                            </div>

                            {{-- Right Side Images --}}
                            <div class="col-lg-4 d-none d-lg-block position-relative h-100">
                                <div class="right-visual-composition h-100" data-aos="fade-left" data-aos-duration="1200">
                                    <div class="rect-frame rect-b-back shadow-sm">
                                        @if(isset($top_instructors) && count($top_instructors) >= 3)
                                            <img src="{{ asset($top_instructors[2]->photo) }}" alt="{{ $top_instructors[2]->name }}">
                                        @else
                                            <img src="{{ asset('frontend/new_design/smile2.jpg') }}" alt="Default">
                                        @endif
                                    </div>

                                    <div class="rect-frame rect-b-front shadow-lg">
                                        @if(isset($top_instructors) && count($top_instructors) >= 4)
                                            <img src="{{ asset($top_instructors[3]->photo) }}" alt="{{ $top_instructors[3]->name }}">
                                        @else
                                            <img src="{{ asset('frontend/new_design/smile3.jpg') }}" alt="Default">
                                        @endif
                                    </div>

                                    <div class="active-learners-badge-premium shadow-sm">
                                        <div class="avatar-group-sm">
                                            @if(isset($learner_avatars) && count($learner_avatars) > 0)
                                                @foreach($learner_avatars as $learner)
                                                    <img src="{{ asset($learner->photo) }}" alt="{{ $learner->name }}">
                                                @endforeach
                                            @else
                                                <img src="https://i.pravatar.cc/100?u=1" alt="U">
                                                <img src="https://i.pravatar.cc/100?u=2" alt="U">
                                                <img src="https://i.pravatar.cc/100?u=3" alt="U">
                                            @endif
                                        </div>
                                        <div class="learner-stats-sm">
                                            <strong>{{ isset($active_learners_count) ? $active_learners_count . '+' : '6k+' }}</strong>
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
    </div>
</section>

<style>
/* Reset and Base Styles */
.hero-main-container {
    height: 90vh;
    min-height: 700px;
    background: #fff;
    position: relative;
}

.hero-bg-img {
    filter: brightness(1.02);
}

.hero-soft-overlay {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: radial-gradient(circle at 50% 50%, rgba(255, 255, 255, 0.4) 0%, rgba(255, 255, 255, 0) 100%);
    pointer-events: none;
    z-index: 1;
}

/* --- Left Section EXACT MATCH --- */
.instructor-circle-wrapper {
    height: 100%;
    display: flex;
    align-items: center;
    justify-content: center;
}

.main-visual-container {
    position: relative;
    width: 350px;
    height: 350px;
    z-index: 2;
}

.instructor-main-circle {
    position: absolute;
    width: 280px;
    height: 280px;
    left: 0;
    bottom: 0;
    border-radius: 50%;
    border: 8px solid #fff;
    overflow: hidden;
    background: #fff;
    z-index: 2;
}

.instructor-side-circle {
    position: absolute;
    width: 180px;
    height: 180px;
    top: 0;
    right: 0;
    border-radius: 50%;
    border: 6px solid #fff;
    overflow: hidden;
    background: #fff;
    z-index: 3;
}

.instructor-main-circle img, .instructor-side-circle img {
    width: 100%;
    height: 100%;
    object-fit: cover;
}

.curved-text-overlay {
    position: absolute;
    width: 130%;
    height: 130%;
    top: -15%;
    left: -15%;
    z-index: 4;
    pointer-events: none;
}

.curved-svg {
    width: 100%;
    height: 100%;
    overflow: visible;
}

.curved-svg-text {
    font-size: 13px;
    font-weight: 500;
    fill: #777;
    font-family: 'Roboto', sans-serif;
}

.hero-blue-glow {
    position: absolute;
    width: 400px;
    height: 400px;
    background: radial-gradient(circle, rgba(0, 191, 255, 0.15) 0%, rgba(255,255,255,0) 70%);
    filter: blur(40px);
    z-index: 1;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
}

.instructors-badge-premium {
    position: absolute;
    bottom: 20px;
    left: -20px;
    background: #fff;
    padding: 10px 15px;
    border-radius: 15px;
    display: flex;
    align-items: center;
    gap: 12px;
    z-index: 5;
    box-shadow: 0 10px 25px rgba(0,0,0,0.05);
}

/* --- Content Styles (Black Font & Small Pill Buttons) --- */
.hero-heading {
    color: #000000 !important;
    font-size: 3.2rem;
    line-height: 1.1;
    letter-spacing: -1.5px;
}

.hero-text {
    color: #333 !important;
    font-size: 1.1rem;
    font-weight: 500;
    max-width: 500px;
    margin-left: auto;
    margin-right: auto;
}

.premium-badge {
    border-color: #eee !important;
    color: #333 !important;
    font-weight: 600;
}

.btn-premium-pill {
    padding: 10px 24px !important;
    border-radius: 50px !important;
    font-weight: 700;
    font-size: 0.95rem;
    transition: all 0.3s ease;
    text-transform: capitalize;
}

.title-underline {
    position: absolute;
    left: 0;
    bottom: 5px;
    width: 100%;
    height: 12px;
    background: #FFBD00;
    opacity: 0.7;
    z-index: -1;
    border-radius: 6px;
}

/* --- Right Side Fixes --- */
.right-visual-composition {
    position: relative;
    width: 100%;
    display: flex;
    align-items: center;
    justify-content: flex-end;
}

.rect-frame {
    border-radius: 20px;
    border: 6px solid #fff;
    overflow: hidden;
    background: #fff;
    position: absolute;
}

.rect-b-back {
    width: 220px;
    height: 380px;
    top: 50%;
    transform: translateY(-50%);
    right: 0;
}

.rect-b-front {
    width: 180px;
    height: 250px;
    bottom: 15%;
    right: 180px;
    z-index: 2;
}

.rect-frame img {
    width: 100%;
    height: 100%;
    object-fit: cover;
}

.active-learners-badge-premium {
    position: absolute;
    bottom: 80px;
    right: -10px;
    background: #fff;
    padding: 10px 15px;
    border-radius: 15px;
    display: flex;
    align-items: center;
    gap: 12px;
    z-index: 3;
}

.avatar-group-sm {
    display: flex;
}

.avatar-group-sm img {
    width: 35px;
    height: 35px;
    border-radius: 50%;
    border: 2px solid #fff;
    margin-left: -12px;
}

.avatar-group-sm img:first-child { margin-left: 0; }

.learner-stats-sm {
    display: flex;
    flex-direction: column;
}

.learner-stats-sm strong { color: #000; font-size: 16px; line-height: 1; }
.learner-stats-sm span { font-size: 12px; color: #666; }

/* Responsive Adjustments */
@media (max-width: 1400px) {
    .main-visual-container { transform: scale(0.85); transform-origin: left center; }
    .right-visual-composition { transform: scale(0.85); transform-origin: right center; }
}

@media (max-width: 1200px) {
    .main-visual-container { transform: scale(0.7); }
    .right-visual-composition { transform: scale(0.7); }
    .hero-heading { font-size: 2.6rem; }
}

@media (max-width: 991px) {
    .hero-heading { font-size: 2.2rem; }
    .hero-main-container { height: auto; min-height: 600px; padding: 60px 0 100px; }
    .main-visual-container, .right-visual-composition { display: none; }
    .hero-text { font-size: 1rem; max-width: 100%; }
}

@media (max-width: 576px) {
    .hero-heading { font-size: 1.8rem; }
    .hero-btns-group { flex-direction: column; width: 100%; gap: 10px !important; }
    .btn-premium-pill { width: 100%; }
}
</style>
@else
{{-- Fallback Hero if no sliders --}}
<section class="hero-carousel-wrapper">
    <div class="image-container hero-main-container">
        <img src="{{ asset('frontend/new_design/pastel-gradient-2.jpg') }}" alt="Background" class="my-image hero-bg-img">
        <div class="hero-soft-overlay"></div>
        <div class="container h-100">
             <div class="row align-items-center h-100">
                  <div class="col-12 text-center">
                       <h1 class="hero-heading">Welcome to Olan Learning</h1>
                       <p class="hero-text">Empowering your future with expert-led courses.</p>
                       <a href="{{ route('all.courses') }}" class="btn btn-primary btn-premium-pill">Browse Courses</a>
                  </div>
             </div>
        </div>
    </div>
</section>
@endif
