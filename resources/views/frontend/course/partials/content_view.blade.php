<div class="content-card bg-transparent shadow-none border-0">
@if($type === 'lecture')
    @if($content->is_live)
        <div class="live-class-ui-wrapper mb-4 overflow-hidden rounded-4 shadow-lg position-relative bg-dark text-white">
            <!-- Background Decoration -->
            <div style="position: absolute; top: -50px; right: -50px; width: 200px; height: 200px; background: rgba(99, 102, 241, 0.3); border-radius: 50%; filter: blur(60px); z-index: 1;"></div>
            <div style="position: absolute; bottom: -30px; left: -30px; width: 150px; height: 150px; background: rgba(236, 72, 153, 0.3); border-radius: 50%; filter: blur(50px); z-index: 1;"></div>
            
            <div class="p-5 text-center position-relative" style="z-index: 2;">
                <div class="mb-4 d-inline-block">
                    <div class="live-indicator p-2 px-3 rounded-pill bg-danger shadow-sm d-flex align-items-center gap-2" style="animation: pulse-red 2s infinite;">
                        <span class="bg-white rounded-circle" style="width: 8px; height: 8px;"></span>
                        <span class="text-white fw-bold small text-uppercase ls-1">Live Session</span>
                    </div>
                </div>

                <h2 class="fw-bold mb-3 display-6">Interactive Live Learning</h2>
                
                @if($content->live_date && $content->live_time)
                    @php
                        $scheduledAt = \Carbon\Carbon::parse($content->live_date . ' ' . $content->live_time);
                        $isFuture = $scheduledAt->isFuture();
                    @endphp

                    @if($isFuture)
                            <div id="countdown-wrapper" class="mb-5">
                                <p class="text-light opacity-75 mb-3 small text-uppercase ls-1">Starts in:</p>
                                <div class="d-flex justify-content-center gap-3">
                                    <div class="bg-white bg-opacity-10 p-3 rounded-3" style="min-width: 80px;">
                                        <span id="days" class="d-block h3 fw-bold mb-0">00</span>
                                        <small class="small text-white-50">DAYS</small>
                                    </div>
                                    <div class="bg-white bg-opacity-10 p-3 rounded-3" style="min-width: 80px;">
                                        <span id="hours" class="d-block h3 fw-bold mb-0">00</span>
                                        <small class="small text-white-50">HOURS</small>
                                    </div>
                                    <div class="bg-white bg-opacity-10 p-3 rounded-3" style="min-width: 80px;">
                                        <span id="minutes" class="d-block h3 fw-bold mb-0">00</span>
                                        <small class="small text-white-50">MINS</small>
                                    </div>
                                    <div class="bg-white bg-opacity-10 p-3 rounded-3" style="min-width: 80px;">
                                        <span id="seconds" class="d-block h3 fw-bold mb-0">00</span>
                                        <small class="small text-white-50">SECS</small>
                                    </div>
                                </div>
                            </div>
                    @endif
                @endif

                <p class="text-light opacity-75 mb-5 mx-auto lead" style="max-width: 600px;">Join our expert-led session to engage, ask questions, and master your skills in real-time.</p>
                
                <div class="bg-white bg-opacity-10 mb-5 p-4 rounded-4 border border-light border-opacity-10 mx-auto nav-glass" style="max-width: 500px;">
                    <div class="row align-items-center">
                        @if($content->live_id)
                        <div class="col-6 border-end border-light border-opacity-25">
                            <small class="text-white-50 d-block small text-uppercase mb-1">Meeting ID</small>
                            <span class="fw-bold fs-5 ls-1">{{ $content->live_id }}</span>
                        </div>
                        @endif
                        @if($content->live_password)
                        <div class="col-6">
                            <small class="text-white-50 d-block small text-uppercase mb-1">Password</small>
                            <span class="fw-bold fs-5 ls-1">{{ $content->live_password }}</span>
                        </div>
                        @endif
                    </div>
                </div>

                <div class="d-flex flex-wrap justify-content-center gap-3">
                    @if(isset($scheduledAt) && $scheduledAt->isFuture())
                        <button class="btn btn-primary btn-lg px-5 rounded-pill fw-bold shadow-lg opacity-50" disabled>
                            <i class="bi bi-clock me-2"></i> Waiting for Start Time
                        </button>
                    @else
                        <a href="{{ $content->live_link }}" target="_blank" class="btn btn-primary btn-lg px-5 rounded-pill fw-bold shadow-lg hover-scale">
                            <i class="bi bi-camera-video-fill me-2"></i> Launch Meeting
                        </a>
                    @endif
                    
                    @if(isset($scheduledAt))
                         @php
                            $start = $scheduledAt->format('Ymd\THis');
                            $end = $scheduledAt->addHour()->format('Ymd\THis');
                            $calText = urlencode($course->course_name . ' - ' . $content->lecture_title . ' (Live Class)');
                            $calDetails = urlencode('Join the live class session for ' . $content->lecture_title . '. Meeting ID: ' . $content->live_id);
                            $googleCalUrl = "https://www.google.com/calendar/render?action=TEMPLATE&text={$calText}&dates={$start}/{$end}&details={$calDetails}&location=" . urlencode($content->live_link);
                        @endphp
                        <a href="{{ $googleCalUrl }}" target="_blank" class="btn btn-outline-light btn-lg px-5 rounded-pill fw-bold hover-scale">
                            <i class="bi bi-calendar-plus-fill me-2"></i> Add to Calendar
                        </a>
                    @endif
                </div>

                @if(isset($scheduledAt))
                <script>
                    (function() {
                        const targetDate = new Date("{{ $scheduledAt->toIso8601String() }}").getTime();
                        function updateCountdown() {
                            const now = new Date().getTime();
                            const distance = targetDate - now;
                            if (distance < 0) { location.reload(); return; }
                            const days = Math.floor(distance / (1000 * 60 * 60 * 24));
                            const hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
                            const minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
                            const seconds = Math.floor((distance % (1000 * 60)) / 1000);
                            
                            ['days','hours','minutes','seconds'].forEach((id, idx) => {
                                const val = [days, hours, minutes, seconds][idx];
                                const el = document.getElementById(id);
                                if(el) el.innerText = val.toString().padStart(2, '0');
                            });
                        }
                        if(document.getElementById("countdown-wrapper")) {
                            setInterval(updateCountdown, 1000);
                            updateCountdown();
                        }
                    })();
                </script>
                @endif
                
                <div class="mt-4">
                    <span class="text-white-50 small"><i class="bi bi-info-circle me-1"></i> Supports Zoom, Google Meet & Microsoft Teams</span>
                </div>
            </div>
        </div>
        
        <style>
             @keyframes pulse-red {
                0% { box-shadow: 0 0 0 0 rgba(220, 38, 38, 0.4); }
                70% { box-shadow: 0 0 0 10px rgba(220, 38, 38, 0); }
                100% { box-shadow: 0 0 0 0 rgba(220, 38, 38, 0); }
            }
            .hover-scale:hover { transform: scale(1.05); transition: transform 0.2s; }
            .nav-glass { backdrop-filter: blur(10px); }
        </style>
    @endif

    <div class="video-container shadow-lg rounded-4 overflow-hidden mb-4">
        @if($content->url)
            @php
                $videoId = null;
                if(preg_match('%(?:youtube(?:-nocookie)?\.com/(?:[^/]+/.+/|(?:v|e(?:mbed)?)/|.*[?&]v=)|youtu\.be/)([^"&?/ ]{11})%i', $content->url, $match)) {
                    $videoId = $match[1];
                }
            @endphp
            @if($videoId)
                <iframe src="https://www.youtube.com/embed/{{ $videoId }}" 
                    title="YouTube video player" frameborder="0" 
                    allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" 
                    allowfullscreen></iframe>
            @else
                <div class="d-flex align-items-center justify-content-center h-100 bg-dark text-white">
                    <div class="text-center">
                        <i class="bi bi-camera-video-off display-1 mb-3"></i>
                        <p>Invalid Video URL structure.</p>
                    </div>
                </div>
            @endif
        @elseif($content->video_url)
             <video width="100%" height="auto" controls controlsList="nodownload" id="courseVideo" class="w-100 h-100 object-fit-cover">
                  <source src="{{ asset($content->video_url) }}" type="video/mp4">
                  Your browser does not support the video tag.
            </video>
        @else
            @if(!$content->is_live)
            <div class="d-flex align-items-center justify-content-center h-100 bg-dark text-white">
                <div class="text-center">
                    <i class="bi bi-camera-video-off display-1 mb-3"></i>
                    <p>No video available for this lecture.</p>
                </div>
            </div>
            @endif
        @endif
    </div>

    <div class="content-info">
        <div class="d-flex justify-content-between align-items-start mb-4">
            <h2 class="fw-bold m-0 text-dark">{{ $content->lecture_title }}</h2>
            <button class="btn btn-theme shadow-sm btn-sm fw-bold px-3 py-2 rounded-pill" id="mark-completed-btn" data-type="lecture" data-id="{{ $content->id }}">
                <i class="bi bi-check-circle me-2"></i> Mark as Completed
            </button>
        </div>
        
        <hr class="border-light-subtle my-4">
        
        <h5 class="fw-bold mb-3 text-dark">About this lecture</h5>
        <div class="text-secondary lh-lg">
            {!! $content->description ?? '<p class="text-muted fst-italic">No description provided.</p>' !!}
        </div>
        
        @if($content->resources)
           <div class="mt-4 p-4 bg-light rounded-4 border border-light-subtle">
               <h6 class="fw-bold mb-3"><i class="bi bi-folder2-open me-2 text-primary"></i> Lecture Resources</h6>
               <!-- Resources Logic Here if applicable -->
           </div>
        @endif
    </div>

