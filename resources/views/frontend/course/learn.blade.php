@extends('frontend.master')

@section('content')
<style>
    :root {
        --learning-bg: #f5f7fb;
        --sidebar-bg: #ffffff;
        --text-main: #2d3748;
        --text-muted: #718096;
        --accent-color: #7079e7;
        --border-color: #edf2f7;
        --card-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
        --header-height: 70px;
    }

    [data-theme='dark'], .dark-theme {
        --learning-bg: #1a202c;
        --sidebar-bg: #2d3748;
        --text-main: #e2e8f0;
        --text-muted: #a0aec0;
        --accent-color: #8c95ff;
        --border-color: #4a5568;
        --card-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.4);
    }

    body {
        background-color: var(--learning-bg) !important;
        color: var(--text-main);
        transition: background-color 0.3s ease;
    }

    .learning-container {
        height: calc(100vh - var(--header-height));
        display: flex;
        overflow: hidden;
        background: var(--learning-bg);
    }

    /* Sidebars */
    .learning-sidebar, .notes-sidebar {
        width: 300px;
        background: var(--sidebar-bg);
        border-right: 1px solid var(--border-color);
        display: flex;
        flex-direction: column;
        transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
        z-index: 10;
        box-shadow: var(--card-shadow);
    }
    
    .notes-sidebar {
        border-right: none;
        border-left: 1px solid var(--border-color);
        width: 320px;
    }

    /* Sidebar Header */
    .sidebar-header {
        padding: 20px;
        background: linear-gradient(135deg, var(--accent-color), #4e54c8);
        color: white;
    }

    /* Content Area */
    .main-content {
        flex: 1;
        overflow-y: auto;
        padding: 30px;
        display: flex;
        flex-direction: column;
        gap: 20px;
        scroll-behavior: smooth;
    }

    /* Sidebar Items */
    .section-header {
        padding: 15px 20px;
        background: var(--learning-bg);
        font-weight: 700;
        font-size: 0.9rem;
        text-transform: uppercase;
        letter-spacing: 0.05em;
        color: var(--text-muted);
        border-bottom: 1px solid var(--border-color);
        display: flex;
        align-items: center;
        justify-content: space-between;
    }

    .content-item {
        padding: 14px 20px;
        border-bottom: 1px solid var(--border-color);
        cursor: pointer;
        display: flex;
        align-items: center;
        gap: 12px;
        transition: all 0.2s ease;
        position: relative;
        background: transparent;
    }

    .content-item:hover:not(.locked) {
        background: rgba(112, 121, 231, 0.05);
        padding-left: 25px;
    }

    .content-item.active {
        background: rgba(112, 121, 231, 0.1);
        color: var(--accent-color);
        font-weight: 600;
        border-left: 4px solid var(--accent-color);
    }

    .content-item.locked {
        opacity: 0.6;
        cursor: not-allowed;
    }

    .item-icon {
        width: 24px;
        height: 24px;
        display: flex;
        align-items: center;
        justify-content: center;
        border-radius: 6px;
        background: var(--learning-bg);
        color: var(--text-muted);
    }

    .active .item-icon {
        background: var(--accent-color);
        color: white;
    }

    .completed-icon {
        color: #48bb78;
        font-size: 1.2rem;
        margin-left: auto;
    }

    /* Main Content Styling */
    .content-card {
        background: var(--sidebar-bg);
        border-radius: 16px;
        padding: 0;
        box-shadow: var(--card-shadow);
        overflow: hidden;
        border: 1px solid var(--border-color);
    }

    .video-wrapper {
        aspect-ratio: 16/9;
        background: #000;
        width: 100%;
    }

    .content-info {
        padding: 24px;
    }

    .mark-read-btn {
        background: var(--accent-color);
        color: white;
        border: none;
        padding: 10px 24px;
        border-radius: 10px;
        font-weight: 600;
        display: flex;
        align-items: center;
        gap: 8px;
        transition: all 0.3s ease;
        box-shadow: 0 4px 12px rgba(112, 121, 231, 0.3);
    }

    .mark-read-btn:hover {
        transform: translateY(-2px);
        box-shadow: 0 6px 16px rgba(112, 121, 231, 0.4);
        background: #5d66d1;
        color: white;
    }

    .mark-read-btn.completed {
        background: #48bb78;
        box-shadow: 0 4px 12px rgba(72, 187, 120, 0.3);
    }

    /* Note Cards */
    .note-card {
        background: var(--learning-bg);
        padding: 16px;
        border-radius: 12px;
        margin-bottom: 12px;
        border: 1px solid var(--border-color);
        transition: transform 0.2s ease;
    }

    .note-card:hover {
        transform: scale(1.02);
    }

    .note-time {
        color: var(--accent-color);
        font-weight: 700;
        font-size: 0.75rem;
        background: rgba(112, 121, 231, 0.1);
        padding: 2px 8px;
        border-radius: 4px;
        display: inline-block;
        margin-bottom: 8px;
        cursor: pointer;
    }

    .note-input {
        background: var(--learning-bg);
        color: var(--text-main);
        border: 1px solid var(--border-color);
        border-radius: 12px;
        padding: 15px;
        width: 100%;
        margin-bottom: 15px;
    }

    /* Custom Scrollbar */
    ::-webkit-scrollbar { width: 6px; }
    ::-webkit-scrollbar-track { background: transparent; }
    ::-webkit-scrollbar-thumb { background: var(--border-color); border-radius: 10px; }
    ::-webkit-scrollbar-thumb:hover { background: var(--text-muted); }

    @media (max-width: 1200px) {
        .learning-sidebar, .notes-sidebar { width: 260px; }
    }

    @media (max-width: 992px) {
        .learning-container { flex-direction: column; overflow-y: auto; height: auto; }
        .learning-sidebar, .notes-sidebar { width: 100%; height: auto; border: none; }
        .main-content { padding: 15px; }
    }
</style>

<div class="container-fluid p-0">
    <div class="learning-container">
        <!-- LEFT: Course Contents -->
        <div class="learning-sidebar">
            <div class="sidebar-header">
                <h6 class="mb-2 font-weight-bold text-white text-truncate" title="{{ $course->course_name }}">{{ $course->course_name }}</h6>
                <div class="d-flex align-items-center justify-content-between">
                    <div class="flex-grow-1 mr-3">
                        <div class="progress" style="height: 6px; border-radius: 10px; background: rgba(255,255,255,0.2);">
                            <div class="progress-bar bg-white" role="progressbar" id="overall-progress-bar" style="width: 0%"></div>
                        </div>
                    </div>
                    <small class="text-white font-weight-bold"><span id="overall-progress-pct">0</span>%</small>
                </div>
            </div>
            
            <div class="accordion overflow-y-auto flex-grow-1" id="courseAccordion">
                @foreach($course->sections as $index => $section)
                <div class="accordion-item border-0 bg-transparent">
                    <div class="section-header" data-bs-toggle="collapse" data-bs-target="#collapse{{ $section->id }}">
                        <span>{{ $section->section_title }}</span>
                        <i class="la la-angle-down fs-12"></i>
                    </div>
                    <div id="collapse{{ $section->id }}" class="accordion-collapse collapse {{ $index == 0 ? 'show' : '' }}" data-bs-parent="#courseAccordion">
                        <div class="accordion-body p-0">
                            <!-- Lectures -->
                            @foreach($section->lectures as $lecture)
                                @php
                                    $isLocked = $lecture->is_locked ?? false;
                                    $lockedClass = $isLocked ? 'locked' : '';
                                    $unlockDate = $lecture->unlock_date ?? '';
                                @endphp
                                <div class="content-item load-content {{ $lockedClass }} {{ (isset($currentContent) && $currentContent['type'] == 'lecture' && $currentContent['id'] == $lecture->id) ? 'active' : '' }}" 
                                     data-type="lecture" 
                                     data-id="{{ $lecture->id }}"
                                     data-locked="{{ $isLocked ? 'true' : 'false' }}"
                                     @if($isLocked) onclick="Swal.fire('Locked', 'This content is locked until {{ $unlockDate }}', 'info'); return false;" @endif
                                     >
                                    <div class="item-icon">
                                        <i class="la {{ $isLocked ? 'la-lock' : 'la-play' }}"></i>
                                    </div>
                                    <span class="text-truncate fs-14">{{ $lecture->lecture_title }}</span>
                                    <div class="completion-status ml-auto">
                                        @if(isset($progress['lecture']) && $progress['lecture']->contains('content_id', $lecture->id))
                                            <i class="la la-check-circle completed-icon"></i>
                                        @endif
                                    </div>
                                </div>
                            @endforeach

                            <!-- Quizzes -->
                            @foreach($section->quizzes as $quiz)
                            <div class="content-item load-content" data-type="quiz" data-id="{{ $quiz->id }}" data-locked="false">
                                <div class="item-icon"><i class="la la-question-circle"></i></div>
                                <span class="text-truncate fs-14">{{ $quiz->quiz_title }}</span>
                                <div class="completion-status ml-auto">
                                    @if(isset($progress['quiz']) && $progress['quiz']->contains('content_id', $quiz->id))
                                        <i class="la la-check-circle completed-icon"></i>
                                    @endif
                                </div>
                            </div>
                            @endforeach

                            <!-- Materials -->
                            @foreach($section->materials as $material)
                            <div class="content-item load-content" data-type="material" data-id="{{ $material->id }}" data-locked="false">
                                <div class="item-icon"><i class="la la-file"></i></div>
                                <span class="text-truncate fs-14">{{ $material->material_title }}</span>
                                <div class="completion-status ml-auto">
                                    @if(isset($progress['material']) && $progress['material']->contains('content_id', $material->id))
                                        <i class="la la-check-circle completed-icon"></i>
                                    @endif
                                </div>
                            </div>
                            @endforeach
                        </div>
                    </div>
                </div>
                @endforeach
            </div>
            
            <div class="p-3 border-top bg-light">
                <a href="{{ route('user.dashboard') }}" class="btn btn-sm btn-outline-secondary w-100"><i class="la la-arrow-left"></i> Back to Dashboard</a>
            </div>
        </div>

        <!-- MIDDLE: Main Display Area -->
        <div class="main-content">
            <div id="content-loading" class="text-center mt-5" style="display:none;">
                <div class="spinner-border text-primary" role="status"></div>
                <p class="mt-2 font-weight-bold">Fetching your lesson...</p>
            </div>
            
            <div id="content-display-area">
                <div class="text-center mt-5 p-5 content-card bg-white">
                    <div class="mb-4">
                        <i class="la la-graduation-cap text-primary" style="font-size: 100px;"></i>
                    </div>
                    <h2 class="font-weight-bold">Ready to learn, {{ Auth::user()->name }}?</h2>
                    <p class="text-muted fs-18">Select a lesson from the sidebar to begin your journey.</p>
                </div>
            </div>
        </div>

        <!-- RIGHT: Notes Sidebar -->
        <div class="notes-sidebar">
            <div class="p-3 border-bottom d-flex align-items-center justify-content-between">
                <h5 class="m-0 font-weight-bold">My Notes</h5>
                <button class="btn btn-sm btn-light" id="toggle-notes"><i class="la la-times"></i></button>
            </div>
            
            <div id="notes-placeholder" class="text-muted small text-center mt-5 p-4">
                <i class="la la-sticky-note fs-45 mb-2 d-block opacity-4"></i>
                Select a lecture to record your thoughts and timestamps.
            </div>
            
            <div id="notes-container" class="p-3 flex-grow-1 overflow-y-auto" style="display:none;">
                <div class="mb-4">
                    <textarea id="note-text" class="note-input" rows="4" placeholder="Type something important..."></textarea>
                    <div class="d-flex gap-2">
                        <button class="btn btn-sm btn-outline-primary flex-grow-1" onclick="insertTimestamp()"><i class="la la-clock"></i> Timestamp</button>
                        <button class="btn btn-sm btn-primary flex-grow-1" onclick="saveNote()"><i class="la la-save"></i> Save Note</button>
                    </div>
                </div>
                
                <h6 class="font-weight-bold mb-3 text-uppercase fs-12 letter-spacing-1">Previous Notes</h6>
                <div id="saved-notes-list">
                    <!-- Notes loaded via JS -->
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Completion Modal -->
<div class="modal fade" id="completionModal" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content border-0 shadow-lg p-4">
            <div class="modal-body text-center">
                <div class="mb-4">
                    <div class="icon-box bg-success text-white mx-auto shadow-sm" style="width: 80px; height: 80px; border-radius: 50%; display: flex; align-items:center; justify-content:center;">
                        <i class="la la-trophy fs-45"></i>
                    </div>
                </div>
                <h2 class="font-weight-bold">Congratulations!</h2>
                <p class="text-muted fs-16 mt-2">You have successfully mastered <strong>{{ $course->course_name }}</strong>.</p>
                
                <div class="bg-light p-3 rounded mb-4 mt-4 border">
                    <p class="mb-0 fs-14">Your hard work has paid off. Your certificate is ready for download.</p>
                </div>

                <div class="d-grid gap-2">
                    <a href="{{ route('user.course.certificate', $course->id) }}" class="btn theme-btn py-3 shadow">
                        <i class="la la-certificate fs-18"></i> Download My Certificate
                    </a>
                    <button type="button" class="btn btn-link text-muted" data-bs-dismiss="modal">Close</button>
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

        $(document).on('click', '.load-content', function() {
            if($(this).data('locked') === true) return;
            loadContent($(this).data('type'), $(this).data('id'));
        });

        // Initialize first content
        const initialActive = $('.content-item.active');
        if (initialActive.length && initialActive.data('locked') !== true) {
            loadContent(initialActive.data('type'), initialActive.data('id'));
        }

        // Toggle notes
        $('#toggle-notes').click(function() {
            $('.notes-sidebar').toggleClass('d-none');
        });

        // Handle Mark as Completed Button
        $(document).on('click', '#mark-completed-btn', function() {
            const btn = $(this);
            const type = btn.data('type');
            const id = btn.data('id');
            
            btn.prop('disabled', true).html('<i class="la la-spinner la-spin"></i> Saving...');
            
            saveProgress(type, id, function(res) {
                btn.addClass('completed').html('<i class="la la-check-circle"></i> Completed');
                Swal.fire({
                    toast: true,
                    position: 'top-end',
                    icon: 'success',
                    title: 'Marked as completed!',
                    showConfirmButton: false,
                    timer: 1500
                });
            });
        });
    });

    function loadContent(type, id) {
        $('.content-item').removeClass('active');
        const activeItem = $(`.content-item[data-type="${type}"][data-id="${id}"]`);
        activeItem.addClass('active');
        
        $('#content-loading').show();
        $('#content-display-area').hide();

        if (quizTimerInterval) clearInterval(quizTimerInterval);

        if (type === 'lecture') {
            currentLectureId = id;
            $('#notes-placeholder').hide();
            $('#notes-container').show();
            renderNotes(id);
        } else {
            currentLectureId = null;
            $('#notes-placeholder').show();
            $('#notes-container').hide();
        }

        $.get(`/user/course-content/${courseId}/${type}/${id}`, function(data) {
            $('#content-loading').hide();
            $('#content-display-area').html(data.html).fadeIn();
            
            // Check if already completed and update button
            if (activeItem.find('.completed-icon').length > 0) {
                $('#mark-completed-btn').addClass('completed').html('<i class="la la-check-circle"></i> Completed');
            }

            if (type === 'lecture') {
                setupVideoEndTracking(id);
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
                    <div class="note-card shadow-sm">
                        ${note.timestamp_seconds ? `<span class="note-time" onclick="seekVideo(${note.timestamp_seconds})"><i class="la la-clock"></i> ${timeDisplay}</span>` : ''}
                        <p class="m-0 fs-13 lh-20">${note.note}</p>
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
            $('#note-text').val($('#note-text').val() + ` [${formatTime(t)}] `);
            $('#note-text').focus();
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
                const item = $(`.content-item[data-type="${type}"][data-id="${id}"]`);
                if (item.find('.completed-icon').length === 0) {
                    item.find('.completion-status').html('<i class="la la-check-circle completed-icon"></i>');
                    updateOverallProgress();
                }
                if (data.course_finished) {
                    $('#completionModal').modal('show');
                }
                if (callback) callback(data);
            }
        });
    }

    function updateOverallProgress() {
        const total = $('.content-item').length;
        const completed = $('.completed-icon').length;
        const pct = total > 0 ? Math.round((completed / total) * 100) : 0;
        
        $('#overall-progress-bar').css('width', pct + '%');
        $('#overall-progress-pct').text(pct);
    }

    // Quiz Handlers
    $(document).on('submit', '#quiz-form', function(e) {
        e.preventDefault();
        const formData = $(this).serialize();
        $('#submit-quiz-btn').prop('disabled', true).html('<i class="la la-spinner la-spin"></i> Submitting...');
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
            <div class="content-info text-center py-5">
                <div class="mb-4">
                    <i class="la ${data.is_pass ? 'la-trophy text-success' : 'la-times-circle text-danger'}" style="font-size: 80px;"></i>
                </div>
                <h3 class="font-weight-bold ${data.is_pass ? 'text-success' : 'text-danger'}">${data.is_pass ? 'Congratulations, You Passed!' : 'Better Luck Next Time!'}</h3>
                <div class="display-3 font-weight-bold my-4">${data.score}%</div>
                
                <div class="d-flex justify-content-center gap-3 mb-5">
                    <button class="btn theme-btn" onclick="loadContent('quiz', '${currentLectureId || data.quiz_id || ''}')">Review Answers</button>
                    ${!data.is_pass ? `<button class="btn btn-outline-primary" onclick="loadContent('quiz', '${currentLectureId || data.quiz_id || ''}')">Try Again</button>` : ''}
                </div>
            </div>
        `;
         
        $('#content-display-area').html(html);
        if (data.is_pass) {
            const item = $(`.content-item.active[data-type="quiz"]`);
            if (item.find('.completed-icon').length === 0) {
                item.find('.completion-status').html('<i class="la la-check-circle completed-icon"></i>');
                updateOverallProgress();
            }
        }
        if (data.course_finished) $('#completionModal').modal('show');
    }
</script>
@endpush
