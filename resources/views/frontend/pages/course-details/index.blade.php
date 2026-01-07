@extends('frontend.master')

@section('content')


    @include('frontend.pages.course-details.breadcrumb')

    <!--======================================
        START COURSE DETAILS AREA
======================================-->
    <section class="course-details-area pb-20px">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 pb-5">
                    <div class="course-details-content-wrap pt-4">

                        @include('frontend.pages.course-details.learn-section')


                        @include('frontend.pages.course-details.course-content')

                        @include('frontend.pages.course-details.review-form')

                    </div><!-- end course-details-content-wrap -->
                </div><!-- end col-lg-8 -->

                @include('frontend.pages.course-details.right-sidebar')

            </div><!-- end row -->
        </div><!-- end container -->
    </section><!-- end course-details-area -->

    <!--======================================
        START FULL WIDTH TABS AREA
    ======================================-->
    <section class="course-dashboard-area pb-5 bg-light-subtle position-relative z-index-1">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    {{-- Tab Navigation --}}
                    <div class="course-tabs shadow-sm p-4 bg-white rounded-4 border">
                        <ul class="nav nav-pills mb-4 nav-justified bg-light rounded-pill p-2" id="pills-tab" role="tablist">
                            <li class="nav-item" role="presentation">
                                <button class="nav-link active rounded-pill fw-bold text-uppercase ls-1" id="pills-instructor-tab" data-bs-toggle="pill" data-bs-target="#pills-instructor" type="button" role="tab" aria-controls="pills-instructor" aria-selected="true">
                                    <i class="bi bi-person-video3 me-2"></i> Instructor
                                </button>
                            </li>
                            <li class="nav-item" role="presentation">
                                <button class="nav-link rounded-pill fw-bold text-uppercase ls-1" id="pills-reviews-tab" data-bs-toggle="pill" data-bs-target="#pills-reviews" type="button" role="tab" aria-controls="pills-reviews" aria-selected="false">
                                    <i class="bi bi-star-fill me-2"></i> Reviews
                                </button>
                            </li>
                            <li class="nav-item" role="presentation">
                                <button class="nav-link rounded-pill fw-bold text-uppercase ls-1" id="pills-related-tab" data-bs-toggle="pill" data-bs-target="#pills-related" type="button" role="tab" aria-controls="pills-related" aria-selected="false">
                                    <i class="bi bi-collection-play-fill me-2"></i> Similar Courses
                                </button>
                            </li>
                        </ul>
                        
                        <div class="tab-content pt-2" id="pills-tabContent">
                            {{-- Instructor Tab --}}
                            <div class="tab-pane fade show active" id="pills-instructor" role="tabpanel" aria-labelledby="pills-instructor-tab" tabindex="0">
                                @include('frontend.pages.course-details.instructor-about')
                            </div>
                            
                            {{-- Reviews Tab --}}
                            <div class="tab-pane fade" id="pills-reviews" role="tabpanel" aria-labelledby="pills-reviews-tab" tabindex="0">
                                <div class="row">
                                    <div class="col-lg-12">
                                        @include('frontend.pages.course-details.student-feedback')
                                        <hr class="my-5 border-light-subtle">
                                        @include('frontend.pages.course-details.review')
                                    </div>
                                </div>
                            </div>
                            
                            {{-- Related/Similar Tab --}}
                            <div class="tab-pane fade" id="pills-related" role="tabpanel" aria-labelledby="pills-related-tab" tabindex="0">
                                @include('frontend.pages.course-details.student-bought')
                                <div class="mt-5">
                                    @include('frontend.pages.course-details.related-course')
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Modal -->
    @include('frontend.pages.course-details.course-preview-modal')




    @include('frontend.pages.course-details.become-teacher')




    <div class="section-block"></div>






@endsection

@push('scripts')




@endpush
