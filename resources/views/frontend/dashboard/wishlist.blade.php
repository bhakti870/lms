@extends('frontend.master')

@section('content')
@include('frontend.section.breadcrumb', ['title' => 'My Wishlist'])

<section class="py-5 bg-light">
    <div class="container">
        <div class="row g-4">
            <!-- Sidebar -->
            <div class="col-lg-4 col-xl-3">
                @include('frontend.dashboard.user_dashboard_sidebar')
            </div>

            <!-- Content -->
            <div class="col-lg-8 col-xl-9">
                <div class="card border-0 shadow-sm rounded-4 overflow-hidden mb-5">
                    <div class="card-header bg-white border-bottom p-4">
                        <h5 class="fw-bold mb-0">Saved Courses</h5>
                    </div>
                    <div class="card-body p-4">
                        <div class="row g-4" id="wishlist-grid">
                            {{-- AJAX will populate this --}}
                            <div class="col-12 text-center py-5">
                                <div class="spinner-border text-theme" role="status">
                                    <span class="visually-hidden">Loading...</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
@endsection

@push('scripts')
<script>
    $(document).ready(function() {
        fetchWishlist();

        function fetchWishlist() {
            $.ajax({
                url: "{{ route('user.wishlist.data') }}",
                type: 'GET',
                success: function(response) {
                    if(response.status === 'success') {
                        $('#wishlist-grid').html(response.html);
                    }
                },
                error: function() {
                    $('#wishlist-grid').html('<div class="col-12 text-center text-danger py-5">Failed to load wishlist. Please try again.</div>');
                }
            });
        }

        $(document).on('click', '.remove-wishlist', function(e) {
            e.preventDefault();
            let id = $(this).data('id');
            
            Swal.fire({
                title: 'Are you sure?',
                text: "Remove this item from your wishlist?",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#5b50d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes, remove it!'
            }).then((result) => {
                if (result.isConfirmed) {
                    $.ajax({
                        url: "{{ url('user/wishlist') }}/" + id,
                        type: 'DELETE',
                        data: {
                            _token: '{{ csrf_token() }}'
                        },
                        success: function(response) {
                            if(response.status === 'success') {
                                Swal.fire({
                                    icon: 'success',
                                    title: 'Removed!',
                                    text: response.message,
                                    timer: 1500,
                                    showConfirmButton: false
                                });
                                fetchWishlist();
                                $('#wishlist-count').text(response.wishlist_count);
                            }
                        }
                    });
                }
            });
        });
    });
</script>
@endpush
