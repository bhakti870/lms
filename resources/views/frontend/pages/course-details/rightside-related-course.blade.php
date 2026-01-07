<div class="card card-item">
    <div class="card-body">
        <h3 class="card-title fs-18 pb-2">Related Courses</h3>
        <div class="divider"><span></span></div>
        @php
          $related_course = \App\Models\Course::where('subcategory_id', $course->subcategory_id)->take(3)->get();

        @endphp

        @foreach($related_course as $item)
        <div class="media media-card border-bottom border-bottom-gray pb-4 mb-4">
            <a href="{{ route('course-details', $item->course_name_slug) }}" class="media-img">
                <img class="card-img-top lazy" src="{{ asset($item->course_image) }}"
                data-src="{{ asset($item->course_image) }}" alt="Card image cap">
            </a>
            <div class="media-body">
                <h5 class="fs-15"><a href="{{ route('course-details', $item->course_name_slug) }}">{{ $item->course_name }}</a></h5>
                <span class="d-block lh-18 py-1 fs-14">{{ $item->user->name }}</span>
                <p class="text-black font-weight-semi-bold lh-18 fs-15">
                    @if($item->discount_price)
                        ₹{{ $item->discount_price }} <span class="before-price fs-14">₹{{ $item->selling_price }}</span>
                    @else
                        ₹{{ $item->selling_price }}
                    @endif
                </p>
            </div>
        </div><!-- end media -->
        @endforeach

        <div class="view-all-course-btn-box">
            <a href="{{ route('all.courses') }}" class="btn theme-btn w-100">View All Courses <i
                    class="la la-arrow-right icon ml-1"></i></a>
        </div>
    </div>
</div><!-- end card -->
