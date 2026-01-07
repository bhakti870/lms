<!doctype html>
<html lang="en">

<head>

    @include('backend.section.link')

    <title>LMS - Instructor Register</title>
</head>

<body class="">
    <!--wrapper-->
    <div class="wrapper">
        <div class="section-authentication-cover">
            <div class="">
                <div class="row g-0">

                    <div
                        class="col-12 col-xl-7 col-xxl-8 auth-cover-left align-items-center justify-content-center d-none d-xl-flex">

                        <div class="card shadow-none bg-transparent shadow-none rounded-0 mb-0">
                            <div class="card-body">
                                <img src="{{asset('backend/assets/images/login-images/login-cover.svg')}}"
                                    class="img-fluid auth-img-cover-login" width="650" alt="" />
                            </div>
                        </div>

                    </div>

                    <div class="col-12 col-xl-5 col-xxl-4 auth-cover-right align-items-center justify-content-center">
                        <div class="card rounded-0 m-3 shadow-none bg-transparent mb-0">
                            <div class="card-body p-sm-5">
                                <div class="">
                                    <div class="mb-3 text-center">
                                        <img src="{{asset('backend/assets/images/logo-icon.png')}}" width="60" alt="">
                                    </div>
                                    <div class="text-center mb-4">
                                        <h5 class="">Become an Instructor</h5>
                                        <p class="mb-0">Join our team of expert instructors</p>
                                    </div>
                                    <div class="form-body">
                                        <form class="row g-3" method="post" action="{{ route('instructor.register.store') }}" >
                                            @csrf

                                            <div class="col-12">
                                                <label for="inputName" class="form-label">Full Name</label>
                                                <input type="text" class="form-control" name="name" id="inputName" value="{{ old('name') }}" placeholder="John Doe">
                                                <x-input-error :messages="$errors->get('name')" class="mt-2 text-danger" />
                                            </div>

                                            <div class="col-12">
                                                <label for="inputEmailAddress" class="form-label">Email Address</label>
                                                <input type="email" class="form-control" name="email" id="inputEmailAddress" value="{{ old('email') }}" placeholder="john@example.com">
                                                <x-input-error :messages="$errors->get('email')" class="mt-2 text-danger" />
                                            </div>

                                            <div class="col-12">
                                                <label for="inputChoosePassword" class="form-label">Password</label>
                                                <div class="input-group" id="show_hide_password">
                                                    <input type="password" class="form-control border-end-0" name="password" id="inputChoosePassword" placeholder="Enter Password">
                                                    <a href="javascript:;" class="input-group-text bg-transparent"><i class="bx bx-hide"></i></a>
                                                </div>
                                                <x-input-error :messages="$errors->get('password')" class="mt-2 text-danger" />
                                            </div>

                                            <div class="col-12">
                                                <label for="inputConfirmPassword" class="form-label">Confirm Password</label>
                                                <div class="input-group" id="show_hide_password_2">
                                                    <input type="password" class="form-control border-end-0" name="password_confirmation" id="inputConfirmPassword" placeholder="Confirm Password">
                                                    <a href="javascript:;" class="input-group-text bg-transparent"><i class="bx bx-hide"></i></a>
                                                </div>
                                            </div>

                                            <div class="col-12">
                                                <div class="d-grid">
                                                    <button type="submit" class="btn btn-primary">Sign up</button>
                                                </div>
                                            </div>
                                            <div class="col-12">
                                                <div class="text-center ">
                                                    <p class="mb-0">Already have an account? <a
                                                            href="{{ route('instructor.login') }}">Log in here</a>
                                                    </p>
                                                </div>
                                            </div>
                                        </form>
                                    </div>


                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <!--end row-->
            </div>
        </div>
    </div>
    <!--end wrapper-->
    
    @include('backend.section.script')
    
    <script>
        $(document).ready(function () {
            $("#show_hide_password a").on('click', function (event) {
                event.preventDefault();
                if ($('#show_hide_password input').attr("type") == "text") {
                    $('#show_hide_password input').attr('type', 'password');
                    $('#show_hide_password i').addClass("bx-hide");
                    $('#show_hide_password i').removeClass("bx-show");
                } else if ($('#show_hide_password input').attr("type") == "password") {
                    $('#show_hide_password input').attr('type', 'text');
                    $('#show_hide_password i').removeClass("bx-hide");
                    $('#show_hide_password i').addClass("bx-show");
                }
            });

            $("#show_hide_password_2 a").on('click', function (event) {
                event.preventDefault();
                if ($('#show_hide_password_2 input').attr("type") == "text") {
                    $('#show_hide_password_2 input').attr('type', 'password');
                    $('#show_hide_password_2 i').addClass("bx-hide");
                    $('#show_hide_password_2 i').removeClass("bx-show");
                } else if ($('#show_hide_password_2 input').attr("type") == "password") {
                    $('#show_hide_password_2 input').attr('type', 'text');
                    $('#show_hide_password_2 i').removeClass("bx-hide");
                    $('#show_hide_password_2 i').addClass("bx-show");
                }
            });
        });
    </script>
</body>

</html>
