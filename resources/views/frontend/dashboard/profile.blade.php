@extends('frontend.master')

@section('content')
@include('frontend.section.breadcrumb', ['title' => 'Account Settings'])

<section class="dashboard-area pt-60px pb-120px">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-10">
                <div class="card border-0 shadow-sm p-4">
                    <ul class="nav nav-tabs generic-tab pb-30px border-0" id="myTab" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active" id="edit-profile-tab" data-toggle="tab" href="#edit-profile" role="tab" aria-controls="edit-profile" aria-selected="false">Manage Profile</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="password-tab" data-toggle="tab" href="#password" role="tab" aria-controls="password" aria-selected="true">Change Password</a>
                        </li>
                    </ul>

                    <div class="tab-content" id="myTabContent">
                        <!-- Profile Tab -->
                        <div class="tab-pane fade show active" id="edit-profile" role="tabpanel" aria-labelledby="edit-profile-tab">
                            <form method="POST" action="{{ route('user.profile.store') }}" enctype="multipart/form-data" class="row">
                                @csrf
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <div class="media media-card align-items-center mb-4 pb-4 border-bottom">
                                            <div class="media-img" style="width: 100px; height: 100px;">
                                                <img id="showImage" src="{{ auth()->user()->photo ? asset(auth()->user()->photo) : asset('frontend/images/small-avatar-1.jpg') }}" alt="User image" class="rounded-full shadow-sm img-fluid h-100">
                                            </div>
                                            <div class="media-body ml-4">
                                                <h5 class="fs-18 font-weight-semi-bold">Profile Photo</h5>
                                                <p class="fs-14 lh-20 text-gray pt-1">Update your profile picture. Accept JPEG, PNG (Max 2MB)</p>
                                                <div class="file-upload-wrap pt-3">
                                                    <input type="file" name="photo" id="image" class="multi file-upload-input">
                                                    <span class="file-upload-text"><i class="la la-cloud-upload mr-2"></i>Choose a file</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label class="label-text">Full Name</label>
                                        <input class="form-control form--control" type="text" name="name" value="{{ auth()->user()->name }}">
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label class="label-text">User Name</label>
                                        <input class="form-control form--control" type="text" name="username" value="{{ auth()->user()->username }}">
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label class="label-text">Email Address</label>
                                        <input class="form-control form--control" type="email" value="{{ auth()->user()->email }}" disabled>
                                        <small class="text-muted">Email cannot be changed.</small>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label class="label-text">Phone Number</label>
                                        <input class="form-control form--control" type="text" name="phone" value="{{ auth()->user()->phone }}">
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <label class="label-text">Address</label>
                                        <input class="form-control form--control" type="text" name="address" value="{{ auth()->user()->address }}">
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <button class="btn theme-btn" type="submit">Update Profile</button>
                                </div>
                            </form>
                        </div>

                        <!-- Password Tab -->
                        <div class="tab-pane fade" id="password" role="tabpanel" aria-labelledby="password-tab">
                            <form method="POST" action="{{ route('user.passwordSetting') }}" class="row">
                                @csrf
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <label class="label-text">Current Password</label>
                                        <input class="form-control form--control" type="password" name="old_password" placeholder="Enter current password">
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label class="label-text">New Password</label>
                                        <input class="form-control form--control" type="password" name="new_password" placeholder="Enter new password">
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label class="label-text">Confirm New Password</label>
                                        <input class="form-control form--control" type="password" name="new_password_confirmation" placeholder="Confirm new password">
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <button class="btn theme-btn" type="submit">Change Password</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<script type="text/javascript">
    document.addEventListener('DOMContentLoaded', function() {
        const imageInput = document.getElementById('image');
        const showImage = document.getElementById('showImage');
        if (imageInput && showImage) {
            imageInput.onchange = evt => {
                const [file] = imageInput.files;
                if (file) {
                    showImage.src = URL.createObjectURL(file);
                }
            }
        }
    });
</script>
@endsection
