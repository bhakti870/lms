<script src="{{ asset('frontend/js/jquery-3.4.1.min.js') }}"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script src="{{ asset('frontend/new_design/script.js') }}"></script>
<script>
    AOS.init();
</script>

<!-- Keep essential LMS scripts -->
<script src="{{ asset('frontend/js/owl.carousel.min.js') }}"></script>
<script src="{{ asset('frontend/js/fancybox.js') }}"></script>


<script src="{{ asset('frontend/js/jquery-te-1.4.0.min.js') }}"></script>
<script src="{{ asset('frontend/js/jquery.MultiFile.min.js') }}"></script>



<script src="{{ asset('frontend/js/main.js') }}"></script>

<script>
    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });

    var player = new Plyr('#player');
</script>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script>
    @if (session('success'))
        Swal.fire({
            toast: true,
            icon: 'success',
            title: '{{ session('success') }}',
            position: 'top-end',
            showConfirmButton: false,
            timer: 3000,
            timerProgressBar: true,
            customClass: {
                popup: 'colored-toast' 
            },
            background: '#7079e7',
            color: '#ffffff', 
            iconColor: '#ffffff', 
        });
    @endif

    @if (session('error'))
        Swal.fire({
            toast: true,
            icon: 'error',
            title: '{{ session('error') }}',
            position: 'top-end',
            showConfirmButton: false,
            timer: 3000,
            timerProgressBar: true,
            background: '#f27474',
            color: '#ffffff',
            iconColor: '#ffffff',
        });
    @endif

    @if (session('registration_success'))
        Swal.fire({
            icon: 'success',
            title: '<h3 class="mt-2 text-theme">Welcome to SkillPoint! 👋</h3>',
            html: `
                <div class="mb-4 text-center">
                    <p class="fs-18 fw-bold">Your account has been created successfully!</p>
                    <p class="text-muted mt-2">Welcome to our learning community. We're excited to help you achieve your goals.</p>
                </div>
                <div class="card bg-light border-0 rounded-4 p-3 mb-3 text-start">
                    <div class="d-flex align-items-center mb-2">
                        <div class="rounded-circle bg-white shadow-sm p-2 me-3 d-flex align-items-center justify-content-center" style="width: 45px; height: 45px;">
                            <i class="bi bi-rocket-takeoff text-theme fs-4"></i>
                        </div>
                        <div>
                            <h6 class="mb-0 fw-bold">Let's Get Started</h6>
                            <p class="small text-muted mb-0">Browse our courses and start your journey.</p>
                        </div>
                    </div>
                </div>
            `,
            showConfirmButton: true,
            confirmButtonText: 'Browse Courses',
            confirmButtonColor: '#7079e7',
            timer: 10000,
            timerProgressBar: true,
        });
    @endif

    @if (session('login_success'))
        Swal.fire({
            toast: true,
            icon: 'success',
            title: '{{ session('login_success') }}',
            position: 'top-end',
            showConfirmButton: false,
            timer: 4000,
            timerProgressBar: true,
            background: '#7079e7',
            color: '#ffffff',
            iconColor: '#ffffff',
        });
    @endif

    @if (session('purchase_success'))
        Swal.fire({
            icon: 'success',
            title: '<h3 class="mt-2">Congratulations!</h3>',
            html: `
                <div class="mb-4">
                    <p class="fs-18">You have successfully purchased this course 🎉</p>
                    <p class="pt-2 text-muted">Now you can:</p>
                </div>
                <div class="text-left" style="max-width: 300px; margin: 0 auto;">
                    <p class="mb-2"><i class="la la-play-circle mr-2 text-primary"></i> Watch all lectures</p>
                    <p class="mb-2"><i class="la la-edit mr-2 text-primary"></i> Attempt quizzes</p>
                    <p class="mb-2"><i class="la la-file-download mr-2 text-primary"></i> Download course materials</p>
                    <p class="mb-2"><i class="la la-trophy mr-2 text-primary"></i> Track your learning progress</p>
                </div>
                <div class="mt-4">
                    <p class="fs-14 italic text-muted">and also can see it in details page</p>
                </div>
            `,
            showConfirmButton: true,
            confirmButtonText: 'Start Learning Now',
            confirmButtonColor: '#7079e7',
        });
    @endif
</script>



@if ($errors->any())
    <script>
        var errorMessages = '';
        @foreach ($errors->all() as $error)
            errorMessages += '<li class="text-start">{{ $error }}</li>';
        @endforeach

        Swal.fire({
            icon: 'warning',
            title: 'Please fix the following errors:',
            html: '<ul class="mt-2 list-unstyled">' + errorMessages + '</ul>',
            showConfirmButton: true,
            confirmButtonColor: '#5b50d6',
        });
    </script>
@endif



<script src="{{ asset('customjs/wishlist/index.js') }}"></script>
<script src="{{asset('customjs/cart/index.js')}}"></script>






@stack('scripts')
