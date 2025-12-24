<div class="course-overview-card">
    <h3 class="fs-24 font-weight-semi-bold pb-3">Description</h3>

    <!-- Truncated Description -->
    <div  class="">
        {!! $course->description !!}
    </div>


</div>


<div class="course-overview-card">
    <div class="curriculum-header d-flex align-items-center justify-content-between pb-4">
        <h3 class="fs-24 font-weight-semi-bold">Course content</h3>
        <div class="curriculum-duration fs-15">
            <span class="curriculum-total__text mr-2">
                <strong class="text-black font-weight-semi-bold">Total:</strong> 
                {{ $course->lectures->count() }} lectures | 
                {{ $course->quizzes->count() }} quizzes | 
                {{ $course->materials->count() }} materials
            </span>
        </div>
    </div>
    <div class="curriculum-content">
        <div id="accordion" class="generic-accordion">

            @foreach ($course_content as $index => $item)
            <div class="card">
                <div class="card-header" id="heading-{{ $index }}">
                    <button
                        class="btn btn-link d-flex align-items-center justify-content-between"
                        data-toggle="collapse" data-target="#collapse-{{ $index }}"
                        aria-expanded="{{ $index == 0 ? 'true' : 'false' }}"
                        aria-controls="collapse-{{ $index }}">
                        <i class="la la-plus"></i>
                        <i class="la la-minus"></i>
                        {{ $item->section_title }}
                        <span class="fs-15 text-gray font-weight-medium">
                            {{ $item->lectures->count() }} L | 
                            {{ $item->quizzes->count() }} Q | 
                            {{ $item->materials->count() }} M
                        </span>
                    </button>
                </div><!-- end card-header -->
                <div id="collapse-{{ $index }}"
                    class="collapse {{ $index == 0 ? 'show' : '' }}"
                    aria-labelledby="heading-{{ $index }}" data-parent="#accordion">
                    <div class="card-body">
                        <ul class="generic-list-item">

                            @foreach ($item->lectures as $lecture)
                                <li>
                                    <div class="d-flex align-items-center justify-content-between text-color">
                                        <span>
                                            <i class="la la-play-circle mr-1"></i>
                                            {{ $lecture->lecture_title }}
                                            @if($lecture->is_live)
                                                <span class="badge badge-danger ml-1">Live class</span>
                                            @endif
                                            @if($lecture->is_free)
                                                <span class="badge badge-success ml-1">Free Preview</span>
                                            @endif
                                        </span>
                                        <span>{{$lecture->video_duration}}</span>
                                    </div>
                                </li>
                            @endforeach

                            @foreach ($item->quizzes as $quiz)
                                <li>
                                    <div class="d-flex align-items-center justify-content-between text-color">
                                        <span>
                                            <i class="la la-question mr-1"></i>
                                            Quiz: {{ $quiz->quiz_title }}
                                        </span>
                                        <span>{{ $quiz->questions->count() }} Questions</span>
                                    </div>
                                </li>
                            @endforeach

                            @foreach ($item->materials as $material)
                                <li>
                                    <div class="d-flex align-items-center justify-content-between text-color">
                                        <span>
                                            <i class="la la-file-text mr-1"></i>
                                            Resource: {{ $material->material_title }}
                                        </span>
                                        <span class="badge badge-info">{{ strtoupper($material->type) }}</span>
                                    </div>
                                </li>
                            @endforeach

                        </ul>
                    </div><!-- end card-body -->
                </div><!-- end collapse -->
            </div><!-- end card -->
            @endforeach
        
        </div><!-- end generic-accordion -->
    </div><!-- end curriculum-content -->
</div><!-- end course-overview-card -->
