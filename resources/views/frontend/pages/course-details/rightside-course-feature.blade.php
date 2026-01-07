<div class="sidebar-widget mt-4">
    <div class="card border-0 shadow-sm rounded-4 bg-white p-4">
        <h5 class="fw-bold mb-4 d-flex align-items-center">
            <i class="bi bi-grid-fill text-theme me-2"></i> Course Features
        </h5>

        <ul class="list-unstyled d-flex flex-column gap-3 mb-0">
            <li class="d-flex justify-content-between align-items-center pb-3 border-bottom border-light-subtle">
                <span class="text-secondary"><i class="bi bi-clock me-2"></i>Duration</span>
                <span class="fw-bold text-dark">{{ $total_lecture_duration }} hours</span>
            </li>
            
            <li class="d-flex justify-content-between align-items-center pb-3 border-bottom border-light-subtle">
                <span class="text-secondary"><i class="bi bi-camera-video me-2"></i>Lectures</span>
                <span class="fw-bold text-dark">{{ $total_lecture }}</span>
            </li>
            
            <li class="d-flex justify-content-between align-items-center pb-3 border-bottom border-light-subtle">
                <span class="text-secondary"><i class="bi bi-patch-question me-2"></i>Quizzes</span>
                <span class="fw-bold text-dark">{{ $course->quizzes->count() }}</span>
            </li>
            
            <li class="d-flex justify-content-between align-items-center pb-3 border-bottom border-light-subtle">
                <span class="text-secondary"><i class="bi bi-folder2-open me-2"></i>Resources</span>
                <span class="fw-bold text-dark">{{ $course->materials->count() }}</span>
            </li>
            
            <li class="d-flex justify-content-between align-items-center pb-3 border-bottom border-light-subtle">
                <span class="text-secondary"><i class="bi bi-globe me-2"></i>Language</span>
                <span class="fw-bold text-dark">English</span>
            </li>
            
            <li class="d-flex justify-content-between align-items-center pb-3 border-bottom border-light-subtle">
                <span class="text-secondary"><i class="bi bi-bar-chart-fill me-2"></i>Skill Level</span>
                <span class="badge bg-light text-dark border fw-bold text-uppercase">{{ $course->label }}</span>
            </li>
            
            <li class="d-flex justify-content-between align-items-center pb-3 border-bottom border-light-subtle">
                <span class="text-secondary"><i class="bi bi-people-fill me-2"></i>Students</span>
                <span class="fw-bold text-dark">{{ $course->enrollments->count() }}</span>
            </li>
            
            <li class="d-flex justify-content-between align-items-center">
                <span class="text-secondary"><i class="bi bi-award-fill me-2"></i>Certificate</span>
                @if($course->certificate == 'yes')
                    <span class="text-success fw-bold"><i class="bi bi-check-circle-fill me-1"></i>Yes</span>
                @else
                    <span class="text-muted fw-bold">No</span>
                @endif
            </li>
        </ul>
    </div>
</div>
