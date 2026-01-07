@extends('frontend.master')

@section('content')

<section class="breadcrumb-area section-padding img-bg-2">
    <div class="overlay"></div>
    <div class="container">
        <div class="breadcrumb-content d-flex flex-wrap align-items-center justify-content-between">
            <div class="section-heading">
                <h2 class="section__title text-white">Reset Password</h2>
            </div>
            <ul class="generic-list-item generic-list-item-white generic-list-item-arrow d-flex flex-wrap align-items-center">
                <li><a href="/">Home</a></li>
                <li>Pages</li>
                <li>Reset Password</li>
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
                        <h3 class="card-title text-center fs-24 lh-35 pb-4">Set New Password</h3>
                        <div class="section-block"></div>

                        <form method="POST" action="{{ route('password.store') }}" class="pt-4">
                            @csrf

                            <!-- Password Reset Token -->
                            <input type="hidden" name="token" value="{{ $request->route('token') }}">

                            <div class="input-box">
                                <label class="label-text">Email Address</label>
                                <div class="form-group">
                                    <input class="form-control form--control" type="email" name="email" value="{{ old('email', $request->email) }}" required autofocus placeholder="Confirm your email address">
                                    <span class="la la-envelope input-icon"></span>
                                    <x-input-error :messages="$errors->get('email')" class="mt-2" />
                                </div>
                            </div><!-- end input-box -->

                            <div class="input-box">
                                <label class="label-text">New Password</label>
                                <div class="form-group">
                                    <input class="form-control form--control" type="password" name="password" required placeholder="Enter new password">
                                    <span class="la la-lock input-icon"></span>
                                    <x-input-error :messages="$errors->get('password')" class="mt-2" />
                                </div>
                            </div><!-- end input-box -->

                            <div class="input-box">
                                <label class="label-text">Confirm New Password</label>
                                <div class="form-group">
                                    <input class="form-control form--control" type="password" name="password_confirmation" required placeholder="Confirm new password">
                                    <span class="la la-lock input-icon"></span>
                                    <x-input-error :messages="$errors->get('password_confirmation')" class="mt-2" />
                                </div>
                            </div><!-- end input-box -->

                            <div class="btn-box">
                                <button class="btn theme-btn w-100" type="submit">Reset Password <i class="la la-refresh ml-1"></i></button>
                            </div><!-- end btn-box -->
                        </form>
                    </div><!-- end card-body -->
                </div><!-- end card -->
            </div><!-- end col-lg-7 -->
        </div><!-- end row -->
    </div><!-- end container -->
</section><!-- end contact-area -->

@endsection
