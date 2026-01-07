<section class="breadcrumb-area pt-5 pb-5 bg-dark position-relative overflow-hidden">
    {{-- Background Glow Effect --}}
    <div class="position-absolute top-0 start-0 w-100 h-100 opacity-10" style="background: radial-gradient(circle at 10% 20%, #7079e7 0%, transparent 40%); pointer-events: none;"></div>
    
    <div class="container position-relative z-index-1">
        <div class="row">
            <div class="col-lg-8">
                <div class="breadcrumb-content text-white">
                    {{-- Breadcrumbs --}}
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb mb-3">
                            <li class="breadcrumb-item"><a href="{{ route('frontend.home') }}" class="text-white opacity-75 text-decoration-none">Home</a></li>
                            <li class="breadcrumb-item"><a href="{{ route('category.details', $course->category->slug) }}" class="text-white opacity-75 text-decoration-none">{{ $course['category']['name'] }}</a></li>
                            <li class="breadcrumb-item active text-white" aria-current="page">{{ $course['subcategory']['name'] }}</li>
                        </ol>
                    </nav>

                    {{-- Title --}}
                    <h1 class="display-5 fw-bold mb-3 text-white">{{ $course['course_name'] }}</h1>
                    
                    {{-- Subtitle --}}
                    <p class="lead text-white opacity-75 mb-4 fs-5">{{ $course['course_title'] }}</p>

                    {{-- Meta Badges & Ratings --}}
                    <div class="d-flex flex-wrap align-items-center gap-3 mb-4">
                        @if($course['bestseller'] == 'yes')
                            <span class="badge bg-warning text-dark rounded-pill px-3 py-2 fw-bold">
                                <i class="bi bi-award-fill me-1"></i> Bestseller
                            </span>
                        @endif
                        
                        @if($course['featured'] == 'yes')
                            <span class="badge bg-info text-white rounded-pill px-3 py-2 fw-bold">
                                <i class="bi bi-star-fill me-1"></i> Featured
                            </span>
                        @endif
                        
                        <span class="badge bg-theme text-white rounded-pill px-3 py-2 text-uppercase">
                            {{ $course['label'] }}
                        </span>

                        <div class="d-flex align-items-center text-warning">
                            <span class="fw-bold me-1 fs-5">{{ round($course->reviews->avg('rating'), 1) }}</span>
                            <div class="d-flex small me-2">
                                @for($i = 1; $i <= 5; $i++)
                                    @if($i <= round($course->reviews->avg('rating')))
                                        <i class="bi bi-star-fill"></i>
                                    @else
                                        <i class="bi bi-star"></i>
                                    @endif
                                @endfor
                            </div>
                            <span class="text-white opacity-75 small">({{ $course->reviews->count() }} ratings)</span>
                        </div>
                        
                        <div class="text-white opacity-75 small border-start border-secondary ps-3">
                            <i class="bi bi-people-fill me-1"></i> {{ $course->enrollments->count() }} students enrolled
                        </div>
                    </div>

                    {{-- Author & Last Updated --}}
                    <div class="d-flex flex-wrap align-items-center gap-4 text-white opacity-90 mb-4">
                        <div class="d-flex align-items-center">
                            <div class="me-2">
                                <img src="{{ $course->user->photo ? asset($course->user->photo) : asset('frontend/images/small-avatar-1.jpg') }}" 
                                     alt="{{ $course->user->name }}" 
                                     class="rounded-circle border border-2 border-white"
                                     width="40" height="40">
                            </div>
                            <div>
                                <span class="d-block small opacity-75 lh-1">Created by</span>
                                <a href="{{ route('instructor.details', $course->user->id) }}" class="text-white text-decoration-none fw-bold">{{ $course['user']['name'] }}</a>
                            </div>
                        </div>
                        
                        <div class="d-flex align-items-center small">
                            <i class="bi bi-exclamation-circle me-2 fs-5"></i>
                            <span>Last updated {{ \Carbon\Carbon::parse($course->updated_at)->format('M Y') }}</span>
                        </div>
                        
                        <div class="d-flex align-items-center small">
                            <i class="bi bi-globe me-2 fs-5"></i>
                            <span>English</span>
                        </div>
                    </div>

                    {{-- Action Buttons --}}
                    <div class="d-flex gap-2">
                        <button class="btn btn-outline-light rounded-pill px-4 btn-sm wishlist-icon" data-course-id="{{ $course->id }}">
                            <i class="bi {{ \App\Models\Wishlist::where('user_id', auth()->id())->where('course_id', $course->id)->exists() ? 'bi-heart-fill text-danger' : 'bi-heart' }} me-2"></i>
                            <span>{{ \App\Models\Wishlist::where('user_id', auth()->id())->where('course_id', $course->id)->exists() ? 'Wishlisted' : 'Wishlist' }}</span>
                        </button>
                        <button class="btn btn-outline-light rounded-pill px-4 btn-sm" data-bs-toggle="modal" data-bs-target="#shareModal">
                            <i class="bi bi-share me-2"></i> Share
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<style>
    /* Custom override for breadcrumb separator color in dark mode */
    .breadcrumb-item + .breadcrumb-item::before {
        color: rgba(255,255,255, 0.5);
    }
</style>
