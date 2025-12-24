<div class="modal" id="course-edit-{{ $lecture->id }}">
    <div class="modal-dialog modal-dialog-centered modal-xl modal-dialog-scrollable">
        <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">Update Lecture</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>

            <!-- Modal body -->
            <div class="modal-body">
                <form method="post" action="{{ route('instructor.lecture.update', $lecture->id) }}"
                    enctype="multipart/form-data">
                    @csrf
                    @method('PUT')
                    <input type="hidden" name="course_id" value="{{ $course->id }}" />
                    <input type="hidden" name="section_id" value="{{ $data->id }}" />
                    <div class="col-md-12">
                        <label for="lecture_title" class="form-label">Lecture
                            Title</label>
                        <input type="text" class="form-control" name="lecture_title" id="lecture-title"
                            value="{{ $lecture->lecture_title }}" placeholder="Enter the lecture title" required>
                    </div>



                    <div class="col-md-12 mt-3">
                        <label for="url" class="form-label">YouTube Video URL</label>
                        <input type="url" class="form-control video_url" name="url" placeholder="Enter the YouTube video URL"
                            value="{{ old('url', $lecture->url) }}">
                        <iframe class="videoPreview" style="margin-top: 15px; width: 100%; height: 400px; display: none;"
                            frameborder="0" allowfullscreen></iframe>
                    </div>

                    <div class="col-md-12 mt-3">
                        <label for="video_duration" class="form-label">Video Duration (Minutes)</label>
                        <input type="number" step="0.01" class="form-control" name="video_duration" value="{{ old('video_duration', $lecture->video_duration) }}" id="video_duration" />
                    </div>

                    <div class="col-md-12 mt-3">
                        <div class="form-check form-switch">
                            <input class="form-check-input live-class-toggle-edit" type="checkbox" name="is_live" value="1" id="is_live_edit{{ $lecture->id }}" {{ $lecture->is_live ? 'checked' : '' }}>
                            <label class="form-check-label" for="is_live_edit{{ $lecture->id }}">Is this a Live Class?</label>
                        </div>
                    </div>

                    <div class="live-class-fields-edit" id="live_fields_edit{{ $lecture->id }}" style="display: {{ $lecture->is_live ? 'block' : 'none' }};">
                        <div class="col-md-12 mt-3">
                            <label for="live_link" class="form-label">Live Class Link (Zoom/Meet)</label>
                            <input type="url" class="form-control" name="live_link" value="{{ $lecture->live_link }}" placeholder="https://zoom.us/j/...">
                        </div>
                        <div class="row">
                            <div class="col-md-6 mt-3">
                                <label for="live_id" class="form-label">Meeting ID</label>
                                <input type="text" class="form-control" name="live_id" value="{{ $lecture->live_id }}" placeholder="Meeting ID">
                            </div>
                            <div class="col-md-6 mt-3">
                                <label for="live_password" class="form-label">Meeting Password</label>
                                <input type="text" class="form-control" name="live_password" value="{{ $lecture->live_password }}" placeholder="Meeting Password">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 mt-3">
                                <label for="live_date" class="form-label">Scheduled Date</label>
                                <input type="date" class="form-control" name="live_date" value="{{ $lecture->live_date }}">
                            </div>
                            <div class="col-md-6 mt-3">
                                <label for="live_time" class="form-label">Scheduled Time</label>
                                <input type="time" class="form-control" name="live_time" value="{{ $lecture->live_time }}">
                            </div>
                        </div>
                    </div>

                    <div class="col-md-12 mt-3">
                        <label for="content" class="form-label">Lecture Notes/Content</label>
                        <textarea class="form-control editor" name="content">{{ $lecture->content }}</textarea>
                    </div>


                    <div class="mt-3">
                        <button type="submit" class="btn btn-primary w-100">Update</button>
                </form>
            </div>



        </div>
    </div>
</div>


@push('scripts')
<script>


document.addEventListener("DOMContentLoaded", function () {
    let videoInputs = document.querySelectorAll(".video_url"); // সব ভিডিও ইনপুট খুঁজে বের করো

    videoInputs.forEach(videoInput => {
        let videoPreview = videoInput.closest('.col-md-12').querySelector(".videoPreview"); // সংশ্লিষ্ট প্রিভিউ iframe

        // ইউটিউব ভিডিও আইডি এক্সট্রাক্ট ফাংশন
        function extractYouTubeVideoID(url) {
            let regex = /(?:https?:\/\/)?(?:www\.)?(?:youtube\.com\/(?:[^\/\n\s]+\/\S+\/|(?:v|e(?:mbed)?)\/|.*[?&]v=)|youtu\.be\/)([^"&?\/\s]{11})/;
            let match = url.match(regex);
            return match ? match[1] : null;
        }

        // ভিডিও প্রিভিউ আপডেট ফাংশন
        function updateVideoPreview() {
            let url = videoInput.value;
            let videoId = extractYouTubeVideoID(url);

            if (videoId) {
                videoPreview.src = `https://www.youtube.com/embed/${videoId}`;
                videoPreview.style.display = "block";
            } else {
                videoPreview.src = "";
                videoPreview.style.display = "none";
            }
        }

        // ইনপুট পরিবর্তন হলে প্রিভিউ আপডেট করো
        videoInput.addEventListener("input", updateVideoPreview);

        // Live Class Toggle Logic for Edit
        let modal = videoInput.closest('.modal');
        let liveToggle = modal.querySelector(".live-class-toggle-edit");
        let liveFields = modal.querySelector(".live-class-fields-edit");

        if (liveToggle) {
            liveToggle.addEventListener("change", function () {
                if (this.checked) {
                    liveFields.style.display = "block";
                } else {
                    liveFields.style.display = "none";
                }
            });
        }

        // প্রথমবার যদি ভিডিও ইউআরএল থাকে, তাহলে প্রিভিউ দেখাও
        if (videoInput.value.trim() !== "") {
            updateVideoPreview();
        }
    });
});



</script>
@endpush


