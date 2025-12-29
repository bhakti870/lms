<div class="instructor-wrap py-5">
    <div class="row align-items-center mb-5">
        <div class="col-lg-4">
            <div class="instructor-img-box text-center">
                 <img src="{{ $course->user->photo ? asset($course->user->photo) : asset('uploads/no_image.jpg') }}" alt="{{ $course->user->name }}" class="rounded-circle shadow-lg" style="width: 200px; height: 200px; object-fit: cover;">
                 <div class="mt-3">
                     <h5 class="fw-bold fs-20">{{ $course->user->name }}</h5>
                     <p class="text-secondary small">{{ $course->user->designation ?? 'Instructor' }}</p>
                 </div>
            </div>
        </div>
         <div class="col-lg-8">
             <div class="instructor-content">
                 <h4 class="fw-bold mb-3">About the Instructor</h4>
                 <p class="text-secondary lh-lg mb-4">{{ $course->user->description ?? 'No bio available for this instructor.' }}</p>
                 
                 <div class="d-flex gap-5 border-top pt-4">
                     <div class="text-center">
                         <h3 class="fw-bold text-theme">{{ $course->user->courses->count() }}</h3>
                         <span class="small text-muted text-uppercase">Courses</span>
                     </div>
                     {{-- Placeholder for students --}}
                      <div class="text-center">
                         <h3 class="fw-bold text-theme">500+</h3> 
                         <span class="small text-muted text-uppercase">Students</span>
                     </div>
                 </div>
             </div>
        </div>
    </div>
    
    @if($more_course_instructor->count() > 0)
    <div class="more-courses-section mt-5 pt-5 border-top">
        <h4 class="fw-bold mb-4">More Courses by {{ $course->user->name }}</h4>
        <div class="row">
            @foreach($more_course_instructor as $mCourse)
            <div class="col-lg-4 col-md-6 mb-4">
                 <div class="card card-item card-preview h-100 shadow-sm border-0 rounded-4 overflow-hidden">
                    <div class="card-image position-relative">
                        <a href="{{ route('course-details', $mCourse->course_name_slug) }}" class="d-block">
                             <img class="card-img-top" src="{{ $mCourse->course_image ? asset($mCourse->course_image) : asset('uploads/no_image.jpg') }}" alt="{{ $mCourse->course_name }}" style="height: 180px; object-fit: cover;">
                        </a>
                        <div class="course-badge-labels">
                            @if($mCourse->bestseller == 'yes')
                                <div class="course-badge">Bestseller</div>
                            @endif
                             @if($mCourse->discount_price > 0)
                                @php
                                    $amount = $mCourse->selling_price - $mCourse->discount_price;
                                    $discount = ($amount / $mCourse->selling_price) * 100;
                                @endphp
                                <div class="course-badge blue">-{{ round($discount) }}%</div>
                            @endif
                        </div>
                     </div>
                     <div class="card-body p-3">
                         <h6 class="text-theme fs-12 fw-bold mb-2 text-uppercase">{{ $mCourse->label ?? 'General' }}</h6>
                         <h5 class="card-title fw-bold fs-16 mb-3">
                             <a href="{{ route('course-details', $mCourse->course_name_slug) }}" class="text-decoration-none text-dark">{{ Str::limit($mCourse->course_name, 50) }}</a>
                         </h5>
                         
                         <div class="d-flex justify-content-between align-items-center pt-2 border-top">
                              <p class="card-price text-black fw-bold mb-0">
                                @if($mCourse->discount_price)
                                    ₹{{ $mCourse->discount_price }} <span class="text-muted text-decoration-line-through small fw-normal ms-1">₹{{ $mCourse->selling_price }}</span>
                                @else
                                    ₹{{ $mCourse->selling_price }}
                                @endif
                            </p>
                            <a href="{{ route('course-details', $mCourse->course_name_slug) }}" class="btn btn-sm btn-light rounded-circle"><i class="la la-arrow-right"></i></a>
                         </div>
                     </div>
                 </div>
            </div>
            @endforeach
        </div>
    </div>
    @endif
</div>
