@extends('backend.instructor.master')
@section('content')
<div class="page-content">
    <div class="breadcrumb-group d-flex justify-content-between align-items-center mb-4">
        <div>
            <h4 class="mb-0 text-uppercase">Course Q&A Management</h4>
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb m-0">
                    <li class="breadcrumb-item"><a href="{{ route('instructor.dashboard') }}">Dashboard</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Questions</li>
                </ol>
            </nav>
        </div>
    </div>

    <div class="card radius-10">
        <div class="card-body">
            <div class="table-responsive">
                <table id="example" class="table table-striped table-bordered">
                    <thead>
                        <tr>
                            <th>SL</th>
                            <th>Student</th>
                            <th>Course</th>
                            <th>Question</th>
                            <th>Date</th>
                            <th>Replies</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach($questions as $key => $item)
                        <tr>
                            <td>{{ $key + 1 }}</td>
                            <td>
                                <div class="d-flex align-items-center">
                                    <img src="{{ !empty($item->user->photo) ? url($item->user->photo) : url('upload/no_image.jpg') }}" class="rounded-circle" width="40" height="40" alt="">
                                    <div class="ms-2">
                                        <h6 class="mb-0 font-14">{{ $item->user->name }}</h6>
                                        <p class="mb-0 text-secondary font-12">{{ $item->user->email }}</p>
                                    </div>
                                </div>
                            </td>
                            <td>{{ $item->course->course_name }}</td>
                            <td>
                                <div class="text-truncate" style="max-width: 250px;" title="{{ $item->question }}">
                                    {{ $item->question }}
                                </div>
                            </td>
                            <td>{{ $item->created_at->format('d M Y') }}</td>
                            <td><span class="badge bg-secondary">{{ $item->replies->count() }}</span></td>
                            <td>
                                <a href="{{ route('instructor.question.show', $item->id) }}" class="btn btn-primary btn-sm" title="View & Reply"><i class="bx bx-show"></i></a>
                            </td>
                        </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
@endsection
