
//Frontend Wishlist

// Guard to prevent multiple initializations
if (typeof window.wishlistScriptLoaded === 'undefined') {
    window.wishlistScriptLoaded = true;

    $(document).ready(function () {
        getWishlist();
    });

    // Use .off().on() to prevent duplicate handlers
    $(document).off('click', '.wishlist-icon').on('click', '.wishlist-icon', function () {
        var $btn = $(this);

        // Prevent multiple clicks
        if ($btn.hasClass('loading')) {
            return false;
        }
        $btn.addClass('loading');

        var courseId = $btn.data('course-id');
        var iconElement = $btn.find('i'); // Find the icon inside the clicked element
        var url = '/wishlist/add';

        $.ajax({
            url: url,
            type: 'POST',
            data: {
                course_id: courseId,
                _token: $('meta[name="csrf-token"]').attr('content')
            },
            success: function (response) {
                $btn.removeClass('loading');

                console.log(response)
                Swal.fire({
                    icon: response.status === 'success' ? 'success' : 'error',
                    title: response.message,
                    toast: true,
                    position: 'top-end',
                    showConfirmButton: false,
                    timer: 3000,
                    timerProgressBar: true
                });

                // Update wishlist count dynamically if status is success
                if (response.status === 'success') {
                    updateWishlistCount(response.wishlist_count);
                    getWishlist();
                    // Change the icon to 'heart' if status is success
                    iconElement.removeClass('la-heart-o').addClass('la-heart');
                }
            },
            error: function (xhr) {
                $btn.removeClass('loading');

                let message = 'Something went wrong!';
                if (xhr.responseJSON && xhr.responseJSON.message) {
                    message = xhr.responseJSON.message;
                }

                Swal.fire({
                    icon: 'error',
                    title: message,
                    toast: true,
                    position: 'top-end',
                    showConfirmButton: false,
                    timer: 3000,
                    timerProgressBar: true
                });
            }
        });
    });
}

// Function to update wishlist count
function updateWishlistCount(count) {
    $('#wishlist-count').text(count);
}

//getwishlist

function getWishlist() {

    var url = '/wishlist/all';

    $.ajax({
        url: url,
        type: 'GET',
        data: {

            _token: $('meta[name="csrf-token"]').attr('content')


        },
        success: function (response) {

            if (response.status === 'success') {
                // #wishlist-course ডিভে HTML আপডেট করা
                $('#wishlist-course').html(response.html);
            }


        },
        error: function (xhr) {

            let message = 'Something went wrong!';
            if (xhr.responseJSON && xhr.responseJSON.message) {
                message = xhr.responseJSON.message;
            }
            console.error(message);


        }
    });




}







