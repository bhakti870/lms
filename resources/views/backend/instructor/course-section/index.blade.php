@extends('backend.instructor.master')

@section('content')
    <div class="page-content">
        <!--breadcrumb-->
        <div class="page-breadcrumb d-none d-sm-flex align-items-center mb-3">
            <div class="breadcrumb-title pe-3">Course</div>
            <div class="ps-3">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb mb-0 p-0">
                        <li class="breadcrumb-item"><a href="javascript:;"><i class="bx bx-home-alt"></i></a>
                        </li>
                        <li class="breadcrumb-item active" aria-current="page">Sections</li>
                    </ol>
                </nav>
            </div>

        </div>
        <!--end breadcrumb-->
        <div class="row">
            <div class="col-12 col-lg-12">
                <div style="display: flex; align-items:center; justify-content:space-between">
                    <h6 class="mb-0 text-uppercase">All content sections</h6>
                    <a href="{{ route('instructor.course.index') }}" class="btn btn-danger px-5">Back</a>

                </div>

                <hr />
                <div class="card radius-10">
                    <div class="card-body">
                        <div class="d-flex align-items-center">
                            <img src="{{ asset($course->course_image) }}" class="rounded-circle p-1 border" width="90"
                                height="90" alt="...">
                            <div class="flex-grow-1 ms-3">
                                <h6 class="mt-0">{{ $course->course_name }}</h6>
                                <p class="mb-0">{{ $course->course_title }}
                                </p>
                            </div>
                            <div>
                                <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#myModal">Add
                                    Section</button>
                            </div>
                        </div>
                    </div>
                </div>

                @foreach ($course_wise_lecture as $data)
                    <div class="card col-md-12 radius-10">
                        <div class="card-body">

                            <div class="d-flex align-items-center justify-content-between">
                                <div class="d-flex align-items-center">
                                    <!-- Icon -->
                                    <svg style="cursor: pointer" data-bs-toggle="collapse" data-bs-target="#demo{{$data->id}}" xmlns="http://www.w3.org/2000/svg" width="25" height="25"
                                        fill="currentColor" class="bi bi-plus-circle" viewBox="0 0 16 16">
                                        <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14m0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16" />
                                        <path
                                            d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4" />
                                    </svg>
                                    <!-- Title -->
                                    <div class="ms-3">
                                        <h6 class="mt-0 mb-0">{{ $data->section_title }} 
                                            <a href="javascript:void(0)" class="text-primary ms-2" data-bs-toggle="modal" data-bs-target="#editSectionModal{{ $data->id }}">
                                                <i class='bx bx-edit-alt fs-6'></i>
                                            </a>
                                        </h6>
                                    </div>
                                </div>
                                <!-- Button -->
                                <div style="display: flex; align-items: center; gap: 10px">
                                    <button class="btn btn-primary" data-bs-toggle="modal"
                                        data-bs-target="#course-{{ $data->id }}">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-square" viewBox="0 0 16 16">
                                            <path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2z"/>
                                            <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4"/>
                                          </svg>

                                    </button>

                                    <div>

                                        <a href="javascript:void(0)" class="btn btn-danger delete-section"
                                            data-id="{{ $data->id }}" style="margin-left: 10px">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x" viewBox="0 0 16 16">
                                                <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708"/>
                                              </svg>
                                        </a>

                                        <form id="delete-form" method="POST" style="display: none;">
                                            @csrf
                                            @method('DELETE')
                                        </form>

                                    </div>


                                </div>
                            </div>

                            <hr>

                            <div class="mt-3 collapse show" id="demo{{$data->id}}">
                                <!-- Lectures List -->
                                <h6 class="text-primary mb-2">Lectures</h6>
                                @foreach ($data->lectures as $lecture)
                                    <div class="d-flex align-items-center justify-content-between mb-2 p-2 border rounded">
                                        <div class="d-flex align-items-center">
                                            <i class='bx bx-play-circle fs-4 me-2'></i>
                                            <p class="mb-0">{{ $lecture->lecture_title }} 
                                                @if($lecture->is_live)
                                                    <span class="badge bg-danger ms-2" style="font-size: 10px;">LIVE</span>
                                                @endif
                                            </p>
                                        </div>
                                        <div>
                                            <a class="btn btn-sm btn-dark" data-bs-toggle="modal" data-bs-target="#course-edit-{{ $lecture->id }}">
                                                <i class='bx bx-edit'></i>
                                            </a>
                                            <a href="javascript:void(0)" class="btn btn-sm btn-danger delete-lecture" data-id="{{ $lecture->id }}">
                                                <i class='bx bx-trash'></i>
                                            </a>
                                        </div>
                                    </div>
                                    @include('backend.instructor.course-section.modal.course-edit-modal')
                                @endforeach

                                <!-- Quizzes List -->
                                <h6 class="text-success mt-4 mb-2">Quizzes</h6>
                                @foreach ($data->quizzes as $quiz)
                                    <div class="d-flex align-items-center justify-content-between mb-2 p-2 border rounded bg-light">
                                        <div class="d-flex align-items-center">
                                            <i class='bx bx-help-circle fs-4 me-2 text-success'></i>
                                            <p class="mb-0"><strong>{{ $quiz->quiz_title }}</strong> ({{ $quiz->questions->count() }} Qs)</p>
                                        </div>
                                        <div>
                                            <a href="{{ route('instructor.quiz.edit', $quiz->id) }}" class="btn btn-sm btn-success">
                                                <i class='bx bx-list-plus'></i> Manage Questions
                                            </a>
                                            <a href="javascript:void(0)" class="btn btn-sm btn-danger delete-quiz" data-id="{{ $quiz->id }}">
                                                <i class='bx bx-trash'></i>
                                            </a>
                                        </div>
                                    </div>
                                @endforeach
                                @if($course->can_have_quizzes)
                                <button class="btn btn-sm btn-outline-success mb-3" data-bs-toggle="modal" data-bs-target="#addQuizModal{{ $data->id }}">
                                    <i class='bx bx-plus'></i> Add Quiz
                                </button>
                                @endif

                                <!-- Materials List -->
                                <h6 class="text-info mt-3 mb-2">Resources/Materials</h6>
                                @foreach ($data->materials as $material)
                                    <div class="d-flex align-items-center justify-content-between mb-2 p-2 border rounded">
                                        <div class="d-flex align-items-center">
                                            <i class='bx bx-file fs-4 me-2 text-info'></i>
                                            <p class="mb-0">{{ $material->material_title }} <small class="badge bg-info">{{ strtoupper($material->type) }}</small></p>
                                        </div>
                                        <div>
                                            <a href="javascript:void(0)" class="btn btn-sm btn-info" data-bs-toggle="modal" data-bs-target="#editMaterialModal{{ $material->id }}">
                                                <i class='bx bx-edit'></i>
                                            </a>
                                            <a href="javascript:void(0)" class="btn btn-sm btn-danger delete-material" data-id="{{ $material->id }}">
                                                <i class='bx bx-trash'></i>
                                            </a>
                                        </div>
                                    </div>
                                    @include('backend.instructor.course-section.modal.material-edit-modal')
                                @endforeach
                                <button class="btn btn-sm btn-outline-info" data-bs-toggle="modal" data-bs-target="#addMaterialModal{{ $data->id }}">
                                    <i class='bx bx-plus'></i> Add Material
                                </button>
                            </div>

                        </div>
                    </div>

                    <!-- Add Course Modal -->
                    @include('backend.instructor.course-section.modal.course-create-modal')

                    <!-- Add Quiz Modal -->
                    <div class="modal fade" id="addQuizModal{{ $data->id }}" tabindex="-1" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title">Add New Quiz to {{ $data->section_title }}</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <form action="{{ route('instructor.quiz.store') }}" method="POST">
                                    @csrf
                                    <input type="hidden" name="course_id" value="{{ $course->id }}">
                                    <input type="hidden" name="section_id" value="{{ $data->id }}">
                                    <div class="modal-body">
                                        <div class="mb-3">
                                            <label class="form-label">Quiz Title</label>
                                            <input type="text" name="quiz_title" class="form-control" required>
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label">Description (Optional)</label>
                                            <textarea name="description" class="form-control" rows="2"></textarea>
                                        </div>
                                        <div class="row">
                                            <div class="col-6 mb-3">
                                                <label class="form-label">Duration (Minutes)</label>
                                                <input type="number" name="duration_minutes" class="form-control" value="0">
                                                <small class="text-muted">0 for no limit</small>
                                            </div>
                                            <div class="col-6 mb-3">
                                                <label class="form-label">Pass Mark (%)</label>
                                                <input type="number" name="pass_mark" class="form-control" value="50">
                                            </div>
                                        </div>
                                        <div class="mb-3 form-check">
                                            <input type="checkbox" class="form-check-input negative-toggle" id="negCheck{{ $data->id }}" name="negative_marking_status" value="1">
                                            <label class="form-check-label" for="negCheck{{ $data->id }}">Enable Negative Marking</label>
                                        </div>
                                        <div class="mb-3 negative-value-div" style="display: none;">
                                            <label class="form-label">Negative Mark Value</label>
                                            <input type="number" step="0.01" min="0" name="negative_marks" class="form-control" placeholder="e.g. 0.25 (for 0.25 mark deduction per wrong answer)">
                                            <small class="text-muted">Assumes 1 mark per correct answer.</small>
                                        </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                        <button type="submit" class="btn btn-success">Save Quiz</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>

                    <!-- Add Material Modal -->
                    <div class="modal fade" id="addMaterialModal{{ $data->id }}" tabindex="-1" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title">Add Resource Material to {{ $data->section_title }}</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <form action="{{ route('instructor.instructor.material.store') }}" method="POST" enctype="multipart/form-data">
                                    @csrf
                                    <input type="hidden" name="course_id" value="{{ $course->id }}">
                                    <input type="hidden" name="section_id" value="{{ $data->id }}">
                                    <div class="modal-body">
                                        <div class="mb-3">
                                            <label class="form-label">Material Title</label>
                                            <input type="text" name="material_title" class="form-control" required>
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label">Type</label>
                                            <select name="type" class="form-select material-type-select" required>
                                                <option value="pdf">PDF Document</option>
                                                <option value="link">External Link</option>
                                                <option value="file">Other File</option>
                                            </select>
                                        </div>
                                        <div class="mb-3 file-input-group">
                                            <label class="form-label">File</label>
                                            <input type="file" name="file" class="form-control">
                                        </div>
                                        <div class="mb-3 link-input-group" style="display:none;">
                                            <label class="form-label">Link URL</label>
                                            <input type="url" name="external_url" class="form-control" placeholder="https://example.com">
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                        <button type="submit" class="btn btn-info">Save Material</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                @endforeach


            </div>
        </div>



        <!-- course section Modal -->
        @include('backend.instructor.course-section.modal.create-section-modal')
        @include('backend.instructor.course-section.modal.edit-section-modal')





    </div>
