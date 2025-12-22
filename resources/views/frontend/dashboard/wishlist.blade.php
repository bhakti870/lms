@extends('frontend.master')

@section('content')
@include('frontend.section.breadcrumb', ['title' => 'My Wishlist'])

<section class="dashboard-area pt-60px pb-120px">
    <div class="container" id="wishlist-main-content">
        <!-- The wishlist content will be loaded here via AJAX similar to cart -->
        <div class="row" id="wishlist-grid">
            <!-- AJAX will populate this -->
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
                url: '/user/wishlist-data',
                type: 'GET',
                success: function(response) {
                    if(response.status === 'success') {
                        $('#wishlist-grid').html(response.html);
                    }
                }
            });
        }

        $(document).on('click', '.remove-wishlist', function(e) {
            e.preventDefault();
            let id = $(this).data('id');
            $.ajax({
                url: '/user/wishlist/' + id,
                type: 'DELETE',
                data: {
                    _token: '{{ csrf_token() }}'
                },
                success: function(response) {
                    if(response.status === 'success') {
                        fetchWishlist();
                        // Update header count if necessary
                        $('#wishlist-count').text(response.wishlist_count);
                    }
                }
            });
        });
    });
</script>
@endpush
