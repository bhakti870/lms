<section class="py-5 bg-light">
    <div class="container mb-4">
        <h3 class="text-center fw-bold">Our Course Categories</h3>
        <p class="text-center text-muted">Explore our latest series and collections</p>
    </div>

    <div class="marquee__track">
        <div class="marquee__grid">
            @foreach($all_categories as $item)
                <div class="marquee_card">
                    <div class="card-icon-top">
                        <a href="{{ route('all.courses', ['categories[]' => $item->id]) }}">
                            <img src="{{ $item->image ? asset($item->image) : 'https://placehold.co/80x80/5b50d6/ffffff?text=' . urlencode($item->name) }}" alt="{{ $item->name }}">
                        </a>
                    </div>
                    <div class="pixel-card-inner">
                        <h4 class="course-title">
                            <a href="{{ route('all.courses', ['categories[]' => $item->id]) }}" class="text-reset text-decoration-none">{{ $item->name }}</a>
                        </h4>
                        <p class="instructor-text">Explore <span class="text-theme">Premium Courses</span></p>

                        <hr class="card-divider">

                        <div class="meta-list">
                            <div class="meta-item">
                                <i class="bi bi-collection-play meta-icon"></i> 
                                <span>
                                    {{ \App\Models\Course::where('category_id', $item->id)->count() }} Episodes
                                </span>
                            </div>
                            <div class="meta-item">
                                <i class="bi bi-bar-chart-fill meta-icon"></i> 
                                <span>All Levels</span>
                            </div>
                            <div class="meta-item">
                                <i class="bi bi-folder meta-icon"></i> 
                                <span>{{ $item->name }}</span>
                            </div>
                        </div>
                    </div>
                </div>
            @endforeach

            {{-- Duplicate for smooth marquee --}}
            @foreach($all_categories as $item)
                <div class="marquee_card">
                    <div class="card-icon-top">
                        <a href="{{ route('all.courses', ['categories[]' => $item->id]) }}">
                            <img src="{{ $item->image ? asset($item->image) : 'https://placehold.co/80x80/5b50d6/ffffff?text=' . urlencode($item->name) }}" alt="{{ $item->name }}">
                        </a>
                    </div>
                    <div class="pixel-card-inner">
                        <h4 class="course-title">
                            <a href="{{ route('all.courses', ['categories[]' => $item->id]) }}" class="text-reset text-decoration-none">{{ $item->name }}</a>
                        </h4>
                        <p class="instructor-text">Explore <span class="text-theme">Premium Courses</span></p>

                        <hr class="card-divider">

                        <div class="meta-list">
                            <div class="meta-item">
                                <i class="bi bi-collection-play meta-icon"></i> 
                                <span>
                                    {{ \App\Models\Course::where('category_id', $item->id)->count() }} Episodes
                                </span>
                            </div>
                            <div class="meta-item">
                                <i class="bi bi-bar-chart-fill meta-icon"></i> 
                                <span>All Levels</span>
                            </div>
                            <div class="meta-item">
                                <i class="bi bi-folder meta-icon"></i> 
                                <span>{{ $item->name }}</span>
                            </div>
                        </div>
                    </div>
                </div>
            @endforeach
        </div>
    </div>
</section>

