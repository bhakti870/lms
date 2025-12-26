<?php

use App\Http\Controllers\admin\InfoController;
use App\Http\Controllers\ProfileController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\backend\AdminController;
use App\Http\Controllers\backend\AdminCourseController;
use App\Http\Controllers\backend\AdminInstructorController;
use App\Http\Controllers\backend\AdminProfileController;
use App\Http\Controllers\backend\BackendOrderController;    
use App\Http\Controllers\backend\CategoryController;
use App\Http\Controllers\backend\CouponController;
use App\Http\Controllers\backend\CourseController;
use App\Http\Controllers\backend\CourseSectionController;
use App\Http\Controllers\backend\InstructorController;
use App\Http\Controllers\backend\InstructorProfileController;
use App\Http\Controllers\backend\OrderController;
use App\Http\Controllers\backend\PartnerController;
use App\Http\Controllers\backend\SettingController;
use App\Http\Controllers\backend\AdminUserController;
use App\Http\Controllers\backend\SiteSettingController;
use App\Http\Controllers\backend\SliderController;
use App\Http\Controllers\backend\SubcategoryController;
use App\Http\Controllers\backend\UserController;
use App\Http\Controllers\backend\UserProfileController;
use App\Http\Controllers\backend\RoleController;
use App\Http\Controllers\backend\PermissionController;
use App\Http\Controllers\backend\QuizController;
use App\Http\Controllers\backend\CourseMaterialController;
use App\Http\Controllers\frontend\CartController;
use App\Http\Controllers\frontend\CheckoutController;
use App\Http\Controllers\frontend\FrontendDashboardController;
use App\Http\Controllers\frontend\WishlistController;
use App\Http\Controllers\frontend\CourseDeliveryController;
use App\Http\Controllers\LectureController;
use App\Http\Controllers\backend\ReviewController as BackendReviewController;
use App\Http\Controllers\frontend\ReviewController as FrontendReviewController;
use App\Http\Controllers\backend\InstructorOrderController;
use App\Http\Controllers\SocialController;

/*
Route::get('/dashboard', function () {
    return view('dashboard');
})->middleware(['auth', 'verified'])->name('dashboard'); */

/*  Google Route  */

Route::get('/auth/google', [SocialController::class, 'googleLogin'])->name('auth.google');
Route::get('/auth/google-callback', [SocialController::class, 'googleAuthentication'])->name('auth.google-callback');



/* Admin Route   */

Route::get('/admin/login', [AdminController::class, 'login'])->name('admin.login');
Route::post('/admin/login', [AdminController::class, 'loginStore'])->name('admin.login.store');


Route::middleware(['auth', 'verified', 'role:admin'])->prefix('admin')->name('admin.')->group(function () {
    Route::get('/dashboard', [AdminController::class, 'dashboard'])->name('dashboard');
    Route::post('/logout', [AdminController::class, 'destroy'])
        ->name('logout');

    /*  control Profile */

    Route::get('/profile', [AdminProfileController::class, 'index'])->name('profile');
    Route::post('/profile/store', [AdminProfileController::class, 'store'])->name('profile.store');
    Route::get('/setting', [AdminProfileController::class, 'setting'])->name('setting');
    Route::post('/password/setting', [AdminProfileController::class, 'passwordSetting'])->name('passwordSetting');

    /*  control Category & Subcategory  */

    Route::resource('category', CategoryController::class);
    Route::resource('subcategory', SubcategoryController::class);

    /* Control Slider */
    Route::resource('slider', SliderController::class);

     /* control Course  */

    Route::resource('course', AdminCourseController::class);
    Route::post('/course-status', [AdminCourseController::class, 'courseStatus'])->name('course.status');

    /*  order controller  */
    Route::resource('order', BackendOrderController::class);

    /* Mange Info */
    Route::resource('info', InfoController::class);

    /* control instructor  */
    Route::resource('instructor', AdminInstructorController::class);
    Route::post('/update-status', [AdminInstructorController::class, 'updateStatus'])->name('instructor.status');
    Route::get('/instructor-active-list', [AdminInstructorController::class, 'instructorActive'])->name('instructor.active');
    Route::get('/delete-instructor/{id}', [AdminInstructorController::class, 'delete'])->name('delete.instructor');

    /*  Setting Controller */
    Route::get('/mail-setting', [SettingController::class, 'mailSetting'])->name('mailSetting');
    Route::put('/mail-settings/update', [SettingController::class, 'updateMailSettings'])->name('mail.settings.update');

    Route::get('/stripe-setting', [SettingController::class, 'stripeSetting'])->name('stripeSetting');
    Route::post('/stripe-settings/update', [SettingController::class, 'updateStripeSettings'])->name('stripe.settings.update');

    Route::get('/google-setting', [SettingController::class, 'googleSetting'])->name('googleSetting ');
    Route::post('/google-settings/update', [SettingController::class, 'updateGoogleSettings'])->name('google.settings.update');

     /* Manage Partner  */

    Route::resource('partner', PartnerController::class);

     /* Manage Site Seetings */
    Route::resource('site-setting', SiteSettingController::class);

    /* Manage Roles & Permissions */
    Route::resource('role', RoleController::class);
    Route::resource('permission', PermissionController::class);
    Route::get('/mark-all-read', [AdminController::class, 'markAllAsRead'])->name('markAllRead');

    /* Manage All Users */
    Route::get('/all-user', [AdminUserController::class, 'index'])->name('all.user');
    Route::post('/user-status', [AdminUserController::class, 'updateStatus'])->name('user.status');
    Route::get('/delete-user/{id}', [AdminUserController::class, 'delete'])->name('delete.user');

});


