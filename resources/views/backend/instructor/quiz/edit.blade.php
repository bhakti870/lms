@extends('backend.instructor.master')

@section('content')
<div class="page-content">
    <div class="page-breadcrumb d-none d-sm-flex align-items-center mb-3">
        <div class="breadcrumb-title pe-3">Quiz</div>
        <div class="ps-3">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb mb-0 p-0">
                    <li class="breadcrumb-item"><a href="javascript:;"><i class="bx bx-home-alt"></i></a></li>
                    <li class="breadcrumb-item active" aria-current="page">Manage Questions</li>
                </ol>
            </nav>
        </div>
        <div class="ms-auto">
            <a href="{{ route('instructor.course-section.show', $quiz->course_id) }}" class="btn btn-danger">Back to Sections</a>
        </div>
    </div>

    <div class="row">
        <div class="col-md-4">
            <div class="card border-top border-4 border-primary">
                <div class="card-body">
                    <h5 class="card-title text-primary">Edit Quiz Details</h5>
                    <hr>
                    <form action="{{ route('instructor.quiz.update', $quiz->id) }}" method="POST">
                        @csrf
                        <div class="mb-3">
                            <label class="form-label">Quiz Title</label>
                            <input type="text" name="quiz_title" class="form-control" value="{{ $quiz->quiz_title }}" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Description</label>
                            <textarea name="description" class="form-control" rows="3">{{ $quiz->description }}</textarea>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Duration (Minutes)</label>
                            <input type="number" name="duration_minutes" class="form-control" value="{{ $quiz->duration_minutes }}">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Pass Mark (%)</label>
                            <input type="number" name="pass_mark" class="form-control" value="{{ $quiz->pass_mark }}">
                        </div>
                        <div class="mb-3 form-check">
                            <input type="checkbox" class="form-check-input negative-toggle" id="negCheckMsg" name="negative_marking_status" value="1" {{ $quiz->negative_marking_status ? 'checked' : '' }}>
                            <label class="form-check-label" for="negCheckMsg">Enable Negative Marking</label>
                        </div>
                        <div class="mb-3 negative-value-div" style="{{ $quiz->negative_marking_status ? '' : 'display: none;' }}">
                            <label class="form-label">Negative Mark Value</label>
                            <input type="number" step="0.01" min="0" name="negative_marks" class="form-control" value="{{ $quiz->negative_marks }}">
                            <small class="text-muted">Assumes 1 mark per correct answer.</small>
                        </div>
                        <button type="submit" class="btn btn-primary w-100">Update Quiz</button>
                    </form>
                </div>
            </div>
        </div>

        <div class="col-md-8">
            <div class="card border-top border-4 border-success">
                <div class="card-body">
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <h5 class="card-title text-success">Questions ({{ $quiz->questions->count() }})</h5>
                        <button class="btn btn-success" data-bs-toggle="modal" data-bs-target="#addQuestionModal">
                            <i class='bx bx-plus'></i> Add New Question
                        </button>
                    </div>
                    <hr>

                    @foreach($quiz->questions as $index => $question)
                        <div class="card mb-3 border">
                            <div class="card-body">
                                <div class="d-flex justify-content-between">
                                    <h6 class="mb-3">Q{{ $index + 1 }}: {{ $question->question_text }}</h6>
                                    <div>
                                        <button class="btn btn-sm btn-outline-primary" data-bs-toggle="modal" data-bs-target="#editQuestionModal{{ $question->id }}">
                                            <i class='bx bx-edit'></i>
                                        </button>
                                        <button class="btn btn-sm btn-outline-danger delete-question" data-id="{{ $question->id }}">
                                            <i class='bx bx-trash'></i>
                                        </button>
                                    </div>
                                </div>
                                <div class="row ms-2">
                                    <div class="col-md-6 mb-2 {{ strtolower($question->correct_answer) == 'a' ? 'text-success fw-bold' : '' }}">A) {{ $question->option_a }}</div>
                                    <div class="col-md-6 mb-2 {{ strtolower($question->correct_answer) == 'b' ? 'text-success fw-bold' : '' }}">B) {{ $question->option_b }}</div>
                                    <div class="col-md-6 mb-2 {{ strtolower($question->correct_answer) == 'c' ? 'text-success fw-bold' : '' }}">C) {{ $question->option_c }}</div>
                                    <div class="col-md-6 mb-2 {{ strtolower($question->correct_answer) == 'd' ? 'text-success fw-bold' : '' }}">D) {{ $question->option_d }}</div>
                                </div>
                                @if($question->explanation)
                                    <div class="mt-2 p-2 bg-light border-start border-4 border-info">
                                        <small><strong>Explanation:</strong> {{ $question->explanation }}</small>
                                    </div>
                                @endif
                            </div>
                        </div>

                        <!-- Edit Question Modal -->
                        <div class="modal fade" id="editQuestionModal{{ $question->id }}" tabindex="-1" aria-hidden="true">
                            <div class="modal-dialog modal-lg modal-dialog-centered">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title">Edit Question</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <form action="{{ route('instructor.quiz.question.update', $question->id) }}" method="POST">
                                        @csrf
                                        <div class="modal-body">
                                            <div class="mb-3">
                                                <label class="form-label">Question Text</label>
                                                <textarea name="question_text" class="form-control" rows="3" required>{{ $question->question_text }}</textarea>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-6 mb-3">
                                                    <label class="form-label">Option A</label>
                                                    <input type="text" name="option_a" class="form-control" value="{{ $question->option_a }}" required>
                                                </div>
                                                <div class="col-md-6 mb-3">
                                                    <label class="form-label">Option B</label>
                                                    <input type="text" name="option_b" class="form-control" value="{{ $question->option_b }}" required>
                                                </div>
                                                <div class="col-md-6 mb-3">
                                                    <label class="form-label">Option C</label>
                                                    <input type="text" name="option_c" class="form-control" value="{{ $question->option_c }}" required>
                                                </div>
                                                <div class="col-md-6 mb-3">
                                                    <label class="form-label">Option D</label>
                                                    <input type="text" name="option_d" class="form-control" value="{{ $question->option_d }}" required>
                                                </div>
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label text-success">Correct Answer</label>
                                                <select name="correct_answer" class="form-select border-success" required>
                                                    <option value="a" {{ strtolower($question->correct_answer) == 'a' ? 'selected' : '' }}>Option A</option>
                                                    <option value="b" {{ strtolower($question->correct_answer) == 'b' ? 'selected' : '' }}>Option B</option>
                                                    <option value="c" {{ strtolower($question->correct_answer) == 'c' ? 'selected' : '' }}>Option C</option>
                                                    <option value="d" {{ strtolower($question->correct_answer) == 'd' ? 'selected' : '' }}>Option D</option>
                                                </select>
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">Explanation</label>
                                                <textarea name="explanation" class="form-control" rows="2">{{ $question->explanation }}</textarea>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                            <button type="submit" class="btn btn-primary">Update Question</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    @endforeach
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Add Question Modal -->
<div class="modal fade" id="addQuestionModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Add New Question</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="{{ route('instructor.quiz.question.store') }}" method="POST">
                @csrf
                <input type="hidden" name="quiz_id" value="{{ $quiz->id }}">
                <div class="modal-body">
                    <div class="mb-3">
                        <label class="form-label">Question Text</label>
                        <textarea name="question_text" class="form-control" rows="3" required placeholder="Enter the question here..."></textarea>
                    </div>
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label class="form-label">Option A</label>
                            <input type="text" name="option_a" class="form-control" required>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label class="form-label">Option B</label>
                            <input type="text" name="option_b" class="form-control" required>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label class="form-label">Option C</label>
                            <input type="text" name="option_c" class="form-control" required>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label class="form-label">Option D</label>
                            <input type="text" name="option_d" class="form-control" required>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label class="form-label text-success font-weight-bold">Correct Answer</label>
                        <select name="correct_answer" class="form-select border-success" required>
                            <option value="">Select Correct Option</option>
                            <option value="a">Option A</option>
                            <option value="b">Option B</option>
                            <option value="c">Option C</option>
                            <option value="d">Option D</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Explanation</label>
                        <textarea name="explanation" class="form-control" rows="2" placeholder="Explain why this answer is correct..."></textarea>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-success">Save Question</button>
                </div>
            </form>
        </div>
    </div>
</div>

<form id="delete-question-form" method="POST" style="display: none;">
    @csrf
    @method('DELETE')
</form>

@endsection

@push('scripts')
<script>
    $(document).on('change', '.negative-toggle', function() {
        let $container = $(this).closest('.card-body'); 
        let $target = $container.find('.negative-value-div');
        if(this.checked) {
            $target.slideDown();
        } else {
            $target.slideUp();
        }
    });

    $(document).on('click', '.delete-question', function(e) {
        e.preventDefault();
        let id = $(this).data('id');
        let deleteUrl = "{{ route('instructor.quiz.question.destroy', ':id') }}".replace(':id', id);

        Swal.fire({
            title: 'Delete this question?',
            text: "This action cannot be undone.",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Yes, delete it!'
        }).then((result) => {
            if (result.isConfirmed) {
                $('#delete-question-form').attr('action', deleteUrl).submit();
            }
        });
    });
</script>
@endpush
