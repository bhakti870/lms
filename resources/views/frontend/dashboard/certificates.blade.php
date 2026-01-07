@extends('frontend.master')

@section('content')
@include('frontend.section.breadcrumb', ['title' => 'My Certificates'])

<section class="py-5 bg-light">
    <div class="container">
        <div class="row g-4">
            <!-- Sidebar -->
            <div class="col-lg-4 col-xl-3">
                @include('frontend.dashboard.user_dashboard_sidebar')
            </div>

            <!-- Content -->
            <div class="col-lg-8 col-xl-9">
                <div class="text-start mb-5 mt-2">
                    <h2 class="fw-bold text-dark">My <span class="text-theme">Certificates</span></h2>
                    <p class="text-muted">Congratulations on your achievements! Here are all your earned certificates.</p>
                </div>

                <div class="row g-4">
                    @if(count($certificates) > 0)
                        @foreach ($certificates as $certificate)
                            <div class="col-md-6 col-xl-4">
                                <div class="card border-0 shadow-sm rounded-4 h-100 overflow-hidden certificate-card">
                                    <div class="card-body p-4 text-center">
                                        <div class="certificate-icon mb-4">
                                            <div class="bg-success-subtle text-success p-4 rounded-circle d-inline-flex align-items-center justify-content-center" style="width: 80px; height: 80px;">
                                                <i class="bi bi-patch-check-fill fs-2"></i>
                                            </div>
                                        </div>
                                        <h6 class="fw-bold mb-2">{{ $certificate->course->course_name }}</h6>
                                        <p class="text-muted small mb-4">Issued on {{ $certificate->issued_at->format('d M, Y') }}</p>
                                        
                                        <div class="d-grid gap-2">
                                            <a href="{{ route('user.course.certificate', $certificate->course_id) }}" target="_blank" class="btn btn-theme text-white rounded-pill btn-sm fw-bold">
                                                <i class="bi bi-download me-2"></i> Download
                                            </a>
                                        </div>
                                    </div>
                                    <div class="card-footer bg-white border-0 text-center pb-3 pt-0">
                                        <small class="text-muted text-uppercase tracking-wider fw-bold" style="font-size: 0.6rem;">ID: {{ $certificate->certificate_number }}</small>
                                    </div>
                                </div>
                            </div>
                        @endforeach
                    @endif

                    <!-- Earnable Certificates Section -->
                    @if(isset($earnableCourses) && count($earnableCourses) > 0)
                        <div class="col-12 mt-5 mb-2">
                            <h4 class="fw-bold text-dark">Earnable <span class="text-theme">Certificates</span></h4>
                            <p class="text-muted small">Complete these courses to unlock your official certificates.</p>
                        </div>
                        @foreach ($earnableCourses as $earnable)
                            <div class="col-md-6 col-xl-4">
                                <div class="card border-0 shadow-sm rounded-4 h-100 overflow-hidden earnable-card">
                                    <div class="card-body p-4">
                                        <div class="d-flex align-items-center mb-3">
                                            <div class="bg-theme-subtle text-theme p-3 rounded-3 me-3">
                                                <i class="bi bi-award fs-4"></i>
                                            </div>
                                            <div>
                                                <h6 class="fw-bold mb-0 text-truncate" style="max-width: 150px;">{{ $earnable->course->course_name }}</h6>
                                                <small class="text-muted">In Progress</small>
                                            </div>
                                        </div>
                                        
                                        <div class="progress-wrapper mb-4">
                                            <div class="d-flex justify-content-between mb-2">
                                                <span class="small text-muted">Progress</span>
                                                <span class="small fw-bold text-theme">{{ $earnable->progress_percent }}%</span>
                                            </div>
                                            <div class="progress" style="height: 6px;">
                                                <div class="progress-bar bg-theme" role="progressbar" style="width: {{ $earnable->progress_percent }}%" aria-valuenow="{{ $earnable->progress_percent }}" aria-valuemin="0" aria-valuemax="100"></div>
                                            </div>
                                            <div class="mt-2 text-center">
                                                <small class="text-muted" style="font-size: 0.7rem;">{{ $earnable->completed_items }} / {{ $earnable->total_items }} Lessons Completed</small>
                                            </div>
                                        </div>

                                        <div class="d-grid">
                                            <a href="{{ route('user.course.learn', $earnable->course_id) }}" class="btn btn-outline-theme rounded-pill btn-sm fw-bold">
                                                {{ $earnable->progress_percent > 0 ? 'Continue Learning' : 'Start Course' }}
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        @endforeach
                    @endif

                    @if(count($certificates) == 0 && (!isset($earnableCourses) || count($earnableCourses) == 0))
                        <div class="col-12">
                            <div class="card border-0 shadow-sm rounded-4 py-5">
                                <div class="card-body text-center py-5">
                                    <div class="mb-4">
                                        <i class="bi bi-award text-muted opacity-25" style="font-size: 5rem;"></i>
                                    </div>
                                    <h4 class="fw-bold mb-3">No Certificates Available</h4>
                                    <p class="text-muted mb-4 mx-auto" style="max-width: 500px;">Enroll in courses that offer certificates and complete them to see them here!</p>
                                    <a href="{{ route('all.courses') }}" class="btn btn-theme px-5 py-3 rounded-pill text-white fw-bold shadow-theme">
                                        <i class="bi bi-search me-2"></i> Browse Courses
                                    </a>
                                </div>
                            </div>
                        </div>
                    @endif
                </div>
            </div>
        </div>
    </div>
</section>

<script>
function copyCertificateLink(link) {
    navigator.clipboard.writeText(link).then(function() {
        alert('Certificate link copied to clipboard!');
    }, function(err) {
        console.error('Could not copy text: ', err);
    });
}
</script>

<style>
.certificate-card, .earnable-card {
    transition: transform 0.3s ease, box-shadow 0.3s ease;
    border: 1px solid rgba(0,0,0,0.05) !important;
}
.certificate-card:hover, .earnable-card:hover {
    transform: translateY(-5px);
    box-shadow: 0 1rem 3rem rgba(0,0,0,.08) !important;
}
.bg-theme-subtle {
    background-color: rgba(var(--bs-primary-rgb), 0.1);
}
.text-theme {
    color: var(--bs-primary);
}
.btn-outline-theme {
    color: var(--bs-primary);
    border-color: var(--bs-primary);
}
.btn-outline-theme:hover {
    background-color: var(--bs-primary);
    color: #fff;
}
.progress-bar.bg-theme {
    background-color: var(--bs-primary);
}
.tracking-wider {
    letter-spacing: 0.1em;
}
</style>
@endsection
