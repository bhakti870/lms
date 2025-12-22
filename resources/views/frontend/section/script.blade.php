
<script src="{{ asset('frontend/js/jquery-3.4.1.min.js') }}"></script>
<script src="{{ asset('frontend/js/bootstrap.bundle.min.js') }}"></script>
<script src="{{ asset('frontend/js/bootstrap-select.min.js') }}"></script>
<script src="{{ asset('frontend/js/owl.carousel.min.js') }}"></script>
<script src="{{ asset('frontend/js/isotope.js') }}"></script>
<script src="{{ asset('frontend/js/waypoint.min.js') }}"></script>
<script src="{{ asset('frontend/js/jquery.counterup.min.js') }}"></script>
<script src="{{ asset('frontend/js/fancybox.js') }}"></script>
<script src="{{ asset('frontend/js/datedropper.min.js') }}"></script>
<script src="{{ asset('frontend/js/emojionearea.min.js') }}"></script>
<script src="{{ asset('frontend/js/tooltipster.bundle.min.js') }}"></script>
<script src="{{ asset('frontend/js/plyr.js') }}"></script>
<script src="{{ asset('frontend/js/jquery.lazy.min.js') }}"></script>

<script src="{{ asset('frontend/js/jquery-te-1.4.0.min.js') }}"></script>
<script src="{{ asset('frontend/js/jquery.MultiFile.min.js') }}"></script>



<script src="{{ asset('frontend/js/main.js') }}"></script>

<script>
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
        @foreach ($errors->all() as $error)



            Swal.fire({
                icon: 'warning',
                title: '{{ $error }}',
                showConfirmButton: true,

            });
        @endforeach
    </script>
@endif



<script src="{{ asset('customjs/wishlist/index.js') }}"></script>
<script src="{{asset('customjs/cart/index.js')}}"></script>






@stack('scripts')
