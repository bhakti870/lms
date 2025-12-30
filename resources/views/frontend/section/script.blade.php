<script src="{{ asset('frontend/js/jquery-3.4.1.min.js') }}" defer></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" defer></script>
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js" defer></script>
<script src="{{ asset('frontend/new_design/script.js') }}" defer></script>

<!-- Keep essential LMS scripts -->
<script src="{{ asset('frontend/js/owl.carousel.min.js') }}" defer></script>
<script src="{{ asset('frontend/js/fancybox.js') }}" defer></script>
<script src="{{ asset('frontend/js/jquery-te-1.4.0.min.js') }}" defer></script>
<script src="{{ asset('frontend/js/jquery.MultiFile.min.js') }}" defer></script>
<script src="{{ asset('frontend/js/main.js') }}" defer></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11" defer></script>
<script src="{{ asset('customjs/wishlist/index.js') }}" defer></script>
<script src="{{ asset('customjs/cart/index.js') }}" defer></script>
<script src="{{ asset('frontend/js/header-dropdown.js') }}" defer></script>

<script>
    function initializeScripts() {
        // Initialize AOS
        if (typeof AOS !== 'undefined') {
            AOS.init();
        }

        // AJAX CSRF Setup
        if (typeof $ !== 'undefined') {
            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            });
        }

        // Initialize Plyr if element exists
        if (typeof Plyr !== 'undefined' && document.getElementById('player')) {
            new Plyr('#player');
        }

        // Flash Messages (SweetAlert)
        if (typeof Swal !== 'undefined') {
            @if (session('success'))
                Swal.fire({
                    toast: true,
                    icon: 'success',
                    title: '{{ session('success') }}',
                    position: 'top-end',
                    showConfirmButton: false,
                    timer: 3000,
                    timerProgressBar: true,
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
                    title: '<h3 class="mt-2 text-theme">Welcome! 👋</h3>',
                    text: 'Your account has been created successfully.',
                    showConfirmButton: true,
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

            @if ($errors->any())
                let errorMessages = '';
                @foreach ($errors->all() as $error)
                    errorMessages += '<li class="text-start">{{ $error }}</li>';
                @endforeach

                Swal.fire({
                    icon: 'warning',
                    title: 'Please fix the errors:',
                    html: '<ul class="mt-2 list-unstyled">' + errorMessages + '</ul>',
                    showConfirmButton: true,
                    confirmButtonColor: '#5b50d6',
                });
            @endif
        }
    }

    // Run on first load
    document.addEventListener('DOMContentLoaded', initializeScripts);

    // Run on every Turbo navigation
    document.addEventListener('turbo:load', initializeScripts);
</script>

@stack('scripts')

<script>
    function fetchNotificationCount() {
        @auth
        if (typeof $ !== 'undefined') {
            $.ajax({
                type: "GET",
                url: "/navbar/notification-count",
                dataType: "json",
                success: function(response) {
                    if (response.count > 0) {
                        $('#notification-count').text(response.count).show();
                    } else {
                        $('#notification-count').text('0').show();
                    }
                },
                error: function() {
                    console.log('Error fetching notifications');
                }
            });
        }
        @endauth
    }

    document.addEventListener('DOMContentLoaded', fetchNotificationCount);
    document.addEventListener('turbo:load', fetchNotificationCount);
</script>
