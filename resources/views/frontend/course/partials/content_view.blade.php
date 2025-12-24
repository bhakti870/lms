<div class="content-card">
@if($type === 'lecture')
    @if($content->is_live)
        <div class="live-class-ui-wrapper mb-4 overflow-hidden rounded-20 shadow-lg" style="background: #0f172a; position: relative;">
            <!-- Background Decoration -->
            <div style="position: absolute; top: -50px; right: -50px; width: 200px; height: 200px; background: rgba(99, 102, 241, 0.2); border-radius: 50%; filter: blur(60px); z-index: 1;"></div>
            <div style="position: absolute; bottom: -30px; left: -30px; width: 150px; height: 150px; background: rgba(236, 72, 153, 0.2); border-radius: 50%; filter: blur(50px); z-index: 1;"></div>
            
            <div class="p-5 text-center position-relative" style="z-index: 2;">
                <div class="mb-4 d-inline-block">
                    <div class="live-indicator p-1 px-3 rounded-pill bg-danger shadow-sm d-flex align-items-center gap-2" style="animation: pulse-red 2s infinite;">
                        <span style="width: 8px; height: 8px; background: white; border-radius: 50%;"></span>
                        <span class="text-white fw-bold fs-12 letter-spacing-1">LIVE SESSION</span>
                    </div>
                </div>

                <h2 class="text-white fw-800 mb-3 fs-32">Interactive Live Learning</h2>
                
                @if($content->live_date && $content->live_time)
                    @php
                        $scheduledAt = \Carbon\Carbon::parse($content->live_date . ' ' . $content->live_time);
                        $isFuture = $scheduledAt->isFuture();
                    @endphp

                    @if($isFuture)
                        <div id="countdown-wrapper" class="mb-5">
                            <p class="text-blue-200 fs-14 mb-3 opacity-80">Starts in:</p>
                            <div class="d-flex justify-content-center gap-3">
                                <div class="countdown-item bg-glass p-3 rounded-lg text-white" style="min-width: 70px;">
                                    <span id="days" class="d-block fs-24 fw-bold">00</span>
                                    <small class="fs-10 opacity-70">DAYS</small>
                                </div>
                                <div class="countdown-item bg-glass p-3 rounded-lg text-white" style="min-width: 70px;">
                                    <span id="hours" class="d-block fs-24 fw-bold">00</span>
                                    <small class="fs-10 opacity-70">HOURS</small>
                                </div>
                                <div class="countdown-item bg-glass p-3 rounded-lg text-white" style="min-width: 70px;">
                                    <span id="minutes" class="d-block fs-24 fw-bold">00</span>
                                    <small class="fs-10 opacity-70">MINS</small>
                                </div>
                                <div class="countdown-item bg-glass p-3 rounded-lg text-white" style="min-width: 70px;">
                                    <span id="seconds" class="d-block fs-24 fw-bold">00</span>
                                    <small class="fs-10 opacity-70">SECS</small>
                                </div>
                            </div>
                        </div>
                    @endif
                @endif

                <p class="text-blue-200 fs-16 mb-5 opacity-80 mx-auto" style="max-width: 500px;">Join our expert-led session to engage, ask questions, and master your skills in real-time.</p>
                
                <div class="meeting-card bg-glass mb-5 p-4 rounded-xl border border-white-10 mx-auto" style="max-width: 450px; background: rgba(255,255,255,0.05); backdrop-filter: blur(10px);">
                    <div class="row align-items-center">
                        @if($content->live_id)
                        <div class="col-6 border-end border-white-10">
                            <small class="text-white-50 d-block fs-11 text-uppercase mb-1">Meeting ID</small>
                            <span class="text-white fw-bold fs-18 letter-spacing-1">{{ $content->live_id }}</span>
                        </div>
                        @endif
                        @if($content->live_password)
                        <div class="col-6">
                            <small class="text-white-50 d-block fs-11 text-uppercase mb-1">Password</small>
                            <span class="text-white fw-bold fs-18 letter-spacing-1">{{ $content->live_password }}</span>
                        </div>
                        @endif
                    </div>
                </div>

                <div class="action-btn-wrapper d-flex flex-wrap justify-content-center gap-3">
                    @if(isset($scheduledAt) && $scheduledAt->isFuture())
                        <button class="btn btn-premium-gradient btn-lg px-5 py-3 rounded-pill fw-bold shadow-xl opacity-50" disabled>
                            <i class="la la-clock me-2 fs-20"></i> Waiting for Start Time
                        </button>
                    @else
                        <a href="{{ $content->live_link }}" target="_blank" class="btn btn-premium-gradient btn-lg px-5 py-3 rounded-pill fw-bold shadow-xl hover-translate-y">
                            <i class="la la-external-link-alt me-2 fs-20"></i> Launch Meeting Room
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
                        <a href="{{ $googleCalUrl }}" target="_blank" class="btn btn-premium-calendar btn-lg px-4 py-3 rounded-pill fw-bold shadow-xl hover-translate-y">
                            <i class="la la-calendar-plus me-2 fs-20"></i> Add to Calendar
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

                            if (distance < 0) {
                                // Reload to show Join button when time is up
                                location.reload();
                                return;
                            }

                            const days = Math.floor(distance / (1000 * 60 * 60 * 24));
                            const hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
                            const minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
                            const seconds = Math.floor((distance % (1000 * 60)) / 1000);

                            const dEl = document.getElementById("days");
                            const hEl = document.getElementById("hours");
                            const mEl = document.getElementById("minutes");
                            const sEl = document.getElementById("seconds");

                            if(dEl) dEl.innerText = days.toString().padStart(2, '0');
                            if(hEl) hEl.innerText = hours.toString().padStart(2, '0');
                            if(mEl) mEl.innerText = minutes.toString().padStart(2, '0');
                            if(sEl) sEl.innerText = seconds.toString().padStart(2, '0');
                        }

                        if(document.getElementById("countdown-wrapper")) {
                            setInterval(updateCountdown, 1000);
                            updateCountdown();
                        }
                    })();
                </script>
                @endif
                
                <div class="mt-4">
                    <span class="text-white-50 fs-12"><i class="la la-info-circle me-1"></i> Supports Zoom, Google Meet & Microsoft Teams</span>
                </div>
            </div>
        </div>

        <style>
            .shadow-xs { box-shadow: 0 2px 4px rgba(0,0,0,0.02); }
            @keyframes fadeIn { from { opacity: 0; transform: translateY(10px); } to { opacity: 1; transform: translateY(0); } }
        </style>

        <style>
            .rounded-20 { border-radius: 20px; }
            .rounded-xl { border-radius: 12px; }
            .letter-spacing-1 { letter-spacing: 1px; }
            .fw-800 { font-weight: 800; }
            .bg-glass { background: rgba(255, 255, 255, 0.05); backdrop-filter: blur(10px); }
            .border-white-10 { border-color: rgba(255, 255, 255, 0.1) !important; }
            .text-blue-200 { color: #bfdbfe; }
            .btn-premium-gradient {
                background: linear-gradient(135deg, #6366f1 0%, #a855f7 100%);
                color: white !important;
                border: none;
                transition: all 0.3s ease;
            }
            .btn-premium-gradient:hover {
                background: linear-gradient(135deg, #4f46e5 0%, #9333ea 100%);
                transform: translateY(-3px);
                box-shadow: 0 15px 30px rgba(99, 102, 241, 0.4);
            }
            .hover-translate-y:hover { transform: translateY(-3px); }
            
            .btn-premium-calendar {
                background: linear-gradient(135deg, #10b981 0%, #3b82f6 100%);
                color: white !important;
                border: none;
                transition: all 0.3s ease;
            }
            .btn-premium-calendar:hover {
                background: linear-gradient(135deg, #059669 0%, #2563eb 100%);
                transform: translateY(-3px);
                box-shadow: 0 15px 30px rgba(16, 185, 129, 0.4);
            }
            .transition-300 { transition: all 0.3s ease; }
            [aria-expanded="true"] .la-angle-down { transform: rotate(180deg); }
            
            @keyframes pulse-red {
                0% { box-shadow: 0 0 0 0 rgba(220, 38, 38, 0.4); }
                70% { box-shadow: 0 0 0 10px rgba(220, 38, 38, 0); }
                100% { box-shadow: 0 0 0 0 rgba(220, 38, 38, 0); }
            }
        </style>
    @endif

    <div class="video-wrapper">
        @if($content->url)
            @php
                $videoId = null;
                if(preg_match('%(?:youtube(?:-nocookie)?\.com/(?:[^/]+/.+/|(?:v|e(?:mbed)?)/|.*[?&]v=)|youtu\.be/)([^"&?/ ]{11})%i', $content->url, $match)) {
                    $videoId = $match[1];
                }
            @endphp
            @if($videoId)
                <iframe width="100%" height="100%" 
                    src="https://www.youtube.com/embed/{{ $videoId }}" 
                    title="YouTube video player" frameborder="0" 
                    allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" 
                    allowfullscreen></iframe>
            @else
                <div class="d-flex align-items-center justify-content-center h-100 bg-dark text-white">
                    <div class="text-center">
                        <i class="la la-video-slash fs-45 mb-2"></i>
                        <p>Invalid Video URL structure.</p>
                    </div>
                </div>
            @endif
        @elseif($content->video_url)
             <video width="100%" height="auto" controls controlsList="nodownload" id="courseVideo">
                  <source src="{{ asset($content->video_url) }}" type="video/mp4">
                  Your browser does not support the video tag.
            </video>
        @else
            @if(!$content->is_live)
            <div class="d-flex align-items-center justify-content-center h-100 bg-dark text-white">
                <div class="text-center">
                    <i class="la la-video-slash fs-45 mb-2"></i>
                    <p>No video available for this lecture.</p>
                </div>
            </div>
            @else
                <div class="d-flex align-items-center justify-content-center h-100 bg-soft-dark text-white">
                    <div class="text-center">
                        <i class="la la-broadcast-tower fs-45 mb-2"></i>
                        <p>Join the Live Class above to participate.</p>
                    </div>
                </div>
            @endif
        @endif
    </div>

    <div class="content-info">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h2 class="fs-24 font-weight-bold m-0">{{ $content->lecture_title }}</h2>
            <button class="mark-read-btn" id="mark-completed-btn" data-type="lecture" data-id="{{ $content->id }}">
                <i class="la la-check-circle fs-20"></i> Mark as Completed
            </button>
        </div>
        
        <div class="divider mb-4"><span></span></div>
        
        <h5 class="font-weight-bold mb-3">About this lecture</h5>
        <div class="text-muted lh-26">
            {!! $content->description ?? 'No description provided.' !!}
        </div>
        
        @if($content->resources)
           <div class="mt-4 p-3 bg-light rounded border">
               <h6 class="font-weight-bold"><i class="la la-file-alt mr-1"></i> Lecture Resources</h6>
               <!-- Add resource links here -->
           </div>
        @endif
    </div>

@elseif($type === 'quiz')
    <div class="content-info">
        <div class="text-center my-4" id="quiz-intro">
            <div class="mb-4">
                <i class="la la-question-circle text-primary" style="font-size: 80px;"></i>
            </div>
            <h2 class="fs-28 font-weight-bold">{{ $content->quiz_title }}</h2>
            <p class="text-muted mb-4 px-lg-5">{{ $content->description }}</p>
            
            <div class="row justify-content-center mb-5">
                 <div class="col-4 col-md-3">
                     <div class="p-3 border rounded bg-white shadow-sm">
                        <span class="d-block text-muted fs-13 text-uppercase">Questions</span>
                        <strong class="fs-18">{{ $content->questions->count() }}</strong>
                     </div>
                 </div>
                 <div class="col-4 col-md-3">
                     <div class="p-3 border rounded bg-white shadow-sm">
                        <span class="d-block text-muted fs-13 text-uppercase">Time Limit</span>
                        <strong class="fs-18">{{ $content->duration_minutes > 0 ? $content->duration_minutes . 'm' : 'None' }}</strong>
                     </div>
                 </div>
                 <div class="col-4 col-md-3">
                     <div class="p-3 border rounded bg-white shadow-sm">
                        <span class="d-block text-muted fs-13 text-uppercase">Pass Mark</span>
                        <strong class="fs-18">{{ $content->pass_mark }}%</strong>
                     </div>
                 </div>
            </div>
            
            @if(isset($content->previous_result))
                <div class="alert {{ $content->previous_result->is_pass ? 'alert-success' : 'alert-warning' }} mb-4">
                    <i class="la {{ $content->previous_result->is_pass ? 'la-check-circle' : 'la-exclamation-circle' }} mr-1"></i>
                    Last Attempt: <strong>{{ $content->previous_result->score }}%</strong> on {{ \Carbon\Carbon::parse($content->previous_result->created_at)->format('d M') }}
                </div>
            @endif
            
            <button class="btn theme-btn btn-lg px-5 shadow-sm" id="start-quiz-btn" data-duration="{{ $content->duration_minutes }}">
                {{ isset($content->previous_result) ? 'Retake Quiz' : 'Start Quiz' }}
            </button>
        </div>

        <div id="quiz-questions-area" style="display:none;">
            <div class="d-flex justify-content-between align-items-center mb-4 py-3 border-bottom sticky-top bg-white">
                <h4 class="m-0 font-weight-bold">Quiz in Progress</h4>
                @if($content->duration_minutes > 0)
                    <div class="badge badge-danger p-3 fs-18 shadow-sm">
                        <i class="la la-clock mr-1"></i> <span id="timer-clock">00:00</span>
                    </div>
                @endif
            </div>
            
            <form id="quiz-form">
                @csrf
                <input type="hidden" name="quiz_id" value="{{ $content->id }}">
                <input type="hidden" name="course_id" value="{{ $content->course_id }}">
                
                @foreach($content->questions as $index => $q)
                <div class="card mb-4 border-radius-10 shadow-sm">
                     <div class="card-header bg-light py-3">
                         <h6 class="m-0 font-weight-bold">Question {{ $index + 1 }}</h6>
                         <p class="mt-2 mb-0 fs-16 text-black lh-22">{{ $q->question_text }}</p>
                     </div>
                     <div class="card-body p-4">
                         @foreach(['a','b','c','d'] as $opt)
                         <div class="custom-control custom-radio mb-3">
                             <input type="radio" id="q{{$q->id}}{{$opt}}" name="answers[{{ $q->id }}]" value="{{$opt}}" class="custom-control-input">
                             <label class="custom-control-label fs-15 w-100 p-2 border rounded hover-bg-light" for="q{{$q->id}}{{$opt}}">
                                 <span class="font-weight-bold mr-2">{{ strtoupper($opt) }}.</span> {{ $q->{'option_'.$opt} }}
                             </label>
                         </div>
                         @endforeach
                     </div>
                </div>
                @endforeach
                
                <div class="text-center mt-5 mb-3">
                    <button type="submit" class="btn theme-btn btn-lg px-5 shadow" id="submit-quiz-btn">Submit My Answers</button>
                </div>
            </form>
        </div>
    </div>

@elseif($type === 'material')
    <div class="content-info text-center py-5">
         <div class="mb-4">
             <div class="icon-box mx-auto bg-primary text-white scale-up" style="width: 100px; height:100px; border-radius: 50%; display:flex; align-items:center; justify-content:center;">
                 <i class="la la-file-download fs-45"></i>
             </div>
         </div>
         <h2 class="fs-28 font-weight-bold mb-2">{{ $content->material_title }}</h2>
         <p class="text-muted mb-4">Course Resource Attachment</p>
         
         <div class="p-4 bg-light rounded border mb-4">
             @if($content->type == 'pdf' || $content->type == 'file')
                <h5 class="mb-3">Downloadable Document</h5>
                <a href="{{ asset($content->file_path) }}" class="btn theme-btn btn-lg" download>
                    <i class="la la-download mr-1"></i> Download Now
                </a>
             @elseif($content->type == 'link')
                  <h5 class="mb-3">External Reference Link</h5>
                  <a href="{{ $content->external_url }}" target="_blank" class="btn theme-btn btn-lg">
                      <i class="la la-external-link mr-1"></i> Open Resource
                  </a>
             @endif
         </div>

         <button class="mark-read-btn mx-auto" id="mark-completed-btn" data-type="material" data-id="{{ $content->id }}">
            <i class="la la-check-circle fs-20"></i> Mark as Completed
        </button>
    </div>
@endif
</div>
