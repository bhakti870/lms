<section class="stats-section py-5">
    <div class="container">
        <div class="row justify-content-center g-0">
            @php
                $wrappers = ['', 'wrap2', 'wrap3', 'wrap4'];
                $delays = [300, 450, 550, 650];
            @endphp

            @forelse($all_info as $index => $info)
                <div class="col-lg-3 col-sm-6" data-aos="fade-up" data-aos-delay="{{ $delays[$index % 4] }}">
                    <div class="ot-fun-box-item {{ $wrappers[$index % 4] }}">
                        <div class="content">
                            <div class="d-flex align-items-center justify-content-center">
                                <h3 class="counter">{{ $info->title }}</h3>
                            </div>
                            <p>{{ $info->description }}</p>
                        </div>
                    </div>
                </div>
            @empty
                {{-- Fallback Stats if no info boxes --}}
                <div class="col-lg-3 col-sm-6" data-aos="fade-up" data-aos-delay="300">
                    <div class="ot-fun-box-item">
                        <div class="content">
                            <div class="d-flex align-items-center justify-content-center">
                                <h3 class="counter">6.8</h3>
                                <h3 class="sub">M+</h3>
                            </div>
                            <p>Active Learners</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-sm-6" data-aos="fade-up" data-aos-delay="450">
                    <div class="ot-fun-box-item wrap2">
                        <div class="content">
                            <div class="d-flex align-items-center justify-content-center">
                                <h3 class="counter">7.5</h3>
                                <h3 class="sub">K+</h3>
                            </div>
                            <p>Courses Available</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-sm-6" data-aos="fade-up" data-aos-delay="550">
                    <div class="ot-fun-box-item wrap3">
                        <div class="content">
                            <div class="d-flex align-items-center justify-content-center">
                                <h3 class="counter">120</h3>
                                <h3 class="sub">+</h3>
                            </div>
                            <p>Countries Reached</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-sm-6" data-aos="fade-up" data-aos-delay="650">
                    <div class="ot-fun-box-item wrap4">
                        <div class="content">
                            <div class="d-flex align-items-center justify-content-center">
                                <h3 class="counter">4.9</h3>
                            </div>
                            <p>Avg Course Rating</p>
                        </div>
                    </div>
                </div>
            @endforelse

        </div>
    </div>
</section>
