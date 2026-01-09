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

    // Flash Messages Handler
    function showFlashMessages() {
        if (typeof Swal === 'undefined') {
            // If Swal isn't ready yet, retry in 100ms
            setTimeout(showFlashMessages, 100);
            return;
        }

        @php
            $success = session()->pull('success');
            $error = session()->pull('error');
            $regSuccess = session()->pull('registration_success');
            $loginSuccess = session()->pull('login_success');
            $purchaseSuccess = session()->pull('purchase_success');
        @endphp

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
                confirmButtonColor: '#7079e7',
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
                title: '<h2 class="mt-2 text-theme fw-bold">Order Confirmed! 🎉</h2>',
                html: `
                    <div class="text-start px-3 py-2">
                        <div class="mb-4 text-center">
                            <div class="p-3 bg-light rounded-circle d-inline-block mb-3">
                                <i class="bi bi-wallet2 text-theme h1 mb-0"></i>
                            </div>
                            <p class="lead fw-bold mb-0">Thank you for your purchase!</p>
                            <p class="text-muted small">Your enrollment is now complete.</p>
                        </div>
                        <div class="list-group list-group-flush border-top border-bottom mb-4">
                            <div class="list-group-item bg-transparent px-0 py-3 border-0 d-flex align-items-center">
                                <span class="badge bg-theme-soft text-theme rounded-circle p-2 me-3"><i class="bi bi-play-fill"></i></span>
                                <div>
                                    <h6 class="mb-0 fw-bold">Instant Access</h6>
                                    <small class="text-muted">Start learning right now from your dashboard.</small>
                                </div>
                            </div>
                            <div class="list-group-item bg-transparent px-0 py-3 border-0 d-flex align-items-center">
                                <span class="badge bg-success-soft text-success rounded-circle p-2 me-3"><i class="bi bi-file-earmark-pdf"></i></span>
                                <div>
                                    <h6 class="mb-0 fw-bold">Invoice Generated</h6>
                                    <small class="text-muted">A confirmation email has been sent to you.</small>
                                </div>
                            </div>
                        </div>
                        <div class="d-grid gap-2">
                            <a href="{{ route('user.dashboard') }}" class="btn btn-theme text-white border-0 py-3 rounded-pill shadow-sm fw-bold">
                                <i class="bi bi-grid-fill me-2"></i>Go to My Learning
                            </a>
                        </div>
                    </div>
                `,
                showConfirmButton: false,
                showCloseButton: true,
                width: '500px',
                padding: '1.5rem',
                customClass: {
                    container: 'purchase-success-modal'
                }
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
                confirmButtonColor: '#7079e7',
            });
        @endif
    }

    // Run flash message check
    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', showFlashMessages);
    } else {
        showFlashMessages();
    }

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
