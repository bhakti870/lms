@extends('frontend.master')

@section('content')
@include('frontend.section.breadcrumb', ['title' => 'My Enrolled Courses'])

<section class="dashboard-area pt-60px pb-120px">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="dashboard-heading mb-5">
                    <h3 class="fs-22 font-weight-semi-bold">Purchase History & Course Access</h3>
                </div>
                <div class="table-responsive">
                    <table class="table generic-table">
                        <thead>
                            <tr>
                                <th scope="col">Course</th>
                                <th scope="col">Date</th>
                                <th scope="col">Price</th>
                                <th scope="col">Status</th>
                                <th scope="col" class="text-right">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($courses as $enrollment)
                            <tr class="mb-2">
                                <td>
                                    <div class="media media-card align-items-center">
                                        <a href="{{ route('course-details', $enrollment->course->course_name_slug) }}" class="media-img" style="width: 80px;">
                                            <img src="{{ asset($enrollment->course->course_image) }}" alt="Course thumbnail" class="rounded">
                                        </a>
                                        <div class="media-body ml-3">
                                            <h5 class="fs-15 font-weight-semi-bold"><a href="{{ route('course-details', $enrollment->course->course_name_slug) }}">{{ $enrollment->course->course_name }}</a></h5>
                                            <p class="fs-13 text-gray">{{ $enrollment->course->user->name }}</p>
                                        </div>
                                    </div>
                                </td>
                                <td>{{ $enrollment->created_at->format('d M, Y') }}</td>
                                <td>${{ number_format($enrollment->amount, 2) }}</td>
                                <td><span class="badge {{ $enrollment->status == 'active' ? 'badge-success' : 'badge-danger' }} text-white px-2 py-1">{{ ucfirst($enrollment->status) }}</span></td>
                                <td class="text-right">
                                    <div class="d-flex justify-content-end align-items-center">
                                        <a href="{{ route('user.course.learn', $enrollment->course_id) }}" class="btn theme-btn theme-btn-sm mr-2"><i class="la la-play-circle mr-1"></i>Start Learning</a>
                                        <button class="btn theme-btn theme-btn-sm theme-btn-transparent mr-2" data-toggle="collapse" data-target="#details-{{ $enrollment->id }}"><i class="la la-info-circle"></i> Details</button>
                                        
                                        @php
                                            $order = \App\Models\Order::where('user_id', Auth::id())->where('course_id', $enrollment->course_id)->latest()->first();
                                        @endphp
                                        @if($order && $order->payment_id)
                                            <a href="{{ route('user.invoice', $order->payment_id) }}" class="btn theme-btn theme-btn-sm theme-btn-transparent" target="_blank" title="Invoice"><i class="la la-file-invoice"></i></a>
                                        @endif
                                    </div>
                                </td>
                            </tr>
                            <tr id="details-{{ $enrollment->id }}" class="collapse">
                                <td colspan="5" class="p-0 border-0">
                                    <div class="m-3 p-4 bg-light rounded shadow-sm border">
                                        <div class="row">
                                            <div class="col-md-6 border-right">
                                                <h6 class="font-weight-bold mb-3 text-primary"><i class="la la-check-circle mr-1"></i> Quiz Performance</h6>
                                                @php
                                                    $quizResults = Auth::user()->quizResults()->whereHas('quiz', function($q) use ($enrollment) {
                                                        $q->where('course_id', $enrollment->course_id);
                                                    })->with('quiz')->get();
                                                @endphp
                                                @if($quizResults->count() > 0)
                                                    <div class="list-group list-group-flush bg-transparent">
                                                        @foreach($quizResults as $result)
                                                            <div class="list-group-item d-flex justify-content-between align-items-center bg-transparent px-0 border-0">
                                                                <span class="fs-14 text-dark">{{ $result->quiz->quiz_title }}</span>
                                                                <span class="badge {{ $result->is_pass ? 'badge-success' : 'badge-danger' }} text-white px-2 py-1">
                                                                    {{ $result->correct_answers }}/{{ $result->total_questions }} ({{ $result->score }}%)
                                                                </span>
                                                            </div>
                                                        @endforeach
                                                    </div>
                                                @else
                                                    <p class="text-muted fs-14 italic">You haven't taken any quizzes for this course yet.</p>
                                                @endif
                                            </div>
                                            <div class="col-md-6 pl-md-4">
                                                <h6 class="font-weight-bold mb-3 text-success"><i class="la la-play-circle mr-1"></i> Learning Progress</h6>
                                                @php
                                                    $completedLectures = Auth::user()->progress()->where('course_id', $enrollment->course_id)
                                                        ->where('content_type', 'lecture')
                                                        ->where('is_completed', true)
                                                        ->get();
                                                @endphp
                                                @if($completedLectures->count() > 0)
                                                    <div class="list-group list-group-flush bg-transparent">
                                                        @foreach($completedLectures as $progress)
                                                            <div class="list-group-item d-flex justify-content-between align-items-center bg-transparent px-0 border-0">
                                                                <div class="d-flex align-items-center">
                                                                    <i class="la la-check-circle text-success mr-2"></i>
                                                                    <span class="fs-14 text-dark">{{ $progress->content()->first() ? $progress->content()->first()->lecture_title : 'Lecture' }}</span>
                                                                </div>
                                                                <span class="fs-12 text-muted">{{ $progress->completed_at ? \Carbon\Carbon::parse($progress->completed_at)->format('d M') : '' }}</span>
                                                            </div>
                                                        @endforeach
                                                    </div>
                                                @else
                                                    <p class="text-muted fs-14 italic">No lectures completed in this course.</p>
                                                @endif
                                            </div>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</section>
@endsection
