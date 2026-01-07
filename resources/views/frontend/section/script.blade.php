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

    }

    // Flash Messages (One-time execution, decoupled from turbo:load to prevent duplicates)
    (function() {
        // Prevent execution during Turbo preview or if already shown on this specific DOM load
        if (document.documentElement.hasAttribute('data-turbo-preview')) return;
        
        @php
            $success = session()->pull('success');
            $error = session()->pull('error');
            $regSuccess = session()->pull('registration_success');
            $loginSuccess = session()->pull('login_success');
            $purchaseSuccess = session()->pull('purchase_success');
        @endphp

        if (typeof Swal !== 'undefined') {
            @if ($success)
                Swal.fire({
                    toast: true,
                    icon: 'success',
                    title: '{{ $success }}',
                    position: 'top-end',
                    showConfirmButton: false,
                    timer: 3000,
                    timerProgressBar: true,
                    background: '#7079e7',
                    color: '#ffffff',
                    iconColor: '#ffffff',
                });
            @endif

            @if ($error)
                Swal.fire({
                    toast: true,
                    icon: 'error',
                    title: '{{ $error }}',
                    position: 'top-end',
                    showConfirmButton: false,
                    timer: 3000,
                    timerProgressBar: true,
                    background: '#f27474',
                    color: '#ffffff',
                    iconColor: '#ffffff',
                });
            @endif

            @if ($regSuccess)
                Swal.fire({
                    icon: 'success',
                    title: '<h3 class="mt-2 text-theme">Welcome! 👋</h3>',
                    text: 'Your account has been created successfully.',
                    showConfirmButton: true,
                });
            @endif

            @if ($loginSuccess)
                Swal.fire({
                    toast: true,
                    icon: 'success',
                    title: '{{ $loginSuccess }}',
                    position: 'top-end',
                    showConfirmButton: false,
                    timer: 4000,
                    timerProgressBar: true,
                    background: '#7079e7',
                    color: '#ffffff',
                    iconColor: '#ffffff',
                });
            @endif

            @if ($purchaseSuccess)
                Swal.fire({
                    icon: 'success',
                    title: '<h2 class="mt-2 text-theme fw-bold">Success! 🎉</h2>',
                    html: `
                        <div class="text-start px-3">
                            <p class="mb-3 lead">Congratulations! Your purchase was successful.</p>
                            <ul class="list-unstyled mb-4">
                                <li class="mb-2"><i class="bi bi-play-circle-fill text-theme me-2"></i> <strong>Start Learning:</strong> Your course is now available.</li>
                                <li class="mb-2"><i class="bi bi-patch-check-fill text-theme me-2"></i> <strong>Get Certified:</strong> Complete the course to earn your certificate.</li>
                                <li class="mb-2"><i class="bi bi-person-badge-fill text-theme me-2"></i> <strong>Dashboard:</strong> Track your progress in your dashboard.</li>
                            </ul>
                            <div class="d-grid gap-2">
                                <a href="{{ route('user.dashboard') }}" class="btn btn-theme text-white border-0 py-2 rounded-pill shadow-sm">Go to My Courses</a>
                            </div>
                        </div>
                    `,
                    showConfirmButton: false,
                    showCloseButton: true,
                    timer: 10000,
                    timerProgressBar: true,
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
    })();

    // Run on every Turbo navigation (covers both initial load and AJAX navigation)
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

    document.addEventListener('turbo:load', fetchNotificationCount);
</script>
