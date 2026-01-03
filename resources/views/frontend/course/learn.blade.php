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
    
    /* Fix clickability and overlays */
    .course-player-wrapper {
        z-index: 5 !important;
        position: relative;
    }
    .course-sidebar, .course-content-area {
        position: relative;
        z-index: 1020 !important;
        pointer-events: auto !important;
    }
    .lesson-item, .nav-link, button, a, .completion-status {
        pointer-events: auto !important;
        cursor: pointer !important;
    }
    .modal-backdrop {
        display: none !important;
        visibility: hidden !important;
    }
    body.modal-open {
        overflow: auto !important;
        padding-right: 0 !important;
    }
    
    /* Ensure tabs are always visible once loaded */
    #sidebar-content-area {
        margin-top: 40px;
        border-top: 1px solid #eee;
        padding-top: 20px;
    }

    /* Lesson items click area */
    .lesson-item {
        position: relative;
        z-index: 30;
    }
    
    /* Prominent Green Checkmark */
    .completion-status i.bi-check-circle-fill {
        color: #198754 !important;
        filter: drop-shadow(0 0 2px rgba(25, 135, 84, 0.2));
    }

    /* Force hide preloader on this page specifically to avoid click blocking */
    .rating-stars {
        display: flex;
        flex-direction: row-reverse;
        justify-content: flex-end;
    }
    .rating-stars input:checked ~ label,
    .rating-stars label:hover,
    .rating-stars label:hover ~ label {
        color: #ffc107 !important;
    }
    .rating-stars label {
        color: #ddd;
        cursor: pointer;
        transition: color 0.2s;
    }
    .cursor-pointer { cursor: pointer; }
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
                    <li class="nav-item" role="presentation">
                        <button class="nav-link rounded-pill fw-bold" id="pills-reviews-tab" data-bs-toggle="pill" data-bs-target="#pills-reviews" type="button" role="tab" aria-controls="pills-reviews" aria-selected="false"><i class="bi bi-star-fill me-2"></i>Reviews</button>
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

                    <!-- REVIEWS TAB -->
                    <div class="tab-pane fade" id="pills-reviews" role="tabpanel" aria-labelledby="pills-reviews-tab">
                        <div class="mb-4">
                            <h6 class="text-muted fw-bold mb-3 small text-uppercase ls-1">Course Reviews</h6>
                            <div id="reviews-list" class="d-flex flex-column gap-3" style="max-height: 500px; overflow-y: auto;">
                                <!-- Reviews loaded via JS -->
                            </div>
                        </div>

                        <div class="mt-4 border-top pt-4">
                            <h6 class="fw-bold mb-3">Leave a Review</h6>
                            <form action="{{ route('store.review') }}" method="POST">
                                @csrf
                                <input type="hidden" name="course_id" value="{{ $course->id }}">
                                <div class="mb-3">
                                    <label class="form-label small fw-bold text-muted">RATING</label>
                                    <div class="rating-stars mb-2">
                                        <input type="radio" name="rating" value="5" id="star5" class="d-none"><label for="star5" class="bi bi-star-fill fs-4 me-1"></label>
                                        <input type="radio" name="rating" value="4" id="star4" class="d-none"><label for="star4" class="bi bi-star-fill fs-4 me-1"></label>
                                        <input type="radio" name="rating" value="3" id="star3" class="d-none"><label for="star3" class="bi bi-star-fill fs-4 me-1"></label>
                                        <input type="radio" name="rating" value="2" id="star2" class="d-none"><label for="star2" class="bi bi-star-fill fs-4 me-1"></label>
                                        <input type="radio" name="rating" value="1" id="star1" class="d-none"><label for="star1" class="bi bi-star-fill fs-4 me-1"></label>
                                    </div>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label small fw-bold text-muted">COMMENT</label>
                                    <textarea name="comment" class="form-control rounded-3" rows="3" placeholder="Share your experience..."></textarea>
                                </div>
                                <button type="submit" class="btn btn-theme w-100 fw-bold py-2 rounded-pill shadow-sm">Submit Review</button>
                            </form>
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
    var courseId = "{{ $course->id }}";
    var userNotes = @json($notes);
    var currentLectureId = null;
    var quizTimerInterval = null;

    function initLearnPage() {
        updateOverallProgress();

        var initialActive = $('.lesson-item.active');
        if (initialActive.length && initialActive.data('locked') !== true) {
            var type = initialActive.data('type');
            var id = initialActive.data('id');
            
            if (type === 'lecture') {
                currentLectureId = id;
                $('#sidebar-content-area').show();
                renderNotes(id);
                loadQuestions(id);
                loadReviews();
                setTimeout(() => setupVideoEndTracking(id), 200); 
            } else {
                $('#sidebar-content-area').hide();
            }
            
            setTimeout(() => {
                var sidebar = $('.course-sidebar');
                if (sidebar.length && initialActive.length && initialActive.is(':visible')) {
                    try {
                        sidebar.scrollTop(initialActive.offset().top - sidebar.offset().top + sidebar.scrollTop() - 100);
                    } catch(e) {
                        console.warn('Sidebar scroll failed', e);
                    }
                }
            }, 50);
        }
    }

    $(document).ready(initLearnPage);
    document.addEventListener('turbo:load', initLearnPage);

    $(document).off('click', '.load-content').on('click', '.load-content', function(e) {
        e.preventDefault();
        var item = $(this);
        if(item.data('locked') == true || item.data('locked') == "true") {
             Swal.fire('Locked', 'This content is not yet available.', 'info');
             return false;
        }
        loadContent(item.data('type'), item.data('id'));
    });

    $(document).off('click', '#mark-completed-btn').on('click', '#mark-completed-btn', function() {
        var btn = $(this);
        if (btn.hasClass('btn-success')) return;

        var type = btn.data('type');
        var id = btn.data('id');
        
        btn.prop('disabled', true).html('<span class="spinner-border spinner-border-sm me-2"></span>Saving...');
        
        saveProgress(type, id, function(res) {
            btn.prop('disabled', true).removeClass('btn-theme').addClass('btn-success text-white').html('<i class="bi bi-check-circle-fill me-2"></i> Completed');
            
            var item = $(`.lesson-item[data-type="${type}"][data-id="${id}"]`);
            item.find('.completion-status').html('<i class="bi bi-check-circle-fill fs-5"></i>');
            
            updateOverallProgress();
            
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

    function loadContent(type, id) {
        $('.lesson-item').removeClass('active');
        var activeItem = $(`.lesson-item[data-type="${type}"][data-id="${id}"]`);
        activeItem.addClass('active');
        
        $('#content-loading').show();
        $('#content-display-area').hide();

        if (quizTimerInterval) clearInterval(quizTimerInterval);

        if (type === 'lecture') {
            currentLectureId = id;
            $('#sidebar-content-area').show();
            renderNotes(id);
            loadQuestions(id);
            loadReviews();
        } else {
            currentLectureId = null;
            $('#sidebar-content-area').hide();
        }

        $.get(`/user/course-content/${courseId}/${type}/${id}`, function(data) {
            $('#content-loading').hide();
            $('#content-display-area').html(data.html).show();
            
            // Sync sidebar icon instantly
            if (data.is_completed) {
                activeItem.find('.completion-status').html('<i class="bi bi-check-circle-fill fs-5"></i>');
                $('#mark-completed-btn').prop('disabled', true).removeClass('btn-theme').addClass('btn-success text-white').html('<i class="bi bi-check-circle-fill me-2"></i> Completed');
                updateOverallProgress();
            } else {
                $('#mark-completed-btn').prop('disabled', false).removeClass('btn-success text-white').addClass('btn-theme').html('<i class="bi bi-check-circle me-2"></i> Mark as Completed');
            }

            if (type === 'lecture') {
                setTimeout(() => setupVideoEndTracking(id), 200);
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
        var total = $('.lesson-item').length;
        var completed = $('.lesson-item .bi-check-circle-fill').length; 
        var pct = total > 0 ? Math.round((completed / total) * 100) : 0;
        
        $('#overall-progress-bar').css('width', pct + '%');
        $('#overall-progress-pct').text(pct);
        
        if (pct === 100 && $('#overall-progress-pct').parent().find('.bi-patch-check-fill').length === 0) {
            $('#overall-progress-pct').parent().append('<i class="bi bi-patch-check-fill text-success ms-2"></i>');
        }
    }

    // --- Q&A Logic ---
    function loadReviews() {
        var list = $('#reviews-list');
        list.html('<div class="text-center py-4"><div class="spinner-border spinner-border-sm text-theme"></div></div>');
        
        $.get(`/user/course-reviews/${courseId}`, function(res) {
            list.empty();
            if (res.reviews.length === 0) {
                list.html('<p class="text-center text-muted py-3 small">No reviews yet for this course.</p>');
                return;
            }
            
            res.reviews.forEach(r => {
                var stars = '';
                for(var i=1; i<=5; i++) {
                    stars += `<i class="bi bi-star${i <= r.rating ? '-fill text-warning' : ' text-muted'}"></i> `;
                }

                list.append(`
                    <div class="review-item bg-white p-3 rounded-3 shadow-sm border mb-2">
                        <div class="d-flex gap-3">
                            <img src="${r.user.image}" class="rounded-circle object-fit-cover" width="35" height="35">
                            <div class="flex-grow-1">
                                <div class="d-flex justify-content-between align-items-center mb-1">
                                    <strong class="text-dark small">${r.user.name}</strong>
                                    <small class="text-muted" style="font-size: 10px;">${formatDate(r.created_at)}</small>
                                </div>
                                <div class="mb-2" style="font-size: 12px;">${stars}</div>
                                <p class="mb-0 text-secondary small">${r.comment}</p>
                            </div>
                        </div>
                    </div>
                `);
            });
        });
    }
    function loadQuestions(lectureId) {
        if (!lectureId) return;
        var list = $('#qa-list');
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
        var text = $(`#reply-input-${parentId}`).val().trim();
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
        var date = new Date(dateString);
        return date.toLocaleDateString() + ' ' + date.toLocaleTimeString([], {hour: '2-digit', minute:'2-digit'});
    }

    // Quiz Handlers (Same logic, modernized text)
    $(document).on('submit', '#quiz-form', function(e) {
        e.preventDefault();
        var formData = $(this).serialize();
        $('#submit-quiz-btn').prop('disabled', true).html('<span class="spinner-border spinner-border-sm"></span> Submitting...');
        if (quizTimerInterval) clearInterval(quizTimerInterval);

        $.post("{{ route('user.course.quiz.submit') }}", formData, function(data) {
            showQuizResults(data);
        });
    });

    $(document).on('click', '#start-quiz-btn', function() {
        $('#quiz-intro').hide();
        $('#quiz-questions-area').show();
        var duration = $(this).data('duration');
        if (duration > 0) startTimer(duration);
    });

    function startTimer(minutes) {
        var seconds = minutes * 60;
        var timerDisplay = $('#timer-clock');
        quizTimerInterval = setInterval(function() {
            var m = Math.floor(seconds / 60);
            var s = seconds % 60;
            timerDisplay.text(`${m}:${s < 10 ? '0' : ''}${s}`);
            if (seconds <= 0) {
                clearInterval(quizTimerInterval);
                $('#quiz-form').submit();
            }
            seconds--;
        }, 1000);
    }
    
    function showQuizResults(data) {
        let reviewHtml = '';
        if (data.details) {
            reviewHtml = `
                <div class="mt-5 text-start">
                    <h4 class="fw-bold mb-4 border-bottom pb-2">Review Your Answers</h4>
                    <div class="d-flex flex-column gap-4">
                        ${data.details.map((d, i) => `
                            <div class="card border-0 shadow-sm rounded-4 overflow-hidden">
                                <div class="card-header ${d.is_correct ? 'bg-success-subtle' : 'bg-danger-subtle'} py-3">
                                    <div class="d-flex justify-content-between align-items-center">
                                        <span class="badge ${d.is_correct ? 'bg-success' : 'bg-danger'} rounded-pill">Question ${i+1}</span>
                                        <span class="fw-bold ${d.is_correct ? 'text-success' : 'text-danger'}">
                                            <i class="bi ${d.is_correct ? 'bi-check-circle-fill' : 'bi-x-circle-fill'}"></i> 
                                            ${d.is_correct ? 'Correct' : 'Incorrect'}
                                        </span>
                                    </div>
                                    <p class="mt-3 mb-0 fs-5 text-dark fw-medium">${d.question}</p>
                                </div>
                                <div class="card-body p-4">
                                    <div class="row g-3">
                                        ${Object.entries(d.options).map(([key, value]) => {
                                            const normalizedKey = key.toLowerCase();
                                            const normalizedCorrect = String(d.correct || '').toLowerCase();
                                            const normalizedSelected = String(d.selected || '').toLowerCase();
                                            
                                            const isThisCorrect = normalizedKey === normalizedCorrect;
                                            const isThisSelected = normalizedKey === normalizedSelected;
                                            
                                            let borderClass = 'bg-light';
                                            if (isThisCorrect) borderClass = 'border-success bg-success-subtle';
                                            else if (isThisSelected) borderClass = 'border-danger bg-danger-subtle';

                                            return `
                                                <div class="col-md-6">
                                                    <div class="p-3 border rounded-3 ${borderClass} h-100">
                                                        <span class="fw-bold me-2 text-uppercase">${key}.</span> ${value}
                                                        ${isThisCorrect ? '<i class="bi bi-check-circle-fill text-success float-end"></i>' : ''}
                                                        ${isThisSelected && !isThisCorrect ? '<i class="bi bi-x-circle-fill text-danger float-end"></i>' : ''}
                                                    </div>
                                                </div>
                                            `;
                                        }).join('')}
                                    </div>
                                    ${d.explanation ? `
                                        <div class="mt-4 p-3 bg-light rounded-3 border-start border-4 border-theme">
                                            <strong class="text-theme d-block mb-1">Explanation:</strong>
                                            <p class="mb-0 small text-secondary">${d.explanation}</p>
                                        </div>
                                    ` : ''}
                                </div>
                            </div>
                        `).join('')}
                    </div>
                </div>
            `;
        }

        var html = `
            <div class="text-center py-5">
                <div class="mb-4">
                    <i class="bi ${data.is_pass ? 'bi-trophy-fill text-success' : 'bi-x-circle-fill text-danger'}" style="font-size: 80px;"></i>
                </div>
                <h2 class="fw-bold ${data.is_pass ? 'text-success' : 'text-danger'}">${data.is_pass ? 'Congratulations! You Passed!' : 'Don\'t give up! Try again.'}</h2>
                <div class="display-3 fw-bold my-4 text-dark">${data.score}%</div>
                
                ${data.negative_marking ? `
                    <div class="alert alert-warning d-inline-block px-4 mb-4">
                        <small class="fw-bold text-uppercase d-block text-muted mb-1">Score Calculation (Negative Marking Enabled)</small>
                        <div class="fs-5">
                            <span class="text-success"><i class="bi bi-check-circle-fill"></i> ${data.correct_count} Correct</span> 
                            - 
                            <span class="text-danger"><i class="bi bi-x-circle-fill"></i> ${data.wrong_count} Wrong (&times; ${data.negative_mark_value})</span>
                        </div>
                        <div class="mt-1 small text-muted">
                            (Raw Score: ${(data.correct_count - (data.wrong_count * data.negative_mark_value)).toFixed(2)} / ${data.total_questions})
                        </div>
                    </div>
                ` : `
                   <div class="mb-4 text-muted">
                        ${data.correct_count} Correct / ${data.total_questions} Questions
                   </div>
                `}
                
                <div class="d-flex justify-content-center gap-3 mb-5">
                    <button class="btn btn-outline-secondary rounded-pill px-4" onclick="loadContent('quiz', '${data.quiz_id}')">
                        <i class="bi bi-arrow-repeat me-2"></i> Retake Quiz
                    </button>
                    ${data.is_pass ? `
                        <button class="btn btn-theme rounded-pill px-4" onclick="goToNextContent()">
                            Continue Learning <i class="bi bi-arrow-right ms-2"></i>
                        </button>
                    ` : ''}
                </div>

                ${reviewHtml}
            </div>
        `;
         
        $('#content-display-area').html(html);
        window.scrollTo({ top: 0, behavior: 'smooth' });

        if (data.is_pass) {
            var item = $(`.lesson-item.active[data-type="quiz"]`);
            // Mark complete
            item.find('.completion-status').html('<i class="bi bi-check-circle-fill fs-5"></i>');
            updateOverallProgress();
        }
        if (data.course_finished) $('#completionModal').modal('show');
    }

    function goToNextContent() {
        var current = $('.lesson-item.active');
        var next = current.nextAll('.lesson-item:not(.locked)').first();
        if (next.length) {
            next.click();
        } else {
            // Check next section
            var nextSection = current.closest('.accordion-item').next('.accordion-item');
            if (nextSection.length) {
               var nextItem = nextSection.find('.lesson-item:not(.locked)').first();
               if (nextItem.length) {
                   nextSection.find('.accordion-button.collapsed').click(); // Open accordion
                   nextItem.click();
               }
            }
        }
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