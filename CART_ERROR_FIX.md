# Cart "Already in Cart" Error Fix

## Problem
User was getting "Something went wrong! This course is already in your cart" error when trying to add courses to cart from the course details page, even when the course wasn't actually in the cart.

## Root Cause
The issue was in **two locations** where the code was checking if a course was already in the cart:

1. **`resources/views/frontend/pages/course-details/rightside-course-preview.blade.php` (Line 45)**
2. **`resources/views/frontend/section/tooltip.blade.php` (Line 59)**

Both were checking the cart using `user_id`:
```php
$inCart = \App\Models\Cart::where('user_id', $user_id)->where('course_id', $course->id)->exists();
```

However, the **CartRepository** (which handles adding items to cart) uses `guest_token` instead:
```php
$existingCart = Cart::where('guest_token', $guestToken)
    ->where('course_id', $course_id)
    ->first();
```

This mismatch meant:
- The blade views were looking for `user_id` in cart (which doesn't exist for guest users)
- The cart repository was storing/checking with `guest_token`
- Result: Blade never found the course in cart, so button showed "Add to Cart"
- But when clicked, repository found it (via guest_token) and returned "already in cart" error

## Solution

### 1. Fixed Cart Checking Logic (2 files)

**File: `resources/views/frontend/pages/course-details/rightside-course-preview.blade.php`**
```php
@php
    $in_cart = false;
    $in_wishlist = false;
    
    // Check cart using guest_token (same logic as CartRepository)
    $guestToken = request()->cookie('guest_token');
    if ($guestToken) {
        $in_cart = \App\Models\Cart::where('guest_token', $guestToken)
            ->where('course_id', $course->id)
            ->exists();
    }
    
    // Check wishlist for authenticated users
    if (Auth::check()) {
        $user_id = Auth::id();
        $in_wishlist = \App\Models\Wishlist::where('user_id', $user_id)
            ->where('course_id', $course->id)
            ->exists();
    }
@endphp
```

**File: `resources/views/frontend/section/tooltip.blade.php`**
```php
@php
    $isEnrolled = false;
    $inCart = false;
    $inWishlist = false;

    // Check cart using guest_token (same logic as CartRepository)
    $guestToken = request()->cookie('guest_token');
    if ($guestToken) {
        $inCart = \App\Models\Cart::where('guest_token', $guestToken)
            ->where('course_id', $course->id)
            ->exists();
    }

    // Check enrollment and wishlist for authenticated users
    if (Auth::check()) {
        $user_id = Auth::id();
        $isEnrolled = \App\Models\Enrollment::where('user_id', $user_id)
            ->where('course_id', $course->id)
            ->exists();
        $inWishlist = \App\Models\Wishlist::where('user_id', $user_id)
            ->where('course_id', $course->id)
            ->exists();
    }
@endphp
```

### 2. Improved JavaScript Error Handling

**File: `public/customjs/cart/index.js`**

Improved error messages in both the **add-to-cart** and **buy-now** button handlers to show the actual server error message instead of generic "Something went wrong!":

```javascript
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
```

## Files Modified

1. ✅ `resources/views/frontend/pages/course-details/rightside-course-preview.blade.php`
   - Fixed cart checking to use `guest_token` instead of `user_id`

2. ✅ `resources/views/frontend/section/tooltip.blade.php`
   - Fixed cart checking to use `guest_token` instead of `user_id`

3. ✅ `public/customjs/cart/index.js`
   - Improved error handling for add-to-cart button (2 locations)
   - Improved error handling for buy-now button

## Testing

### Before Fix:
1. Clear your cart
2. Go to any course details page
3. Click "Add to Cart"
4. Error: "Something went wrong! This course is already in your cart"

### After Fix:
1. Clear your cart (and clear browser cookies to reset guest_token)
2. Go to any course details page
3. Click "Add to Cart"
4. ✅ Success: "Course added to cart successfully!"
5. Button changes to "Go to Cart"
6. Click "Add to Cart" again on same course
7. ✅ Proper error: "This course is already in your cart."

## How Cart Works Now

### For Guest Users (Not Logged In):
- Cart items are tracked using `guest_token` cookie
- Cookie is created automatically on first cart addition
- Cookie lasts 30 days
- Cart persists across browser sessions

### For Authenticated Users:
- Cart still uses `guest_token` for storage
- Wishlist uses `user_id` (user must be logged in)
- Enrollment uses `user_id` (user must be logged in and purchased)

## Additional Notes

### Why guest_token instead of user_id?
The system is designed to allow **guest shopping** - users can add courses to cart without logging in. This improves conversion rates as users don't need to create an account first. The cart is tracked via browser cookies.

### Future Improvement Ideas:
1. Merge guest cart with user cart on login
2. Add database migration to add `user_id` column to carts table for authenticated users
3. Support both guest_token and user_id based on auth status

---

**Status**: ✅ **FIXED and TESTED**
**Date**: December 29, 2025
