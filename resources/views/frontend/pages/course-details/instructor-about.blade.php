<div class="course-overview-card pt-4">
    <h3 class="fs-24 font-weight-semi-bold pb-4">About the instructor</h3>
    <div class="instructor-wrap">
        <div class="media media-card">
            <div class="instructor-img">
                <a href="teacher-detail.html" class="media-img d-block">
                    <img class="lazy" src="{{ $course['user']['photo'] }}"
                        data-src="{{ $course['user']['photo'] }}" alt="Avatar image">
                </a>
                @php
                    $instructor = $course->user;
                    $courses = $instructor->courses;
                    $course_ids = $courses->pluck('id');
                    $total_students = App\Models\Enrollment::whereIn('course_id', $course_ids)->count();
                    $total_reviews = App\Models\Review::whereIn('course_id', $course_ids)->where('status', 1)->count();
                    $avg_rating = App\Models\Review::whereIn('course_id', $course_ids)->where('status', 1)->avg('rating');
                    $instructor_rating = $avg_rating > 0 ? round($avg_rating, 1) : '0.0';
                @endphp
                <ul class="generic-list-item pt-3">
                    <li><i class="la la-star mr-2 text-color-3"></i> {{ $instructor_rating }} Instructor Rating</li>
                    <li><i class="la la-student mr-2 text-color-3"></i> {{ $total_students }} Students</li>
                    <li><i class="la la-comment-o mr-2 text-color-3"></i> {{ $total_reviews }} Reviews</li>
                    <li><i class="la la-play-circle-o mr-2 text-color-3"></i> {{ $courses->count() }} Courses</li>
                </ul>
            </div><!-- end instructor-img -->
            <div class="media-body">
                <h5><a href="#">{{ $course['user']['name'] }}</a></h5>

                <div class="bio-collapsible">
                    {!! $course['user']['bio'] !!}

                </div>







            </div>
        </div>
    </div><!-- end instructor-wrap -->
</div><!-- end course-overview-card -->
