  <section class="stats-section py-5">
        <div class="container">
            <div class="row justify-content-center g-0">

                <div class="col-lg-3 col-sm-6" data-aos="fade-up" data-aos-delay="300">
                    <div class="ot-fun-box-item">
                        <div class="content">
                            <div class="d-flex align-items-center justify-content-center">
                                <h3 class="counter">{{ $active_learners_count }}</h3>
                            </div>
                            <p>Active Learners</p>
                        </div>
                    </div>
                </div>

                <div class="col-lg-3 col-sm-6" data-aos="fade-up" data-aos-delay="450">
                    <div class="ot-fun-box-item wrap2">
                        <div class="content">
                            <div class="d-flex align-items-center justify-content-center">
                                <h3 class="counter">{{ $courses_count }}</h3>
                            </div>
                            <p>Courses Available</p>
                        </div>
                    </div>
                </div>

                <div class="col-lg-3 col-sm-6" data-aos="fade-up" data-aos-delay="550">
                    <div class="ot-fun-box-item wrap3">
                        <div class="content">
                            <div class="d-flex align-items-center justify-content-center">
                                <h3 class="counter">{{ $countries_count }}</h3>
                            </div>
                            <p>Countries Reached</p>
                        </div>
                    </div>
                </div>

                <div class="col-lg-3 col-sm-6" data-aos="fade-up" data-aos-delay="650">
                    <div class="ot-fun-box-item wrap4">
                        <div class="content">
                            <div class="d-flex align-items-center justify-content-center">
                                <h3 class="counter">{{ number_format($average_rating, 1) }}</h3>
                            </div>
                            <p>Avg Course Rating</p>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </section>