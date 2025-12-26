
<section class="footer-area bg-white pt-100px border-top">
    <div class="container">
        <div class="row g-4 justify-content-between">
            <div class="col-lg-4 col-md-6 mb-4 mb-lg-0">
                <div class="footer-item pe-lg-5">
                    <a href="{{ route('frontend.home') }}" class="d-flex align-items-center mb-4 text-decoration-none">
                        <i class="bi bi-mortarboard-fill text-theme fs-1 me-2"></i>
                        <span class="fw-bold fs-3 text-dark">skillpoint</span>
                    </a>
                    <p class="text-muted mb-4 fs-15 lh-lg">
                        Empowering learners worldwide with accessible, high-quality online education. Join our community of experts and students today.
                    </p>
                    <div class="social-links-premium d-flex gap-2">
                        <a href="#" class="social-btn"><i class="bi bi-facebook"></i></a>
                        <a href="#" class="social-btn"><i class="bi bi-twitter-x"></i></a>
                        <a href="#" class="social-btn"><i class="bi bi-instagram"></i></a>
                        <a href="#" class="social-btn"><i class="bi bi-linkedin"></i></a>
                    </div>
                </div>
            </div>

            <div class="col-lg-2 col-md-6 mb-4 mb-lg-0">
                <div class="footer-item">
                    <h5 class="fw-bold mb-4 text-dark">Company</h5>
                    <ul class="list-unstyled footer-links">
                        <li class="mb-2"><a href="#" class="text-muted text-decoration-none">About Us</a></li>
                        <li class="mb-2"><a href="#" class="text-muted text-decoration-none">Our Courses</a></li>
                        <li class="mb-2"><a href="{{ route('instructor.register') }}" class="text-muted text-decoration-none">Become an Instructor</a></li>
                        <li class="mb-2"><a href="#" class="text-muted text-decoration-none">Success Stories</a></li>
                        <li class="mb-2"><a href="#" class="text-muted text-decoration-none">Blog</a></li>
                    </ul>
                </div>
            </div>

            <div class="col-lg-2 col-md-6 mb-4 mb-lg-0">
                <div class="footer-item">
                    <h5 class="fw-bold mb-4 text-dark">Support</h5>
                    <ul class="list-unstyled footer-links">
                        <li class="mb-2"><a href="#" class="text-muted text-decoration-none">Help Center</a></li>
                        <li class="mb-2"><a href="#" class="text-muted text-decoration-none">Contact Us</a></li>
                        <li class="mb-2"><a href="#" class="text-muted text-decoration-none">Privacy Policy</a></li>
                        <li class="mb-2"><a href="#" class="text-muted text-decoration-none">Terms of Service</a></li>
                        <li class="mb-2"><a href="#" class="text-muted text-decoration-none">Cookie Policy</a></li>
                    </ul>
                </div>
            </div>

            <div class="col-lg-3 col-md-6">
                <div class="footer-item instructor-panel-cta p-4 rounded-4 bg-light border border-dashed">
                    <h6 class="fw-bold mb-2">Teaching Dashboard</h6>
                    <p class="small text-muted mb-3">Login to manage your students and courses.</p>
                    <a href="{{ route('instructor.login') }}" class="btn btn-theme w-100 py-2 rounded-3 text-white">
                        Instructor Login <i class="bi bi-arrow-right-short"></i>
                    </a>
                </div>
            </div>
        </div>
    </div>
    
    <div class="container mt-5">
        <div class="border-top py-4 text-center">
            <p class="mb-0 text-muted small">
                &copy; {{ date('Y') }} SkillPoint Learning. Designed for Modern Education.
            </p>
        </div>
    </div>
</section>

<style>
.footer-links a:hover {
    color: var(--theme-color) !important;
    padding-left: 5px;
    transition: all 0.3s ease;
}

.social-btn {
    width: 38px;
    height: 38px;
    display: flex;
    align-items: center;
    justify-content: center;
    background: #f8f9fa;
    border-radius: 10px;
    color: #444;
    text-decoration: none;
    transition: all 0.3s ease;
    border: 1px solid #eee;
}

.social-btn:hover {
    background: #2D58FF;
    color: #fff;
    transform: translateY(-3px);
    border-color: #2D58FF;
}

.border-dashed {
    border-style: dashed !important;
}

@media (max-width: 991px) {
    .footer-area {
        padding-top: 60px;
        text-align: center;
    }
    .social-links-premium {
        justify-content: center;
    }
    .instructor-panel-cta {
        margin-top: 20px;
    }
}
</style>
