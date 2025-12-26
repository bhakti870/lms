@extends('frontend.master')

@section('content')
<style>
    :root {
        --sidebar-width: 350px;
        --header-height: 70px; /* Adjust based on your actual header */
    }
    
    body {
        overflow-x: hidden; /* Prevent horizontal scroll */
        background-color: #f8f9fa;
    }
    
    .course-player-wrapper {
        display: flex;
        min-height: calc(100vh - var(--header-height));
        position: relative;
    }

    /* --- SIDEBAR --- */
    .course-sidebar {
        width: var(--sidebar-width);
        background: #fff;
        border-right: 1px solid #dee2e6;
        display: flex;
        flex-direction: column;
        height: calc(100vh - var(--header-height));
        position: sticky;
        top: var(--header-height);
        overflow-y: auto;
        z-index: 100;
        transition: transform 0.3s ease;
    }

    .sidebar-header {
        padding: 20px;
        background: var(--theme-color, #5b50d6);
        color: white;
    }

    /* Accordion Customization */
    .course-accordion .accordion-button {
        background: transparent;
        color: #333;
        font-weight: 600;
        box-shadow: none;
        padding: 15px 20px;
        border-bottom: 1px solid rgba(0,0,0,0.05);
    }

    .course-accordion .accordion-button:not(.collapsed) {
        background: rgba(91, 80, 214, 0.05);
        color: var(--theme-color, #5b50d6);
    }
    
    .course-accordion .accordion-body {
        padding: 0;
    }

    /* Lesson Items */
    .lesson-item {
        padding: 12px 20px 12px 35px;
        border-bottom: 1px solid #f1f1f1;
        cursor: pointer;
        transition: all 0.2s;
        display: flex;
        align-items: center;
        gap: 10px;
        color: #555;
        font-size: 0.95rem;
    }

    .lesson-item:hover {
        background-color: #f8f9fa;
        color: var(--theme-color, #5b50d6);
    }

    .lesson-item.active {
        background-color: #f0f2ff;
        color: var(--theme-color, #5b50d6);
        border-left: 4px solid var(--theme-color, #5b50d6);
        padding-left: 31px; /* Compensate for border */
        font-weight: 500;
    }

    .lesson-item.locked {
        opacity: 0.6;
        cursor: not-allowed;
    }

    /* --- MAIN CONTENT --- */
    .course-content-area {
        flex: 1;
        padding: 30px;
        overflow-x: hidden;
    }

    .video-container {
        position: relative;
        padding-bottom: 56.25%; /* 16:9 */
        height: 0;
        background: #000;
        border-radius: 12px;
        overflow: hidden;
        margin-bottom: 25px;
        box-shadow: 0 10px 30px rgba(0,0,0,0.1);
    }
    
    .video-container iframe, 
    .video-container video {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
    }

    /* --- RESPONSIVE --- */
    @media (max-width: 991px) {
        .course-player-wrapper {
            flex-direction: column;
        }
        
        .course-sidebar {
            width: 100%;
            height: auto;
            position: relative;
            top: 0;
            order: 2; /* Content first on mobile? Or Sidebar first? Usually Video first. */
        }
        
        .course-content-area {
            order: 1;
            padding: 15px;
        }
    }
    
    /* Notes Section */
    .notes-panel {
        background: #fff;
        border-radius: 12px;
        padding: 20px;
        box-shadow: 0 5px 15px rgba(0,0,0,0.05);
        margin-top: 30px;
    }

    /* Utility */
    .scrollbar-thin::-webkit-scrollbar { width: 6px; }
    .scrollbar-thin::-webkit-scrollbar-track { background: transparent; }
    .scrollbar-thin::-webkit-scrollbar-thumb { background: #ccc; border-radius: 10px; }
</style>

<div class="container-fluid p-0">
    <div class="course-player-wrapper">
        
        <!-- SIDEBAR -->
        <div class="course-sidebar scrollbar-thin">
            <div class="sidebar-header">
                <h6 class="mb-2 fw-bold text-white text-truncate" title="{{ $course->course_name }}">{{ $course->course_name }}</h6>
                
                <div class="d-flex align-items-center justify-content-between text-white-50 small mt-3">
                    <span class="d-flex align-items-center gap-2 w-100">
                        <div class="progress flex-grow-1" style="width: 100px; height: 6px; background: rgba(255,255,255,0.2);">
                            <div class="progress-bar bg-white" role="progressbar" id="overall-progress-bar" style="width: 0%"></div>
                        </div>
                        <span class="fw-bold text-white"><span id="overall-progress-pct">0</span>%</span>
                    </span>
                </div>
                <div class="mt-3">
                    <a href="{{ route('user.dashboard') }}" class="btn btn-sm btn-outline-light w-100 rounded-pill"><i class="bi bi-arrow-left me-1"></i> Dashboard</a>
                </div>
            </div>

            <div class="accordion course-accordion" id="courseAccordion">
                @foreach($course->sections as $index => $section)
                <div class="accordion-item border-0 bg-transparent">
                    <h2 class="accordion-header" id="heading{{ $section->id }}">
                        <button class="accordion-button {{ $index != 0 ? 'collapsed' : '' }}" type="button" data-bs-toggle="collapse" data-bs-target="#collapse{{ $section->id }}" aria-expanded="{{ $index == 0 ? 'true' : 'false' }}" aria-controls="collapse{{ $section->id }}">
                            {{ $section->section_title }}
                        </button>
                    </h2>
                    <div id="collapse{{ $section->id }}" class="accordion-collapse collapse {{ $index == 0 ? 'show' : '' }}" aria-labelledby="heading{{ $section->id }}" data-bs-parent="#courseAccordion">
                        <div class="accordion-body">
                            <!-- Lectures -->
                            @foreach($section->lectures as $lecture)
                                @php
                                    $isLocked = $lecture->is_locked ?? false;
                                    $lockedClass = $isLocked ? 'locked' : '';
                                    $unlockDate = $lecture->unlock_date ?? '';
                                @endphp
                                <div class="lesson-item load-content {{ $lockedClass }} {{ (isset($currentContent) && $currentContent['type'] == 'lecture' && $currentContent['id'] == $lecture->id) ? 'active' : '' }}" 
                                     data-type="lecture" 
                                     data-id="{{ $lecture->id }}"
                                     data-locked="{{ $isLocked ? 'true' : 'false' }}"
                                     @if($isLocked) onclick="Swal.fire('Locked', 'This content is locked until {{ $unlockDate }}', 'info'); return false;" @endif
                                     >
                                    <div class="flex-shrink-0">
                                        <i class="fs-5 bi {{ $isLocked ? 'bi-lock-fill' : 'bi-play-circle-fill' }}"></i>
                                    </div>
                                    <span class="text-truncate flex-grow-1">{{ $lecture->lecture_title }}</span>
                                    <div class="completion-status text-success">
                                        @if(isset($progress['lecture']) && $progress['lecture']->contains('content_id', $lecture->id))
                                            <i class="bi bi-check-circle-fill fs-5"></i>
                                        @else
                                            <i class="bi bi-circle fs-5 text-muted opacity-50"></i>
                                        @endif
                                    </div>
                                </div>
                            @endforeach

                            <!-- Quizzes -->
                            @foreach($section->quizzes as $quiz)
                            <div class="lesson-item load-content" data-type="quiz" data-id="{{ $quiz->id }}" data-locked="false">
                                <div class="flex-shrink-0"><i class="bi bi-question-circle-fill fs-5"></i></div>
                                <span class="text-truncate flex-grow-1">{{ $quiz->quiz_title }}</span>
                                <div class="completion-status text-success">
                                    @if(isset($progress['quiz']) && $progress['quiz']->contains('content_id', $quiz->id))
                                        <i class="bi bi-check-circle-fill fs-5"></i>
                                    @else
                                        <i class="bi bi-circle fs-5 text-muted opacity-50"></i>
                                    @endif
                                </div>
                            </div>
                            @endforeach

                            <!-- Materials -->
                            @foreach($section->materials as $material)
                            <div class="lesson-item load-content" data-type="material" data-id="{{ $material->id }}" data-locked="false">
                                <div class="flex-shrink-0"><i class="bi bi-file-earmark-text-fill fs-5"></i></div>
                                <span class="text-truncate flex-grow-1">{{ $material->material_title }}</span>
                                <div class="completion-status text-success">
                                    @if(isset($progress['material']) && $progress['material']->contains('content_id', $material->id))
                                        <i class="bi bi-check-circle-fill fs-5"></i>
                                    @else
                                        <i class="bi bi-circle fs-5 text-muted opacity-50"></i>
                                    @endif
                                </div>
                            </div>
                            @endforeach
                        </div>
                    </div>
                </div>
                @endforeach
            </div>
        </div>

        <!-- MAIN CONTENT -->
        <div class="course-content-area custom-scrollbar-main">
            {{-- Loading Spinner --}}
            <div id="content-loading" class="text-center mt-5 py-5" style="display:none;">
                <div class="spinner-border text-theme" role="status" style="width: 3rem; height: 3rem;"></div>
                <p class="mt-3 fw-bold text-muted">Loading content...</p>
            </div>
            
            {{-- Display Area --}}
            <div id="content-display-area" class="fade-in-up">
                @if(!empty($initialHtml))
                    {!! $initialHtml !!}
                @else
                    <div class="text-center mt-5 p-5 card border-0 shadow-sm rounded-4">
                        <div class="mb-4">
                            <i class="bi bi-mortarboard-fill text-theme display-1"></i>
                        </div>
                        <h2 class="fw-bold text-dark">Welcome Back, {{ Auth::user()->name }}!</h2>
                        <p class="text-muted fs-5">Select a lesson from the sidebar to continue your learning journey.</p>
                    </div>
                @endif
            </div>

            {{-- Tabbed Panel (Notes & Q&A) --}}
            <div class="notes-panel" id="sidebar-content-area" style="display:none;">
                <ul class="nav nav-pills mb-4 nav-justified bg-light rounded-pill p-1" id="pills-tab" role="tablist">
                    <li class="nav-item" role="presentation">
                        <button class="nav-link active rounded-pill fw-bold" id="pills-notes-tab" data-bs-toggle="pill" data-bs-target="#pills-notes" type="button" role="tab" aria-controls="pills-notes" aria-selected="true"><i class="bi bi-journal-text me-2"></i>My Notes</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link rounded-pill fw-bold" id="pills-qa-tab" data-bs-toggle="pill" data-bs-target="#pills-qa" type="button" role="tab" aria-controls="pills-qa" aria-selected="false"><i class="bi bi-chat-dots-fill me-2"></i>Q&A</button>
                    </li>
                </ul>
                
                <div class="tab-content" id="pills-tabContent">
                    <!-- NOTES TAB -->
                    <div class="tab-pane fade show active" id="pills-notes" role="tabpanel" aria-labelledby="pills-notes-tab">
                        <div class="mb-4">
                            <textarea id="note-text" class="form-control mb-2" rows="3" placeholder="Type a note... (Timestamps are automatically added)"></textarea>
                            <div class="d-flex gap-2 justify-content-end">
                                <button class="btn btn-outline-secondary btn-sm" onclick="insertTimestamp()">
                                    <i class="bi bi-clock"></i> Current Time
                                </button>
                                <button class="btn btn-theme btn-sm" onclick="saveNote()">
                                    <i class="bi bi-save"></i> Save Note
                                </button>
                            </div>
                        </div>
                        <h6 class="text-muted fw-bold mb-3 small text-uppercase ls-1">Saved Notes</h6>
                        <div id="saved-notes-list" class="d-flex flex-column gap-3" style="max-height: 500px; overflow-y: auto;">
                            <!-- Notes loaded via JS -->
                        </div>
                    </div>

                    <!-- Q&A TAB -->
                    <div class="tab-pane fade" id="pills-qa" role="tabpanel" aria-labelledby="pills-qa-tab">
                        <div class="mb-4">
                            <label class="form-label fw-bold text-muted small">ASK A NEW QUESTION</label>
                            <textarea id="qa-text" class="form-control mb-2" rows="3" placeholder="What's on your mind?"></textarea>
                            <button class="btn btn-theme btn-sm w-100 fw-bold" onclick="postQuestion()">
                                <i class="bi bi-send-fill me-2"></i> Post Question
                            </button>
                        </div>
                        
                        <div class="d-flex justify-content-between align-items-center mb-3">
                            <h6 class="text-muted fw-bold mb-0 small text-uppercase ls-1">Recent Questions</h6>
                            <button class="btn btn-link btn-sm p-0 text-decoration-none" onclick="loadQuestions(currentLectureId)"><i class="bi bi-arrow-clockwise"></i> Refresh</button>
                        </div>

                        <div id="qa-list" class="d-flex flex-column gap-3" style="max-height: 500px; overflow-y: auto;">
                            <div class="text-center text-muted py-5">
                                <div class="spinner-border spinner-border-sm text-theme" role="status"></div>
                                <p class="mb-0 mt-2 small">Loading discussions...</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>

<!-- Completion Modal -->
<div class="modal fade" id="completionModal" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content border-0 shadow-lg p-4 rounded-4">
            <div class="modal-body text-center">
                <div class="mb-4">
                    <div class="bg-success text-white mx-auto shadow-sm rounded-circle d-flex align-items-center justify-content-center" style="width: 80px; height: 80px;">
                        <i class="bi bi-trophy-fill fs-1"></i>
                    </div>
                </div>
                <h2 class="fw-bold text-dark">Congratulations!</h2>
                <p class="text-muted mt-2">You have successfully mastered <strong>{{ $course->course_name }}</strong>.</p>
                
                <div class="bg-light p-3 rounded-3 mb-4 mt-4 border border-dashed">
                    <p class="mb-0 small fw-bold text-secondary">Your certificate is ready for download.</p>
                </div>

                <div class="d-grid gap-2">
                    <a href="{{ route('user.course.certificate', $course->id) }}" class="btn btn-theme py-3 rounded-pill fw-bold shadow-sm">
                        <i class="bi bi-file-earmark-check-fill me-2"></i> Download Certificate
                    </a>
                    <button type="button" class="btn btn-link text-muted text-decoration-none" data-bs-dismiss="modal">Keep Learning</button>
                </div>
            </div>
        </div>
    </div>
</div>

@endsection

@push('scripts')
<script>
    const courseId = "{{ $course->id }}";
    const userNotes = @json($notes);
    let currentLectureId = null;
    let quizTimerInterval = null;

    $(document).ready(function() {


        updateOverallProgress();

        // Load content on click
        $(document).on('click', '.load-content', function() {
            if($(this).data('locked') === true) return;
            loadContent($(this).data('type'), $(this).data('id'));
        });

        // Initialize first content / Auto-resume
        const initialActive = $('.lesson-item.active');
        if (initialActive.length && initialActive.data('locked') !== true) {
            const type = initialActive.data('type');
            const id = initialActive.data('id');
            
            if (type === 'lecture') {
                currentLectureId = id;
                $('#sidebar-content-area').show();
                renderNotes(id);
                loadQuestions(id);
                // setupVideoEndTracking(id); // Already handled in blade/iframe usually? Or need to re-attach
                setTimeout(() => setupVideoEndTracking(id), 1000); 
            } else {
                $('#sidebar-content-area').hide();
            }
            
            // Scroll to active
            initialActive[0].scrollIntoView({ behavior: 'smooth', block: 'center' });
        }

        // Handle Mark as Completed Button (Delegated)
        $(document).on('click', '#mark-completed-btn', function() {
            const btn = $(this);
            const type = btn.data('type');
            const id = btn.data('id');
            
            btn.prop('disabled', true).html('<span class="spinner-border spinner-border-sm me-2"></span>Saving...');
            
            saveProgress(type, id, function(res) {
                btn.removeClass('btn-theme').addClass('btn-success text-white').html('<i class="bi bi-check-circle-fill me-2"></i> Completed');
                
                // Update sidebar icon
                const item = $(`.lesson-item[data-type="${type}"][data-id="${id}"]`);
                item.find('.completion-status').html('<i class="la la-check-circle fs-5"></i>');
                
                Swal.fire({
                    toast: true,
                    position: 'top-end',
                    icon: 'success',
                    title: 'Lesson Completed!',
                    showConfirmButton: false,
                    timer: 1500
                });
            });
        });
    });

    function loadContent(type, id) {
        $('.lesson-item').removeClass('active');
        const activeItem = $(`.lesson-item[data-type="${type}"][data-id="${id}"]`);
        activeItem.addClass('active');
        
        $('#content-loading').show();
        $('#content-display-area').hide();

        if (quizTimerInterval) clearInterval(quizTimerInterval);

        if (type === 'lecture') {
            currentLectureId = id;
            $('#sidebar-content-area').fadeIn();
            renderNotes(id);
            loadQuestions(id); // Load Q&A
        } else {
            currentLectureId = null;
            $('#sidebar-content-area').hide();
        }

        $.get(`/user/course-content/${courseId}/${type}/${id}`, function(data) {
            $('#content-loading').hide();
            $('#content-display-area').html(data.html).fadeIn();
            
            // Re-check completion status for button state
            if (activeItem.find('.la-check-circle').length > 0) {
                 // It's completed
                 $('#mark-completed-btn').removeClass('btn-theme').addClass('btn-success text-white').html('<i class="bi bi-check-circle-fill me-2"></i> Completed');
            }

            if (type === 'lecture') {
                setTimeout(() => setupVideoEndTracking(id), 1000);
            }
        });
    }

    function renderNotes(lectureId) {
        const list = $('#saved-notes-list');
        list.empty();
        
        if (userNotes[lectureId]) {
            userNotes[lectureId].forEach(note => {
                const timeDisplay = note.timestamp_seconds ? formatTime(note.timestamp_seconds) : '';
                list.append(`
                    <div class="card border-0 bg-light p-3 rounded-3 shadow-sm">
                        <div class="d-flex justify-content-between align-items-center mb-2">
                             ${note.timestamp_seconds ? 
                                `<span class="badge bg-theme cursor-pointer" onclick="seekVideo(${note.timestamp_seconds})"><i class="la la-play"></i> ${timeDisplay}</span>` 
                                : '<span class="badge bg-secondary">Note</span>'}
                             <small class="text-muted">Just now</small>
                        </div>
                        <p class="mb-0 text-dark small">${note.note}</p>
                    </div>
                `);
            });
        }
    }

    function saveNote() {
        if (!currentLectureId) return;
        const note = $('#note-text').val();
        if (!note.trim()) return;
        
        const video = document.getElementById('courseVideo');
        const timestamp = video ? Math.floor(video.currentTime) : null;
        
        $.post("{{ route('user.course.note.save') }}", {
            _token: "{{ csrf_token() }}",
            course_id: courseId,
            lecture_id: currentLectureId,
            note: note,
            timestamp: timestamp
        }, function(res) {
            if (res.success) {
                $('#note-text').val('');
                if (!userNotes[currentLectureId]) userNotes[currentLectureId] = [];
                userNotes[currentLectureId].push({ note: note, timestamp_seconds: timestamp });
                renderNotes(currentLectureId);
            }
        });
    }
    
    function insertTimestamp() {
        const video = document.getElementById('courseVideo');
        if (video) {
            const t = Math.floor(video.currentTime);
            // Append nice formatting to textarea
            const text = $('#note-text').val();
            $('#note-text').val(text + (text.length > 0 ? ' ' : '') + `[${formatTime(t)}] `).focus();
        }
    }

    function seekVideo(seconds) {
        const video = document.getElementById('courseVideo');
        if (video) {
            video.currentTime = seconds;
            video.play();
        }
    }

    function formatTime(seconds) {
        const m = Math.floor(seconds / 60);
        const s = Math.floor(seconds % 60);
        return `${m}:${s < 10 ? '0' : ''}${s}`;
    }

    function setupVideoEndTracking(lectureId) {
        const video = document.getElementById('courseVideo');
        if (video) {
            video.onended = function() {
                saveProgress('lecture', lectureId);
            };
        }
    }

    function saveProgress(type, id, callback = null) {
        $.post("{{ route('user.course.progress') }}", {
            _token: "{{ csrf_token() }}",
            course_id: courseId,
            content_type: type,
            content_id: id
        }, function(data) {
            if (data.success) {
                const item = $(`.lesson-item[data-type="${type}"][data-id="${id}"]`);
                // Update Checkmark
                item.find('.completion-status').html('<i class="la la-check-circle fs-5"></i>');
                updateOverallProgress();
                
                if (data.course_finished) {
                    $('#completionModal').modal('show');
                }
                if (callback) callback(data);
            }
        });
    }

    function updateOverallProgress() {
        const total = $('.lesson-item').length;
        const completed = $('.la-check-circle').length; 
        const pct = total > 0 ? Math.round((completed / total) * 100) : 0;
        
        $('#overall-progress-bar').css('width', pct + '%');
        $('#overall-progress-pct').text(pct);
    }

    // --- Q&A Logic ---
    function loadQuestions(lectureId) {
        if (!lectureId) return;
        const list = $('#qa-list');
        list.html('<div class="text-center py-4"><div class="spinner-border spinner-border-sm text-theme"></div></div>');
        
        $.get(`/user/course-questions/${lectureId}`, function(res) {
            list.empty();
            if (res.questions.length === 0) {
                list.html('<p class="text-center text-muted py-3 small">No questions yet. Be the first to ask!</p>');
                return;
            }
            
            res.questions.forEach(q => {
                let repliesHtml = '';
                q.replies.forEach(r => {
                    const isInstructor = r.is_instructor_reply ? '<span class="badge bg-theme ms-2">Instructor</span>' : '';
                    repliesHtml += `
                        <div class="d-flex gap-3 mt-3 ps-3 border-start border-3">
                            <img src="${r.user.image}" class="rounded-circle object-fit-cover" width="30" height="30">
                            <div class="flex-grow-1 bg-white p-2 rounded-3 shadow-sm border">
                                <div class="d-flex justify-content-between">
                                    <strong class="fs-13 text-dark">${r.user.name} ${isInstructor}</strong>
                                    <small class="text-muted fs-11">${formatDate(r.created_at)}</small>
                                </div>
                                <p class="mb-0 small text-secondary">${r.question}</p>
                            </div>
                        </div>
                    `;
                });

                list.append(`
                    <div class="qa-item mb-2">
                        <div class="d-flex gap-3">
                            <img src="${q.user.image}" class="rounded-circle object-fit-cover" width="35" height="35">
                            <div class="flex-grow-1">
                                <div class="bg-white p-3 rounded-3 shadow-sm border">
                                    <div class="d-flex justify-content-between mb-1">
                                        <strong class="fs-14 text-dark">${q.user.name}</strong>
                                        <small class="text-muted fs-11">${formatDate(q.created_at)}</small>
                                    </div>
                                    <p class="mb-2 text-dark fs-14">${q.question}</p>
                                    <button class="btn btn-link btn-sm p-0 fs-12 text-decoration-none fw-bold text-theme" onclick="toggleReplyForm(${q.id})">Reply</button>
                                </div>
                                
                                <div id="replies-${q.id}">
                                    ${repliesHtml}
                                </div>

                                <div id="reply-form-${q.id}" class="mt-2" style="display:none;">
                                    <div class="d-flex gap-2">
                                        <input type="text" class="form-control form-control-sm" id="reply-input-${q.id}" placeholder="Write a reply...">
                                        <button class="btn btn-theme btn-sm" onclick="postReply(${q.id})"><i class="bi bi-send-fill"></i></button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                `);
            });
        });
    }

    // Removed getUserPhoto as image is now robustly handled by backend asset() helper

    function postQuestion() {
        if (!currentLectureId) return;
        const text = $('#qa-text').val().trim();
        if (!text) return;
        
        $.post("{{ route('user.course.question.store') }}", {
            _token: "{{ csrf_token() }}",
            course_id: courseId,
            lecture_id: currentLectureId,
            question: text
        }, function(res) {
            if (res.success) {
                $('#qa-text').val('');
                loadQuestions(currentLectureId);
            }
        });
    }

    function toggleReplyForm(id) {
        $(`#reply-form-${id}`).toggle();
    }

    function postReply(parentId) {
        const text = $(`#reply-input-${parentId}`).val().trim();
        if(!text) return;

        $.post("{{ route('user.course.question.reply') }}", {
            _token: "{{ csrf_token() }}",
            course_id: courseId,
            lecture_id: currentLectureId,
            parent_id: parentId,
            question: text
        }, function(res) {
             if (res.success) {
                 loadQuestions(currentLectureId);
             }
        });
    }

    function formatDate(dateString) {
        const date = new Date(dateString);
        return date.toLocaleDateString() + ' ' + date.toLocaleTimeString([], {hour: '2-digit', minute:'2-digit'});
    }

    // Quiz Handlers (Same logic, modernized text)
    $(document).on('submit', '#quiz-form', function(e) {
        e.preventDefault();
        const formData = $(this).serialize();
        $('#submit-quiz-btn').prop('disabled', true).html('<span class="spinner-border spinner-border-sm"></span> Submitting...');
        if (quizTimerInterval) clearInterval(quizTimerInterval);

        $.post("{{ route('user.course.quiz.submit') }}", formData, function(data) {
            showQuizResults(data);
        });
    });

    $(document).on('click', '#start-quiz-btn', function() {
        $('#quiz-intro').hide();
        $('#quiz-questions-area').fadeIn();
        const duration = $(this).data('duration');
        if (duration > 0) startTimer(duration);
    });

    function startTimer(minutes) {
        let seconds = minutes * 60;
        const timerDisplay = $('#timer-clock');
        quizTimerInterval = setInterval(function() {
            const m = Math.floor(seconds / 60);
            const s = seconds % 60;
            timerDisplay.text(`${m}:${s < 10 ? '0' : ''}${s}`);
            if (seconds <= 0) {
                clearInterval(quizTimerInterval);
                $('#quiz-form').submit();
            }
            seconds--;
        }, 1000);
    }
    
    function showQuizResults(data) {
        let html = `
            <div class="text-center py-5">
                <div class="mb-4">
                    <i class="bi ${data.is_pass ? 'bi-trophy-fill text-success' : 'bi-x-circle-fill text-danger'}" style="font-size: 80px;"></i>
                </div>
                <h3 class="fw-bold ${data.is_pass ? 'text-success' : 'text-danger'}">${data.is_pass ? 'Congratulations! You Passed!' : 'Don\'t give up! Try again.'}</h3>
                <div class="display-3 fw-bold my-4 text-dark">${data.score}%</div>
                
                <div class="d-flex justify-content-center gap-3 mb-5">
                    <button class="btn btn-theme shadow-sm" onclick="loadContent('quiz', '${currentLectureId || data.quiz_id || ''}')"><i class="bi bi-eye"></i> Review Answers</button>
                    ${!data.is_pass ? `<button class="btn btn-outline-danger" onclick="loadContent('quiz', '${currentLectureId || data.quiz_id || ''}')"><i class="bi bi-arrow-repeat"></i> Retry Quiz</button>` : ''}
                </div>
            </div>
        `;
         
        $('#content-display-area').html(html);
        if (data.is_pass) {
            const item = $(`.lesson-item.active[data-type="quiz"]`);
            // Mark complete
            item.find('.completion-status').html('<i class="la la-check-circle fs-5"></i>');
            updateOverallProgress();
        }
        if (data.course_finished) $('#completionModal').modal('show');
    }
</script>
<style>
    /* Slight fade up animation for content */
    .fade-in-up {
        animation: fadeInUp 0.5s ease-out;
    }
    @keyframes fadeInUp {
        from { opacity: 0; transform: translateY(20px); }
        to { opacity: 1; transform: translateY(0); }
    }
</style>
@endpush
