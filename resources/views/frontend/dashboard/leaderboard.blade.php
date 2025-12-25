@extends('frontend.master')

@section('content')
@include('frontend.section.breadcrumb', ['title' => 'Leaderboard'])

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
                        <h5 class="fw-bold mb-0">Top Learners</h5>
                        <p class="text-muted small mb-0">See where you stand against other students based on quiz performance.</p>
                    </div>
                    <div class="card-body p-0">
                        <div class="table-responsive">
                            <table class="table table-hover align-middle mb-0">
                                <thead class="bg-light text-uppercase small fw-bold">
                                    <tr>
                                        <th class="ps-4 border-0">Rank</th>
                                        <th class="border-0">Student</th>
                                        <th class="text-end pe-4 border-0">Total Points</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @forelse($leaders as $index => $leader)
                                    <tr>
                                        <td class="ps-4">
                                            @if($index == 0) <span class="badge bg-warning text-dark rounded-pill px-3 py-2"><i class="bi bi-trophy-fill me-1"></i> 1st</span>
                                            @elseif($index == 1) <span class="badge bg-secondary text-white rounded-pill px-3 py-2">2nd</span>
                                            @elseif($index == 2) <span class="badge bg-danger text-white rounded-pill px-3 py-2">3rd</span>
                                            @else <span class="text-muted fw-bold ps-2">#{{ $index + 1 }}</span>
                                            @endif
                                        </td>
                                        <td>
                                            <div class="d-flex align-items-center">
                                                <div class="bg-theme-subtle text-theme p-2 rounded-circle me-3 d-flex align-items-center justify-content-center fw-bold text-uppercase" style="width: 40px; height: 40px;">
                                                    {{ substr($leader->name, 0, 1) }}
                                                </div>
                                                <h6 class="fw-bold mb-0">{{ $leader->name }}</h6>
                                            </div>
                                        </td>
                                        <td class="text-end pe-4 text-success fw-bold fs-5">
                                            {{ number_format($leader->quiz_results_sum_score ?? 0) }}
                                        </td>
                                    </tr>
                                    @empty
                                    <tr>
                                        <td colspan="3" class="py-5 text-center">
                                            <div class="mb-3">
                                                <i class="bi bi-clipboard2-data text-muted opacity-25" style="font-size: 4rem;"></i>
                                            </div>
                                            <h5 class="fw-bold">No data available</h5>
                                            <p class="text-muted small">Quizzes taken by students will appear here.</p>
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
@endsection
