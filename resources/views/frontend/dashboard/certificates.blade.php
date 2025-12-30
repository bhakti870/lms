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
                    @forelse ($certificates as $certificate)
                        <div class="col-md-6 col-xl-4">
                            <div class="card border-0 shadow-sm rounded-4 h-100 overflow-hidden certificate-card">
                                <div class="card-body p-4 text-center">
                                    <div class="certificate-icon mb-4">
                                        <div class="bg-warning-subtle text-warning p-4 rounded-circle d-inline-flex align-items-center justify-content-center" style="width: 100px; height: 100px;">
                                            <i class="bi bi-patch-check-fill fs-1"></i>
                                        </div>
                                    </div>
                                    <h5 class="fw-bold mb-2">{{ $certificate->course->course_name }}</h5>
                                    <p class="text-muted small mb-4">Issued on {{ $certificate->issued_at->format('d M, Y') }}</p>
                                    
                                    <div class="d-grid gap-2">
                                        <a href="{{ route('user.course.certificate', $certificate->course_id) }}" target="_blank" class="btn btn-theme text-white rounded-pill fw-bold">
                                            <i class="bi bi-download me-2"></i> Download PDF
                                        </a>
                                        <button class="btn btn-outline-secondary rounded-pill fw-bold" onclick="copyCertificateLink('{{ route('user.course.certificate', $certificate->course_id) }}')">
                                            <i class="bi bi-share me-2"></i> Share Link
                                        </button>
                                    </div>
                                </div>
                                <div class="card-footer bg-white border-0 text-center pb-4 pt-0">
                                    <small class="text-muted text-uppercase tracking-wider fw-bold" style="font-size: 0.65rem;">ID: {{ $certificate->certificate_number }}</small>
                                </div>
                            </div>
                        </div>
                    @empty
                        <div class="col-12">
                            <div class="card border-0 shadow-sm rounded-4 py-5">
                                <div class="card-body text-center py-5">
                                    <div class="mb-4">
                                        <i class="bi bi-award text-muted opacity-25" style="font-size: 5rem;"></i>
                                    </div>
                                    <h4 class="fw-bold mb-3">No Certificates Yet</h4>
                                    <p class="text-muted mb-4 mx-auto" style="max-width: 500px;">Complete your enrolled courses to earn certificates and showcase your skills to the world!</p>
                                    <a href="{{ route('user.purchase.history') }}" class="btn btn-theme px-5 py-3 rounded-pill text-white fw-bold shadow-theme">
                                        <i class="bi bi-play-circle me-2"></i> Continue Learning
                                    </a>
                                </div>
                            </div>
                        </div>
                    @endforelse
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
.certificate-card {
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}
.certificate-card:hover {
    transform: translateY(-10px);
    box-shadow: 0 1rem 3rem rgba(0,0,0,.1) !important;
}
.tracking-wider {
    letter-spacing: 0.1em;
}
</style>
@endsection
