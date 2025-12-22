@if($wishlist->count() > 0)
    @foreach($wishlist as $item)
    <div class="col-lg-4 responsive-column-half">
        <div class="card card-item border-0 shadow-sm">
            <div class="card-image">
                <a href="{{ route('course-details', $item->course->course_name_slug) }}" class="d-block">
                    <img class="card-img-top lazy" src="{{ asset($item->course->course_image) }}" alt="Course Image">
                </a>
                <div class="course-badge-labels">
                    @if($item->course->bestseller == 'yes')
                        <div class="course-badge">Bestseller</div>
                    @endif
                    @if($item->course->featured == 'yes')
                        <div class="course-badge sky-blue">Featured</div>
                    @endif
                </div>
            </div><!-- end card-image -->
            <div class="card-body">
                <h6 class="ripple-above"><a href="{{ route('course-details', $item->course->course_name_slug) }}">{{ $item->course->course_name }}</a></h6>
                <p class="card-text pt-1 fs-14 lh-22">By <a href="#">{{ $item->course->user->name }}</a></p>
                <div class="d-flex justify-content-between align-items-center pt-3">
                    <p class="text-black font-weight-semi-bold fs-18">${{ number_format($item->course->discount_price, 2) }}</p>
                    <button class="btn theme-btn theme-btn-sm remove-wishlist" data-id="{{ $item->id }}" title="Remove from wishlist">
                        <i class="la la-trash"></i>
                    </button>
                </div>
            </div><!-- end card-body -->
        </div><!-- end card -->
    </div><!-- end col-lg-4 -->
    @endforeach
@else
    <div class="col-lg-12 text-center py-5">
        <div class="icon-element mx-auto mb-4" style="width: 80px; height: 80px;">
            <i class="la la-heart-o fs-40"></i>
        </div>
        <h3 class="fs-22 font-weight-semi-bold">Your wishlist is empty.</h3>
        <p class="pt-2">Start adding courses you're interested in.</p>
        <a href="/" class="btn theme-btn mt-4">Browse Courses</a>
    </div>
@endif