/*  Instructor Route  */
Route::get('/instructor/login', [InstructorController::class, 'login'])->name('instructor.login');
Route::post('/instructor/login', [InstructorController::class, 'loginStore'])->name('instructor.login.store');
Route::get('/instructor/register', [InstructorController::class, 'register'])->name('instructor.register');
Route::post('/instructor/register', [InstructorController::class, 'instructorRegister'])->name('instructor.register.store');
Route::middleware(['auth', 'verified', 'role:instructor'])->prefix('instructor')->name('instructor.')->group(function () {
    Route::get('/dashboard', [InstructorController::class, 'dashboard'])->name('dashboard');
    Route::post('/logout', [InstructorController::class, 'destroy'])
        ->name('logout');

    Route::get('/profile', [InstructorProfileController::class, 'index'])->name('profile');
    Route::post('/profile/store', [InstructorProfileController::class, 'store'])->name('profile.store');
    Route::get('/setting', [InstructorProfileController::class, 'setting'])->name('setting');
    Route::post('/password/setting', [InstructorProfileController::class, 'passwordSetting'])->name('passwordSetting');

    Route::resource('course', CourseController::class);
    Route::get('/get-subcategories/{categoryId}', [CategoryController::class, 'getSubcategories']);

    Route::resource('course-section', CourseSectionController::class);

    Route::resource('lecture', LectureController::class);

    // Instructor Course Quiz
    Route::post('/quiz/store', [QuizController::class, 'store'])->name('quiz.store');
    Route::get('/quiz/edit/{id}', [QuizController::class, 'edit'])->name('quiz.edit');
    Route::post('/quiz/update/{id}', [QuizController::class, 'update'])->name('quiz.update');
    Route::delete('/quiz/destroy/{id}', [QuizController::class, 'destroy'])->name('quiz.destroy');
    Route::post('/quiz/question/store', [QuizController::class, 'storeQuestion'])->name('quiz.question.store');
    Route::post('/quiz/question/update/{id}', [QuizController::class, 'updateQuestion'])->name('quiz.question.update');
    Route::delete('/quiz/question/destroy/{id}', [QuizController::class, 'destroyQuestion'])->name('quiz.question.destroy');

    // Instructor Course Materials
    Route::post('/material/store', [CourseMaterialController::class, 'store'])->name('instructor.material.store');
    Route::get('/material/edit/{id}', [CourseMaterialController::class, 'edit'])->name('instructor.material.edit');
    Route::post('/material/update/{id}', [CourseMaterialController::class, 'update'])->name('instructor.material.update');
    Route::delete('/material/destroy/{id}', [CourseMaterialController::class, 'destroy'])->name('instructor.material.destroy');

    // Review Management
    Route::get('/all-reviews', [BackendReviewController::class, 'instructorReviews'])->name('all.review');
    Route::post('/update-review-status/{id}', [BackendReviewController::class, 'updateReviewStatus'])->name('update.review.status');
    Route::delete('/delete-review/{id}', [BackendReviewController::class, 'deleteReview'])->name('delete.review');

    // Notifications
    Route::get('/mark-notification-as-read/{id}', [InstructorController::class, 'markAsRead'])->name('mark.notification.read');
    Route::get('/mark-all-notifications-as-read', [InstructorController::class, 'markAllAsRead'])->name('mark.all.notifications.read');

    Route::resource('coupon', CouponController::class);

    // Instructor Order History
    Route::get('/orders', [InstructorOrderController::class, 'index'])->name('orders.index');
    Route::get('/orders/view/{id}', [InstructorOrderController::class, 'show'])->name('orders.show');

    // Instructor Course Q&A
    Route::get('/questions', [\App\Http\Controllers\Backend\InstructorQuestionController::class, 'index'])->name('question.index');
    Route::get('/questions/{id}', [\App\Http\Controllers\Backend\InstructorQuestionController::class, 'show'])->name('question.show');
    Route::post('/questions/{id}/reply', [\App\Http\Controllers\Backend\InstructorQuestionController::class, 'reply'])->name('question.reply');
});


//user Route