@endsection

@push('styles')
<style>
    /* Modal improvements */
    .modal-dialog-scrollable .modal-body {
        max-height: calc(90vh - 200px);
        overflow-y: auto;
    }
    
    .modal-content {
        border-radius: 10px;
    }
    
    .modal-header {
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        color: white;
        border-top-left-radius: 10px;
        border-top-right-radius: 10px;
    }
    
    .modal-header .btn-close {
        filter: brightness(0) invert(1);
    }
    
    .modal-footer {
        background-color: #f8f9fa;
        border-bottom-left-radius: 10px;
        border-bottom-right-radius: 10px;
    }
    
    /* Form improvements */
    .form-label {
        font-weight: 600;
        color: #495057;
        margin-bottom: 0.5rem;
    }
    
    .form-control:focus,
    .form-select:focus {
        border-color: #667eea;
        box-shadow: 0 0 0 0.2rem rgba(102, 126, 234, 0.25);
    }
    
    /* Button spacing fix */
    .btn + .btn {
        margin-left: 0.5rem;
    }
    
    /* Iframe responsive */
    iframe {
        border-radius: 8px;
    }
    
    /* Card improvements */
    .card {
        box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        transition: box-shadow 0.3s ease;
    }
    
    .card:hover {
        box-shadow: 0 4px 8px rgba(0,0,0,0.15);
    }
