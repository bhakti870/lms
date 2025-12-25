@extends('frontend.master')

@section('content')
@include('frontend.section.breadcrumb', ['title' => 'Account Settings'])

<section class="py-5 bg-light">
    <div class="container">
        <div class="row g-4">
            <!-- Sidebar -->
            <div class="col-lg-4 col-xl-3">
                @include('frontend.dashboard.user_dashboard_sidebar')
            </div>

            <!-- Content -->
            <div class="col-lg-8 col-xl-9">
                <div class="card border-0 shadow-sm rounded-4 overflow-hidden">
                    <div class="card-header bg-white border-bottom p-0">
                        <ul class="nav nav-tabs nav-fill border-0" id="profileTabs" role="tablist">
                            <li class="nav-item border-end" role="presentation">
                                <button class="nav-link active py-3 fw-bold border-0 rounded-0" id="edit-profile-tab" data-bs-toggle="tab" data-bs-target="#edit-profile" type="button" role="tab" aria-controls="edit-profile" aria-selected="true">
                                    <i class="bi bi-person-badge me-2"></i> Manage Profile
                                </button>
                            </li>
                            <li class="nav-item" role="presentation">
                                <button class="nav-link py-3 fw-bold border-0 rounded-0" id="password-tab" data-bs-toggle="tab" data-bs-target="#password" type="button" role="tab" aria-controls="password" aria-selected="false">
                                    <i class="bi bi-shield-lock me-2"></i> Change Password
                                </button>
                            </li>
                        </ul>
                    </div>
                    <div class="card-body p-4 p-md-5">
                        <div class="tab-content" id="profileTabsContent">
                            <!-- Profile Tab -->
                            <div class="tab-pane fade show active" id="edit-profile" role="tabpanel" aria-labelledby="edit-profile-tab">
                                <form method="POST" action="{{ route('user.profile.store') }}" enctype="multipart/form-data">
                                    @csrf
                                    <div class="row g-4 align-items-center mb-5 pb-4 border-bottom">
                                        <div class="col-auto">
                                            <div class="position-relative">
                                                <img id="showImage" src="{{ auth()->user()->photo ? asset(auth()->user()->photo) : asset('frontend/images/small-avatar-1.jpg') }}" alt="User image" class="rounded-circle border shadow-sm object-fit-cover" style="width: 120px; height: 120px;">
                                                <label for="image" class="btn btn-theme btn-theme-sm position-absolute bottom-0 end-0 rounded-circle p-2 shadow" title="Change Photo">
                                                    <i class="bi bi-camera-fill text-white"></i>
                                                </label>
                                                <input type="file" name="photo" id="image" class="d-none">
                                            </div>
                                        </div>
                                        <div class="col">
                                            <h5 class="fw-bold mb-1">Profile Picture</h5>
                                            <p class="text-muted small mb-0">JPEG, PNG or WEBP. Max size 2MB.</p>
                                        </div>
                                    </div>

                                    <div class="row g-4">
                                        <div class="col-md-6">
                                            <label class="form-label fw-bold small text-muted text-uppercase">Full Name</label>
                                            <input class="form-control form-control-lg bg-light border-0" type="text" name="name" value="{{ auth()->user()->name }}" placeholder="Your full name">
                                        </div>
                                        <div class="col-md-6">
                                            <label class="form-label fw-bold small text-muted text-uppercase">Username</label>
                                            <input class="form-control form-control-lg bg-light border-0" type="text" name="username" value="{{ auth()->user()->username }}" placeholder="Choose a username">
                                        </div>
                                        <div class="col-md-6">
                                            <label class="form-label fw-bold small text-muted text-uppercase">Email Address</label>
                                            <input class="form-control form-control-lg bg-white border" type="email" value="{{ auth()->user()->email }}" disabled>
                                            <div class="form-text small">Email cannot be changed for security.</div>
                                        </div>
                                        <div class="col-md-6">
                                            <label class="form-label fw-bold small text-muted text-uppercase">Phone Number</label>
                                            <input class="form-control form-control-lg bg-light border-0" type="text" name="phone" value="{{ auth()->user()->phone }}" placeholder="Your contact number">
                                        </div>
                                        <div class="col-12">
                                            <label class="form-label fw-bold small text-muted text-uppercase">Address</label>
                                            <textarea class="form-control bg-light border-0" name="address" rows="3" placeholder="Street, City, Country">{{ auth()->user()->address }}</textarea>
                                        </div>
                                        <div class="col-12 mt-4 text-end">
                                            <button class="btn btn-theme px-5 py-3 rounded-pill text-white fw-bold shadow-theme" type="submit">
                                                Save Changes
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>

                            <!-- Password Tab -->
                            <div class="tab-pane fade" id="password" role="tabpanel" aria-labelledby="password-tab">
                                <form method="POST" action="{{ route('user.passwordSetting') }}">
                                    @csrf
                                    <div class="row g-4 text-center mb-4">
                                        <div class="col-12">
                                            <div class="bg-theme-subtle p-4 rounded-4 d-inline-block mb-3">
                                                <i class="bi bi-shield-lock-fill text-theme fs-1"></i>
                                            </div>
                                            <h5 class="fw-bold">Security Settings</h5>
                                            <p class="text-muted small">Update your account password regularly to keep it secure.</p>
                                        </div>
                                    </div>
                                    
                                    <div class="row g-4">
                                        <div class="col-12">
                                            <label class="form-label fw-bold small text-muted text-uppercase">Current Password</label>
                                            <input class="form-control form-control-lg bg-light border-0" type="password" name="current_password" placeholder="••••••••" required>
                                            @error('current_password')
                                                <small class="text-danger mt-1 d-block">{{ $message }}</small>
                                            @enderror
                                        </div>
                                        <div class="col-md-6">
                                            <label class="form-label fw-bold small text-muted text-uppercase">New Password</label>
                                            <input class="form-control form-control-lg bg-light border-0" type="password" name="new_password" placeholder="••••••••" required>
                                            @error('new_password')
                                                <small class="text-danger mt-1 d-block">{{ $message }}</small>
                                            @enderror
                                        </div>
                                        <div class="col-md-6">
                                            <label class="form-label fw-bold small text-muted text-uppercase">Confirm New Password</label>
                                            <input class="form-control form-control-lg bg-light border-0" type="password" name="new_password_confirmation" placeholder="••••••••" required>
                                        </div>
                                        <div class="col-12 mt-4 text-end">
                                            <button class="btn btn-theme px-5 py-3 rounded-pill text-white fw-bold shadow-theme" type="submit">
                                                Update Password
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

@push('scripts')
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

        // Handle URL hash for tabs
        let hash = window.location.hash;
        if (hash === '#password') {
            const btn = document.querySelector('#password-tab');
            if (btn) btn.click();
        }
    });
</script>
@endpush
@endsection