Route::middleware(['auth', 'verified', 'role:user'])->prefix('user')->name('user.')->group(function () {
    Route::get('/dashboard', [UserController::class, 'dashboard'])->name('dashboard');
    Route::post('/logout', [UserController::class, 'destroy'])
        ->name('logout');

    //Profile

    Route::get('/profile', [UserProfileController::class, 'index'])->name('profile');
    Route::post('/profile/store', [UserProfileController::class, 'store'])->name('profile.store');
    Route::get('/setting', [UserProfileController::class, 'setting'])->name('setting');
    Route::post('/password/setting', [UserProfileController::class, 'passwordSetting'])->name('passwordSetting');

    /* Wishlist controller */

    Route::get('wishlist', [WishlistController::class, 'index'])->name('wishlist.index');
    Route::get('/wishlist-data', [WishlistController::class, 'getWishlist'])->name('wishlist.data');
    Route::delete('/wishlist/{id}', [WishlistController::class, 'destroy'])->name('wishlist.destroy');


    /* Course Delivery & Learning */
    Route::get('/course-learn/{id}', [CourseDeliveryController::class, 'learn'])->name('course.learn');
    Route::get('/course-content/{course_id}/{type}/{id}', [CourseDeliveryController::class, 'getContent'])->name('course.content');
    Route::post('/course/note/save', [CourseDeliveryController::class, 'saveNote'])->name('course.note.save');
    Route::post('/course/progress', [CourseDeliveryController::class, 'saveProgress'])->name('course.progress');
    Route::post('/course-quiz-submit', [CourseDeliveryController::class, 'submitQuiz'])->name('course.quiz.submit');
    Route::get('/course-certificate/{course_id}', [CourseDeliveryController::class, 'downloadCertificate'])->name('course.certificate');

    /* Course Q&A */
    Route::get('/course-questions/{lecture_id}', [\App\Http\Controllers\Frontend\CourseQuestionController::class, 'fetchQuestions']);
    Route::post('/course/question/store', [\App\Http\Controllers\Frontend\CourseQuestionController::class, 'store'])->name('course.question.store');
    Route::post('/course/question/reply', [\App\Http\Controllers\Frontend\CourseQuestionController::class, 'reply'])->name('course.question.reply');

    /* Purchase History */
    Route::get('/purchase-history', [UserController::class, 'purchaseHistory'])->name('purchase.history');
    Route::get('/invoice/{id}', [UserController::class, 'downloadInvoice'])->name('invoice');
    Route::get('/leaderboard', [UserController::class, 'leaderboard'])->name('leaderboard');
    Route::delete('/course-remove/{id}', [UserController::class, 'removeCourse'])->name('course.remove');
});


//Frontend Route

Route::get('/', [FrontendDashboardController::class, 'home'])->name('frontend.home');
Route::get('/instructors', [App\Http\Controllers\Frontend\InstructorController::class, 'index'])->name('all.instructors');
Route::get('/instructor/details/{id}', [App\Http\Controllers\Frontend\InstructorController::class, 'instructorDetails'])->name('instructor.details');

// All Courses
Route::get('/courses', [App\Http\Controllers\Frontend\FrontendDashboardController::class, 'allCourses'])->name('all.courses');
Route::get('/course-details/{slug}', [FrontendDashboardController::class, 'view'])->name('course-details');
Route::get('/category/{slug}', [FrontendDashboardController::class, 'categoryDetails'])->name('category.details');
Route::get('/subcategory/{slug}', [FrontendDashboardController::class, 'subcategoryDetails'])->name('subcategory.details');

/* wishlist controller  */

Route::get('/wishlist/all', [WishlistController::class, 'allWishlist']);
Route::post('/wishlist/add', [WishlistController::class, 'addToWishlist']);

/* Cart Controller */
Route::get('/cart', [CartController::class, 'index'])->name('cart');
Route::post('/cart/add', [CartController::class, 'addToCart'])->name('cart.add');
Route::get('/cart/all', [CartController::class, 'cartAll']);
Route::get('/fetch/cart', [CartController::class, 'fetchCart']);
Route::post('/remove/cart', [CartController::class, 'removeCart']);


/*  Checkout */
Route::get('/checkout', [CheckoutController::class, 'index'])->name('checkout.index');
/* Coupon Apply    */
Route::post('/apply-coupon', [CouponController::class, 'applyCoupon']);
Route::get('/coupon-remove', [CouponController::class, 'couponRemove']);


/* Auth Protected Route */

Route::middleware('auth')->group(function () {

    /* Order  */
    Route::post('/order', [OrderController::class, 'order'])->name('order');
    Route::get('/payment-success', [OrderController::class, 'success'])->name('success');
    Route::get('/payment-cancel', [OrderController::class, 'cancel'])->name('cancel');
    Route::post('/razorpay-success', [OrderController::class, 'razorpaySuccess'])->name('razorpay.success');
    Route::get('/razorpay-cancel', [OrderController::class, 'razorpayCancel'])->name('razorpay.cancel');
    
    /* Review */
    Route::post('/store/review', [FrontendReviewController::class, 'storeReview'])->name('store.review');
});








require __DIR__ . '/auth.php';