@elseif($type === 'quiz')
    <div class="content-info">
        <div class="text-center my-4 fade-in-up" id="quiz-intro">
            <div class="mb-4">
                <i class="bi bi-patch-question-fill text-theme display-1"></i>
            </div>
            <h2 class="fw-bold text-dark">{{ $content->quiz_title }}</h2>
            <p class="text-secondary mb-5 px-lg-5 col-lg-8 mx-auto">{{ $content->description }}</p>
            
            <div class="row justify-content-center g-3 mb-5">
                 <div class="col-4 col-md-3">
                     <div class="p-3 border rounded-3 bg-white shadow-sm h-100">
                        <span class="d-block text-muted small text-uppercase fw-bold mb-1">Questions</span>
                        <strong class="fs-4 text-dark">{{ $content->questions->count() }}</strong>
                     </div>
                 </div>
                 <div class="col-4 col-md-3">
                     <div class="p-3 border rounded-3 bg-white shadow-sm h-100">
                        <span class="d-block text-muted small text-uppercase fw-bold mb-1">Time Limit</span>
                        <strong class="fs-4 text-dark">{{ $content->duration_minutes > 0 ? $content->duration_minutes . 'm' : '∞' }}</strong>
                     </div>
                 </div>
                 <div class="col-4 col-md-3">
                     <div class="p-3 border rounded-3 bg-white shadow-sm h-100">
                        <span class="d-block text-muted small text-uppercase fw-bold mb-1">Pass Mark</span>
                        <strong class="fs-4 text-dark">{{ $content->pass_mark }}%</strong>
                     </div>
                 </div>
            </div>
            
            @if(isset($content->previous_result))
                <div class="alert {{ $content->previous_result->is_pass ? 'alert-success' : 'alert-warning' }} mb-4 d-inline-block px-4 rounded-pill">
                    <i class="bi {{ $content->previous_result->is_pass ? 'bi-check-circle-fill' : 'bi-exclamation-circle-fill' }} me-2"></i>
                    Last Attempt: <strong>{{ $content->previous_result->score }}%</strong> on {{ \Carbon\Carbon::parse($content->previous_result->created_at)->format('d M') }}
                </div>
                <div class="w-100"></div>
            @endif
            
            <button class="btn btn-theme btn-lg px-5 rounded-pill shadow fw-bold hover-scale" id="start-quiz-btn" data-duration="{{ $content->duration_minutes }}">
                <i class="bi bi-play-circle-fill me-2"></i> {{ isset($content->previous_result) ? 'Retake Quiz' : 'Start Quiz' }}
            </button>
        </div>

        <div id="quiz-questions-area" style="display:none;">
            <div class="d-flex justify-content-between align-items-center mb-4 py-3 border-bottom sticky-top bg-white z-index-10">
                <h4 class="m-0 fw-bold text-dark">Quiz in Progress</h4>
                @if($content->duration_minutes > 0)
                    <div class="badge bg-danger p-2 px-3 fs-6 rounded-pill shadow-sm">
                        <i class="bi bi-stopwatch me-1"></i> <span id="timer-clock">00:00</span>
                    </div>
                @endif
            </div>
            
            <form id="quiz-form">
                @csrf
                <input type="hidden" name="quiz_id" value="{{ $content->id }}">
                <input type="hidden" name="course_id" value="{{ $content->course_id }}">
                
                @foreach($content->questions as $index => $q)
                <div class="card mb-4 border-0 shadow-sm rounded-4 overflow-hidden">
                     <div class="card-header bg-light py-3 border-bottom border-light-subtle">
                         <div class="d-flex align-items-center gap-2">
                             <span class="badge bg-theme rounded-pill">Q{{ $index + 1 }}</span>
                             <span class="fw-bold text-dark">Select the best answer</span>
                         </div>
                         <p class="mt-3 mb-1 fs-5 text-dark fw-medium lh-base">{{ $q->question_text }}</p>
                     </div>
                     <div class="card-body p-4 bg-white">
                         <div class="d-flex flex-column gap-3">
                             @foreach(['a','b','c','d'] as $opt)
                             <div class="form-check custom-option">
                                 <input type="radio" id="q{{$q->id}}{{$opt}}" name="answers[{{ $q->id }}]" value="{{$opt}}" class="form-check-input hidden-radio">
                                 <label class="form-check-label w-100 p-3 border rounded-3 cursor-pointer d-flex align-items-center transition-all" for="q{{$q->id}}{{$opt}}">
                                     <span class="fw-bold me-3 text-secondary text-uppercase">{{ $opt }}.</span> 
                                     <span class="text-dark">{{ $q->{'option_'.$opt} }}</span>
                                 </label>
                             </div>
                             @endforeach
                         </div>
                     </div>
                </div>
                @endforeach
                
                <div class="text-center mt-5 mb-5">
                    <button type="submit" class="btn btn-theme btn-lg px-5 rounded-pill shadow fw-bold hover-scale" id="submit-quiz-btn">
                        <i class="bi bi-send-fill me-2"></i> Submit My Answers
                    </button>
                </div>
            </form>
            
            <style>
                .hidden-radio { position: absolute; opacity: 0; }
                .custom-option label:hover { background-color: #f8f9fa; border-color: var(--theme-color, #5b50d6) !important; }
                .custom-option input:checked + label {
                    background-color: rgba(91, 80, 214, 0.05);
                    border-color: var(--theme-color, #5b50d6) !important;
                    box-shadow: 0 0 0 4px rgba(91, 80, 214, 0.1);
                }
                .custom-option input:checked + label .fw-bold { color: var(--theme-color, #5b50d6) !important; }
            </style>
        </div>
    </div>

@elseif($type === 'material')
    <div class="content-info text-center py-5 fade-in-up">
         <div class="mb-4">
             <div class="mx-auto bg-primary bg-opacity-10 text-primary rounded-circle d-flex align-items-center justify-content-center" style="width: 120px; height:120px;">
                 <i class="bi bi-cloud-arrow-down-fill display-3"></i>
             </div>
         </div>
         <h2 class="fw-bold mb-2 text-dark">{{ $content->material_title }}</h2>
         <p class="text-muted mb-5">Course Resource Attachment</p>
         
         <div class="p-5 bg-white rounded-4 shadow-sm border border-light-subtle mb-5 mx-auto" style="max-width: 600px;">
             @if($content->type == 'pdf' || $content->type == 'file')
                <h5 class="fw-bold mb-4 text-dark">Downloadable Document</h5>
                <a href="{{ asset($content->file_path) }}" class="btn btn-theme btn-lg rounded-pill px-5 shadow-sm hover-scale" download>
                    <i class="bi bi-file-earmark-arrow-down-fill me-2"></i> Download Now
                </a>
             @elseif($content->type == 'link')
                  <h5 class="fw-bold mb-4 text-dark">External Reference Link</h5>
                  <a href="{{ $content->external_url }}" target="_blank" class="btn btn-theme btn-lg rounded-pill px-5 shadow-sm hover-scale">
                      <i class="bi bi-box-arrow-up-right me-2"></i> Open Resource
                  </a>
             @endif
         </div>

         <button class="btn btn-outline-success rounded-pill px-4 fw-bold" id="mark-completed-btn" data-type="material" data-id="{{ $content->id }}">
            <i class="bi bi-check-circle me-2"></i> Mark as Completed
        </button>
    </div>
@endif
</div>
