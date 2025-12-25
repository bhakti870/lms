<section class="py-5 bg-light border-bottom">
    <div class="container mt-4">
        <div class="row align-items-center">
            <div class="col-md-6">
                <h1 class="fw-bold mb-2">{{ $title }}</h1>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb mb-0">
                        <li class="breadcrumb-item"><a href="{{ route('frontend.home') }}" class="text-theme text-decoration-none">Home</a></li>
                        <li class="breadcrumb-item active" aria-current="page">{{ $title }}</li>
                    </ol>
                </nav>
            </div>
            <div class="col-md-6 text-md-end d-none d-md-block">
                <i class="bi bi-mortarboard text-theme opacity-25" style="font-size: 4rem;"></i>
            </div>
        </div>
    </div>
</section>

