<div class="modal" id="course-{{ $data->id }}">
    <div class="modal-dialog modal-dialog-centered modal-xl modal-dialog-scrollable">
        <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">Add Lecture</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>

            <!-- Modal body -->
            <div class="modal-body">
                <form method="post" action="{{ route('instructor.lecture.store') }}" enctype="multipart/form-data">
                    @csrf
                    <input type="hidden" name="course_id" value="{{ $course->id }}" />
                    <input type="hidden" name="section_id" value="{{ $data->id }}" />
                    <div class="col-md-12">
                        <label for="lecture_title" class="form-label">Lecture Title</label>
                        <input type="text" class="form-control" name="lecture_title" id="lecture-title"
                            placeholder="Enter the lecture title" required>
                    </div>



                    <div class="col-md-12 mt-3">
                        <label for="url" class="form-label">YouTube Video URL</label>
                        <input type="url" class="form-control" name="url" id="video_url"
                            placeholder="Enter the YouTube video URL" value="{{ old('url') }}">
                        <iframe id="videoPreview" style="margin-top: 15px; display: none; width: 100%; height: 400px;"
                            frameborder="0" allowfullscreen></iframe>
                    </div>

                    <div class="col-md-12 mt-3">
                        <label for="video_duration" class="form-label">Video Duration (Minutes)</label>
                        <input type="number" step="0.01" class="form-control" name="video_duration" value="{{ old('video_duration') }}" id="video_duration" />
                    </div>

                    <div class="col-md-12 mt-3">
                        <div class="form-check form-switch">
                            <input class="form-check-input live-class-toggle" type="checkbox" name="is_live" value="1" id="is_live{{ $data->id }}">
                            <label class="form-check-label" for="is_live{{ $data->id }}">Is this a Live Class?</label>
                        </div>
                    </div>

                    <div class="live-class-fields" id="live_fields{{ $data->id }}" style="display: none;">
                        <div class="col-md-12 mt-3">
                            <label for="live_link" class="form-label">Live Class Link (Zoom/Meet)</label>
                            <input type="url" class="form-control" name="live_link" placeholder="https://zoom.us/j/...">
                        </div>
                        <div class="row">
                            <div class="col-md-6 mt-3">
                                <label for="live_id" class="form-label">Meeting ID</label>
                                <input type="text" class="form-control" name="live_id" placeholder="Meeting ID">
                            </div>
                            <div class="col-md-6 mt-3">
                                <label for="live_password" class="form-label">Meeting Password</label>
                                <input type="text" class="form-control" name="live_password" placeholder="Meeting Password">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 mt-3">
                                <label for="live_date" class="form-label">Scheduled Date</label>
                                <input type="date" class="form-control" name="live_date">
                            </div>
                            <div class="col-md-6 mt-3">
                                <label for="live_time" class="form-label">Scheduled Time</label>
                                <input type="time" class="form-control" name="live_time">
                            </div>
                        </div>
                    </div>

                    <div class="col-md-12 mt-3">
                        <label for="content" class="form-label">Lecture Notes/Content</label>
                        <textarea class="form-control editor" name="content"></textarea>
                    </div>


                    <div class="mt-3">
                        <button type="submit" class="btn btn-primary w-100">Submit</button>
                    </div>
                </form>
            </div>



        </div>
    </div>
</div>



@push('scripts')
<script>
    document.addEventListener("DOMContentLoaded", function () {
        let modal = document.getElementById("course-{{ $data->id }}");
        let videoInput = modal.querySelector("#video_url");
        let videoPreview = modal.querySelector("#videoPreview");

        modal.addEventListener("shown.bs.modal", function () {
            let liveToggle = modal.querySelector(".live-class-toggle");
            let liveFields = modal.querySelector(".live-class-fields");

            liveToggle.addEventListener("change", function () {
                if (this.checked) {
                    liveFields.style.display = "block";
                } else {
                    liveFields.style.display = "none";
                }
            });

            videoInput.addEventListener("input", function () {
                let url = videoInput.value;
                let videoId = extractYouTubeVideoID(url);

                if (videoId) {
                    videoPreview.src = `https://www.youtube.com/embed/${videoId}`;
                    videoPreview.style.display = "block";
                } else {
                    videoPreview.src = "";
                    videoPreview.style.display = "none";
                }
            });
        });

        modal.addEventListener("hidden.bs.modal", function () {
            videoPreview.src = ""; // Reset video when modal closes
            videoPreview.style.display = "none";
        });

        function extractYouTubeVideoID(url) {
            let regex = /(?:https?:\/\/)?(?:www\.)?(?:youtube\.com\/(?:[^\/\n\s]+\/\S+\/|(?:v|e(?:mbed)?)\/|.*[?&]v=)|youtu\.be\/)([^"&?\/\s]{11})/;
            let match = url.match(regex);
            return match ? match[1] : null;
        }
    });
</script>
@endpush

