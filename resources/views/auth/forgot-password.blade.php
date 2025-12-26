@extends('frontend.master')

@section('content')

<section class="breadcrumb-area section-padding img-bg-2">
    <div class="overlay"></div>
    <div class="container">
        <div class="breadcrumb-content d-flex flex-wrap align-items-center justify-content-between">
            <div class="section-heading">
                <h2 class="section__title text-white">Forgot Password</h2>
            </div>
            <ul class="generic-list-item generic-list-item-white generic-list-item-arrow d-flex flex-wrap align-items-center">
                <li><a href="/">Home</a></li>
                <li>Pages</li>
                <li>Forgot Password</li>
            </ul>
        </div><!-- end breadcrumb-content -->
    </div><!-- end container -->
</section><!-- end breadcrumb-area -->

<section class="contact-area section--padding position-relative">
    <span class="ring-shape ring-shape-1"></span>
    <span class="ring-shape ring-shape-2"></span>
    <span class="ring-shape ring-shape-3"></span>
    <span class="ring-shape ring-shape-4"></span>
    <span class="ring-shape ring-shape-5"></span>
    <span class="ring-shape ring-shape-6"></span>
    <span class="ring-shape ring-shape-7"></span>
    <div class="container">
        <div class="row">
            <div class="col-lg-7 mx-auto">
                <div class="card card-item">
                    <div class="card-body">
                        <h3 class="card-title text-center fs-24 lh-35 pb-4">Reset Your Password</h3>
                        <p class="fs-15 pb-4 text-center">Forgot your password? No problem. Just let us know your email address and we will email you a password reset link.</p>
                        <div class="section-block"></div>

                        <!-- Session Status -->
                        @if (session('status'))
                            <div class="alert alert-success mt-4 mb-0" role="alert">
                                {{ session('status') }}
                            </div>
                        @endif

                        <form method="POST" action="{{ route('password.email') }}" class="pt-4">
                            @csrf

                            <div class="input-box">
                                <label class="label-text">Email Address</label>
                                <div class="form-group">
                                    <input class="form-control form--control" type="email" name="email" value="{{ old('email') }}" required autofocus placeholder="Enter your email address">
                                    <span class="la la-envelope input-icon"></span>
                                    <x-input-error :messages="$errors->get('email')" class="mt-2" />
                                </div>
                            </div><!-- end input-box -->

                            <div class="btn-box">
                                <button class="btn theme-btn w-100" type="submit">Email Password Reset Link <i class="la la-paper-plane ml-1"></i></button>
                                <div class="d-flex align-items-center justify-content-between pt-4">
                                    <p class="fs-14">Remember your password? <a href="{{ route('login') }}" class="text-color hover-underline">Login</a></p>
                                    <p class="fs-14">Don't have an account? <a href="{{ route('register') }}" class="text-color hover-underline">Register</a></p>
                                </div>
                            </div><!-- end btn-box -->
                        </form>
                    </div><!-- end card-body -->
                </div><!-- end card -->
            </div><!-- end col-lg-7 -->
        </div><!-- end row -->
    </div><!-- end container -->
</section><!-- end contact-area -->

@endsection