</style>
@endpush

@push('scripts')
    <script src="{{ asset('customjs/instructor/lecture.js') }}"></script>

    <script>
        $(document).on('click', '.delete-lecture', function(e) {
            e.preventDefault();

            let Id = $(this).data('id');
            let deleteUrl = "{{ route('instructor.lecture.destroy', ':id') }}".replace(':id', Id);

            Swal.fire({
                title: 'Are you sure?',
                text: "You won't be able to revert this!",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes, delete it!'
            }).then((result) => {
                if (result.isConfirmed) {
                    $('#delete-form').attr('action', deleteUrl).submit();
                }
            });
        });

        $(document).on('click', '.delete-section', function(e) {
            e.preventDefault();

            let Id = $(this).data('id');
            let deleteUrl = "{{ route('instructor.course-section.destroy', ':id') }}".replace(':id', Id);

            Swal.fire({
                title: 'Are you sure?',
                text: "You won't be able to revert this!",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes, delete it!'
            }).then((result) => {
                if (result.isConfirmed) {
                    $('#delete-form').attr('action', deleteUrl).submit();
                }
            });
        });

        // Unified script for Lecture Modals (Create & Edit)
        function extractYouTubeVideoID(url) {
            if (!url) return null;
            let regex = /(?:https?:\/\/)?(?:www\.)?(?:youtube\.com\/(?:[^\/\n\s]+\/\S+\/|(?:v|e(?:mbed)?)\/|.*[?&]v=)|youtu\.be\/)([^"&?\/\s]{11})/;
            let match = url.match(regex);
            return match ? match[1] : null;
        }

        function updateVideoPreview(input) {
            let $input = $(input);
            let $modal = $input.closest('.modal');
            let $preview = $modal.find('.videoPreview, #videoPreview');
            let url = $input.val();
            let videoId = extractYouTubeVideoID(url);

            if (videoId) {
                $preview.attr('src', `https://www.youtube.com/embed/${videoId}`).show();
            } else {
                $preview.attr('src', '').hide();
            }
        }

        // Use delegation to handle all modals
        $(document).on('input', 'input[name="url"]', function() {
            updateVideoPreview(this);
        });

        $(document).on('change', '.live-class-toggle, .live-class-toggle-edit', function() {
            let $modal = $(this).closest('.modal');
            let $liveFields = $modal.find('.live-class-fields, .live-class-fields-edit');
            if (this.checked) {
                $liveFields.slideDown();
            } else {
                $liveFields.slideUp();
            }
        });

        // Initialize previews when modal opens
        $(document).on('shown.bs.modal', '.modal', function() {
            let $urlInput = $(this).find('input[name="url"]');
            if ($urlInput.length && $urlInput.val()) {
                updateVideoPreview($urlInput[0]);
            }
        });

        $(document).on('change', '.material-type-select, .material-type-select-edit', function() {
            let modal = $(this).closest('.modal');
            if ($(this).val() === 'link') {
                modal.find('.file-input-group, .file-input-group-edit').hide();
                modal.find('.link-input-group, .link-input-group-edit').show();
            } else {
                modal.find('.file-input-group, .file-input-group-edit').show();
                modal.find('.link-input-group, .link-input-group-edit').hide();
            }
        });

        $(document).on('click', '.delete-quiz', function(e) {
            e.preventDefault();
            let id = $(this).data('id');
            let deleteUrl = "{{ route('instructor.quiz.destroy', ':id') }}".replace(':id', id);

            Swal.fire({
                title: 'Delete this quiz?',
                text: "All progress and questions for this quiz will be lost.",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes, delete it!'
            }).then((result) => {
                if (result.isConfirmed) {
                    $('#delete-form').attr('action', deleteUrl).submit();
                }
            });
        });

        $(document).on('click', '.delete-material', function(e) {
            e.preventDefault();
            let id = $(this).data('id');
            let deleteUrl = "{{ route('instructor.instructor.material.destroy', ':id') }}".replace(':id', id);

            Swal.fire({
                title: 'Delete this material?',
                text: "This file/link will be removed from the course.",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes, delete it!'
            }).then((result) => {
                if (result.isConfirmed) {
                    $('#delete-form').attr('action', deleteUrl).submit();
                }
            });
        });

        // Negative Marking Toggle
        $(document).on('change', '.negative-toggle', function() {
            let $container = $(this).closest('.modal-body, form'); 
            let $target = $container.find('.negative-value-div');
            if(this.checked) {
                $target.slideDown();
            } else {
                $target.slideUp();
            }
        });
    </script>
@endpush
