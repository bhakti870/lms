@extends('backend.instructor.master')
@section('content')
<div class="page-content">
    <div class="mb-4">
        <a href="{{ route('instructor.question.index') }}" class="btn btn-secondary btn-sm"><i class="bx bx-arrow-back"></i> Back to List</a>
    </div>

    <div class="row">
        <div class="col-lg-8">
            <div class="card radius-10">
                <div class="card-body">
                    <h5 class="card-title text-primary mb-4">Conversation Thread</h5>
                    
                    <!-- Main Question -->
                    <div class="d-flex gap-3 mb-4 border-bottom pb-4">
                        <img src="{{ !empty($question->user->photo) ? url($question->user->photo) : url('upload/no_image.jpg') }}" class="rounded-circle" width="50" height="50" alt="">
                        <div class="flex-grow-1">
                            <div class="d-flex justify-content-between">
                                <h6 class="mb-1 fw-bold">{{ $question->user->name }}</h6>
                                <small class="text-muted">{{ $question->created_at->format('d M Y h:i A') }}</small>
                            </div>
                            <p class="mb-0 text-dark">{{ $question->question }}</p>
                            <span class="badge bg-light text-dark mt-2 border">Course: {{ $question->course->course_name }}</span>
                        </div>
                    </div>

                    <!-- Replies -->
                    <div class="replies-list ms-5">
                        <h6 class="mb-3">Replies ({{ $question->replies->count() }})</h6>
                        @foreach($question->replies as $reply)
                        <div class="d-flex gap-3 mb-3 p-3 rounded-3 {{ $reply->is_instructor_reply ? 'bg-light-primary border border-primary' : 'bg-light border' }}">
                            <img src="{{ !empty($reply->user->photo) ? url($reply->user->photo) : url('upload/no_image.jpg') }}" class="rounded-circle" width="40" height="40" alt="">
                            <div class="flex-grow-1">
                                <div class="d-flex justify-content-between">
                                    <h6 class="mb-1 fw-bold">
                                        {{ $reply->user->name }}
                                        @if($reply->is_instructor_reply) <span class="badge bg-primary ms-2">You</span> @endif
                                    </h6>
                                    <small class="text-muted">{{ $reply->created_at->diffForHumans() }}</small>
                                </div>
                                <p class="mb-0">{{ $reply->question }}</p>
                            </div>
                        </div>
                        @endforeach
                    </div>

                    <!-- Reply Form -->
                    <div class="mt-5">
                        <h6 class="mb-3">Post a Reply</h6>
                        <form action="{{ route('instructor.question.reply', $question->id) }}" method="POST">
                            @csrf
                            <div class="mb-3">
                                <textarea name="reply" class="form-control" rows="4" placeholder="Write your answer here..."></textarea>
                            </div>
                            <button type="submit" class="btn btn-primary px-4">Post Reply <i class="bx bx-send ms-1"></i></button>
                        </form>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
@endsection
