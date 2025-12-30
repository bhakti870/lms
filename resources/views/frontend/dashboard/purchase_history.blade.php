@extends('frontend.master')

@section('content')
@include('frontend.section.breadcrumb', ['title' => 'My Purchase History'])

<section class="py-5 bg-light">
    <div class="container">
        <div class="row g-4">
            <!-- Sidebar -->
            <div class="col-lg-4 col-xl-3">
                @include('frontend.dashboard.user_dashboard_sidebar')
            </div>

            <!-- Content -->
            <div class="col-lg-8 col-xl-9">
                <div class="card border-0 shadow-sm rounded-4 overflow-hidden mb-5">
                    <div class="card-header bg-white border-bottom p-4">
                        <h5 class="fw-bold mb-0">Enrolled Courses & Access</h5>
                    </div>
                    <div class="card-body p-0">
                        <div class="table-responsive">
                            <table class="table table-hover align-middle mb-0">
                                <thead class="bg-light">
                                    <tr>
                                        <th class="ps-4 border-0 small text-uppercase">Course</th>
                                        <th class="border-0 small text-uppercase">Date</th>
                                        <th class="border-0 small text-uppercase">Price</th>
                                        <th class="border-0 small text-uppercase">Status</th>
                                        <th class="text-end pe-4 border-0 small text-uppercase">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @forelse($courses as $enrollment)
                                    <tr>
                                        <td class="ps-4 py-3">
                                            <div class="d-flex align-items-center">
                                                <a href="{{ route('course-details', $enrollment->course->course_name_slug) }}" class="flex-shrink-0">
                                                    <img src="{{ asset($enrollment->course->course_image) }}" alt="Course" class="rounded-3 border" style="width: 70px; height: 50px; object-fit: cover;">
                                                </a>
                                                <div class="ms-3">
                                                    <h6 class="fw-bold mb-0">
                                                        <a href="{{ route('course-details', $enrollment->course->course_name_slug) }}" class="text-dark text-decoration-none small text-truncate d-block" style="max-width: 200px;">
                                                            {{ $enrollment->course->course_name }}
                                                        </a>
                                                    </h6>
                                                    <small class="text-muted">By {{ $enrollment->course->user->name }}</small>
                                                </div>
                                            </div>
                                        </td>
                                        <td><span class="text-muted small">{{ $enrollment->created_at->format('d M, Y') }}</span></td>
                                        <td>
                                            @php
                                                $order = \App\Models\Order::where('user_id', Auth::id())->where('course_id', $enrollment->course_id)->latest()->first();
                                            @endphp
                                            <span class="fw-bold text-theme">
                                                @if($enrollment->amount > 0)
                                                    ₹{{ number_format($enrollment->amount, 2) }}
                                                @elseif($order)
                                                    ₹{{ number_format($order->price, 2) }}
                                                @else
                                                    ₹{{ number_format($enrollment->course->discount_price ?: $enrollment->course->selling_price, 2) }}
                                                @endif
                                            </span>
                                        </td>
                                        <td>
                                            <span class="badge rounded-pill {{ $enrollment->status == 'active' ? 'bg-success-subtle text-success' : 'bg-danger-subtle text-danger' }} px-3">
                                                {{ ucfirst($enrollment->status) }}
                                            </span>
                                        </td>
                                        <td class="text-end pe-4">
                                            <div class="d-flex justify-content-end gap-2">
                                                <a href="{{ route('user.course.learn', $enrollment->course_id) }}" class="btn btn-theme btn-theme-sm text-white px-3" title="Start Learning">
                                                    <i class="bi bi-play-fill me-1"></i> Learn
                                                </a>
                                                
                                                <button class="btn btn-outline-secondary btn-theme-sm border-0 shadow-none px-2" type="button" onclick="toggleDetails({{ $enrollment->id }})">
                                                    <i class="bi bi-info-circle"></i>
                                                </button>

                                                @if($order && $order->payment_id)
                                                    <a href="{{ route('user.invoice', $order->payment_id) }}" class="btn btn-outline-theme btn-theme-sm border-0 shadow-none px-2" target="_blank" title="Invoice">
                                                        <i class="bi bi-file-earmark-pdf"></i>
                                                    </a>
                                                @endif

                                                <button type="button" class="btn btn-outline-danger btn-theme-sm border-0 shadow-none px-2" onclick="confirmRemoval({{ $enrollment->id }})" title="Remove">
                                                    <i class="bi bi-trash"></i>
                                                </button>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr class="collapse" id="details-{{ $enrollment->id }}">
                                        <td colspan="5" class="p-0 border-0">
                                            <div class="bg-light p-4 rounded-3 m-3 border shadow-sm">
                                                <div class="row g-4">
                                                    <div class="col-md-6">
                                                        <div class="d-flex align-items-center mb-3">
                                                            <div class="bg-primary-subtle text-primary p-2 rounded-circle me-3 d-flex align-items-center justify-content-center" style="width: 35px; height: 35px;">
                                                                <i class="bi bi-check2-circle"></i>
                                                            </div>
                                                            <h6 class="fw-bold mb-0">Quiz Performance</h6>
                                                        </div>
                                                        @php
                                                            $quizResults = Auth::user()->quizResults()->whereHas('quiz', function($q) use ($enrollment) {
                                                                $q->where('course_id', $enrollment->course_id);
                                                            })->with('quiz')->get();
                                                        @endphp
                                                        @forelse($quizResults as $result)
                                                            <div class="d-flex justify-content-between align-items-center mb-2 pb-2 border-bottom border-white">
                                                                <span class="small">{{ $result->quiz->quiz_title }}</span>
                                                                <span class="badge {{ $result->is_pass ? 'bg-success' : 'bg-danger' }} rounded-pill">
                                                                    {{ $result->score }}%
                                                                </span>
                                                            </div>
                                                        @empty
                                                            <p class="text-muted small italic">No quizzes taken yet.</p>
                                                        @endforelse
                                                    </div>
                                                    <div class="col-md-6 border-start border-white">
                                                        <div class="d-flex align-items-center mb-3">
                                                            <div class="bg-success-subtle text-success p-2 rounded-circle me-3 d-flex align-items-center justify-content-center" style="width: 35px; height: 35px;">
                                                                <i class="bi bi-check-all"></i>
                                                            </div>
                                                            <h6 class="fw-bold mb-0">Learning Progress</h6>
                                                        </div>
                                                        @php
                                                            $completedLectures = Auth::user()->progress()->where('course_id', $enrollment->course_id)
                                                                ->where('content_type', 'lecture')
                                                                ->where('is_completed', true)
                                                                ->take(3)
                                                                ->get();
                                                        @endphp
                                                        @forelse($completedLectures as $progress)
                                                            <div class="d-flex justify-content-between align-items-center mb-2">
                                                                <div class="d-flex align-items-center">
                                                                    <i class="bi bi-play-circle text-theme me-2 small"></i>
                                                                    <span class="small text-truncate" style="max-width: 150px;">{{ $progress->content()->first()->lecture_title ?? 'Lecture' }}</span>
                                                                </div>
                                                                <small class="text-muted">{{ $progress->updated_at->format('d M') }}</small>
                                                            </div>
                                                        @empty
                                                            <p class="text-muted small italic">No progress recorded yet.</p>
                                                        @endforelse
                                                    </div>
                                                </div>
                                                <div class="mt-4 pt-3 border-top border-white">
                                                    @php
                                                        $certificate = \App\Models\Certificate::where('user_id', Auth::id())->where('course_id', $enrollment->course_id)->first();
                                                    @endphp
                                                    <div class="d-flex justify-content-between align-items-center">
                                                        <span class="small text-muted">Certification Status:</span>
                                                        @if($certificate)
                                                            <a href="{{ route('user.course.certificate', $enrollment->course_id) }}" class="btn btn-sm btn-success px-4 rounded-pill">
                                                                <i class="bi bi-patch-check me-1"></i> Download Certificate
                                                            </a>
                                                        @else
                                                            <button class="btn btn-sm btn-secondary px-4 rounded-pill opacity-75" disabled>
                                                                <i class="bi bi-lock me-1"></i> Earn Certificate
                                                            </button>
                                                        @endif
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    @empty
                                    <tr>
                                        <td colspan="5" class="py-5 text-center">
                                            <div class="mb-3">
                                                <i class="bi bi-receipt text-muted opacity-25" style="font-size: 4rem;"></i>
                                            </div>
                                            <h5 class="fw-bold">No purchase history found</h5>
                                            <p class="text-muted small">You haven't enrolled in any courses yet.</p>
                                            <a href="{{ route('all.courses') }}" class="btn btn-theme mt-3 text-white px-4 pb-2">Start Learning Today</a>
                                        </td>
                                    </tr>
                                    @endforelse
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

{{-- Form for removal --}}
@foreach($courses as $enrollment)
<form action="{{ route('user.course.remove', $enrollment->id) }}" method="POST" id="remove-course-{{ $enrollment->id }}" class="d-none">
    @csrf
    @method('DELETE')
</form>
@endforeach

@endsection

@push('scripts')
<script>
    function toggleDetails(id) {
        const element = document.getElementById('details-' + id);
        if (typeof bootstrap !== 'undefined') {
            const instance = bootstrap.Collapse.getOrCreateInstance(element, { toggle: false });
            instance.toggle();
        }
    }
    function confirmRemoval(id) {
        Swal.fire({
            title: 'Are you sure?',
            text: "This will remove the course from your account. You might lose your progress!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#5b50d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Yes, remove it!'
        }).then((result) => {
            if (result.isConfirmed) {
                document.getElementById('remove-course-' + id).submit();
            }
        })
    }
</script>
@endpush
