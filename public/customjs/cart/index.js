
// Guard to prevent multiple initializations
if (typeof window.cartScriptLoaded === 'undefined') {
    window.cartScriptLoaded = true;

    // Use .off().on() to prevent duplicate handlers
    $(document).off('click', '.add-to-cart-btn').on('click', '.add-to-cart-btn', function () {
        var courseId = $(this).data('course-id'); // Get course ID from button
        var quantity = 1; // Default quantity (can be dynamic)
        var $btn = $(this);

        // Prevent multiple clicks
        if ($btn.hasClass('loading')) {
            return false;
        }
        $btn.addClass('loading');

        $.ajax({
            url: '/cart/add', // Laravel route to handle add-to-cart
            method: 'POST',
            data: {
                course_id: courseId,
                quantity: quantity,
                _token: $('meta[name="csrf-token"]').attr('content') // CSRF token for security
            },
            success: function (response) {
                $btn.removeClass('loading');

                if (response.status === 'success') {
                    getCart();
                    // Show success message
                    Swal.fire({
                        icon: 'success',
                        title: response.message,
                        toast: true,
                        position: 'top-end',
                        timer: 3000,
                        showConfirmButton: false,
                    });

                    // Optionally update cart count
                    if (response.cart_count !== undefined) {
                        $('.cart-count').text(response.cart_count);
                    }
                } else {
                    Swal.fire({
                        icon: 'error',
                        title: response.message,
                        toast: true,
                        position: 'top-end',
                        timer: 3000,
                        showConfirmButton: false,
                    });
                }
            },
            error: function (xhr, status, error) {
                $btn.removeClass('loading');
                var errorMessage = 'Something went wrong!';

                // Try to get the error message from the server response
                if (xhr.responseJSON && xhr.responseJSON.message) {
                    errorMessage = xhr.responseJSON.message;
                } else if (xhr.responseText) {
                    try {
                        var response = JSON.parse(xhr.responseText);
                        if (response.message) {
                            errorMessage = response.message;
                        }
                    } catch (e) {
                        // If parsing fails, use the default message
                    }
                }

                Swal.fire({
                    icon: 'error',
                    title: errorMessage,
                    toast: true,
                    position: 'top-end',
                    timer: 3000,
                    showConfirmButton: false,
                });
            }
        });
    });
}

// Always call getCart on page load (outside the guard)
$(document).ready(function () {
    getCart();
});

$(document).on('click', '.buy-now-btn', function () {
    var courseId = $(this).data('course-id');
    var quantity = 1;

    $.ajax({
        url: '/cart/add',
        method: 'POST',
        data: {
            course_id: courseId,
            quantity: quantity,
            _token: $('meta[name="csrf-token"]').attr('content')
        },
        success: function (response) {
            if (response.status === 'success') {
                window.location.href = '/checkout';
            } else {
                Swal.fire({
                    icon: 'error',
                    title: response.message,
                    toast: true,
                    position: 'top-end',
                    timer: 3000,
                    showConfirmButton: false,
                });
            }
        },
        error: function (xhr, status, error) {
            var errorMessage = 'Something went wrong!';

            // Try to get the error message from the server response
            if (xhr.responseJSON && xhr.responseJSON.message) {
                errorMessage = xhr.responseJSON.message;
            } else if (xhr.responseText) {
                try {
                    var response = JSON.parse(xhr.responseText);
                    if (response.message) {
                        errorMessage = response.message;
                    }
                } catch (e) {
                    // If parsing fails, use the default message
                }
            }

            Swal.fire({
                icon: 'error',
                title: errorMessage,
                toast: true,
                position: 'top-end',
                timer: 3000,
                showConfirmButton: false,
            });
        }
    });
});

//getCart for header dropdown

function getCart() {

    var url = '/cart/all';

    $.ajax({
        url: url,
        type: 'GET',
        data: {
            _token: $('meta[name="csrf-token"]').attr('content')
        },
        success: function (response) {

            if (response.status === 'success') {
                // Update header dropdown content
                $('#cart-dropdown-content').html(response.html);

                // Update cart count badge
                if (response.count !== undefined) {
                    $('.cart-count').text(response.count);
                }
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




//fetch cart for cart page

function fetchCart() {
    var url = '/fetch/cart';

    $.ajax({
        url: url,
        type: 'GET',
        data: {
            _token: $('meta[name="csrf-token"]').attr('content')
        },
        success: function (response) {
            if (response.status === 'success') {
                $('#cart-main-content').html(response.html);
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

$(document).ready(function () {
    // Call the function to get the cart data on page load
    if ($('#cart-main-content').length) {
        fetchCart();
    }
    getCart(); // Also update header dropdown

    $(document).on('click', '.remove-course-btn', function () {

        var id = $(this).data('id');
        var url = '/remove/cart'; // Define the remove route

        $.ajax({

            url: url,
            type: 'POST',
            data: {
                _token: $('meta[name="csrf-token"]').attr('content'),
                id: id
            },

            success: function (response) {
                if (response.status === 'success') {

                    Swal.fire({
                        toast: true,
                        position: 'top-end',
                        icon: 'success',
                        title: 'Course removed successfully!',
                        showConfirmButton: false,
                        timer: 3000
                    });

                    // Refresh the cart page if we're on it
                    if ($('#cart-main-content').length) {
                        fetchCart();
                    }

                    getCart();  //Refresh header dropdown

                    if (response.cart_count !== undefined) {
                        $('.cart-count').text(response.cart_count);
                    }

                }
            },
            error: function (xhr) {
                let message = 'Something went wrong!';
                if (xhr.responseJSON && xhr.responseJSON.message) {
                    message = xhr.responseJSON.message;
                }
                console.error(message);
            }


        })

    })




});








