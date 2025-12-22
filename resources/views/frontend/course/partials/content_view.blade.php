<div class="content-card">
@if($type === 'lecture')
    <div class="video-wrapper">
        @if($content->video_url)
             <video width="100%" height="auto" controls controlsList="nodownload" id="courseVideo">
                  <source src="{{ asset($content->video_url) }}" type="video/mp4">
                  Your browser does not support the video tag.
            </video>
        @else
            <div class="d-flex align-items-center justify-content-center h-100 bg-dark text-white">
                <div class="text-center">
                    <i class="la la-video-slash fs-45 mb-2"></i>
                    <p>No video available for this lecture.</p>
                </div>
            </div>
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
