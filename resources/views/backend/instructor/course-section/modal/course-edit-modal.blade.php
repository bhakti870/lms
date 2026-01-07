<div class="modal" id="course-edit-{{ $lecture->id }}">
    <div class="modal-dialog modal-dialog-centered modal-lg modal-dialog-scrollable" style="max-height: 90vh;">
        <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">Update Lecture</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>

            <!-- Modal body -->
            <div class="modal-body">
                <form id="lecture-edit-form-{{ $lecture->id }}" method="post" action="{{ route('instructor.lecture.update', $lecture->id) }}"
                    enctype="multipart/form-data">
                    @csrf
                    @method('PUT')
                    <input type="hidden" name="course_id" value="{{ $course->id }}" />
                    <input type="hidden" name="section_id" value="{{ $data->id }}" />
                    
                    <div class="col-md-12">
                        <label for="lecture-title-{{ $lecture->id }}" class="form-label">Lecture Title</label>
                        <input type="text" class="form-control @error('lecture_title') is-invalid @enderror" name="lecture_title" id="lecture-title-{{ $lecture->id }}"
                            value="{{ old('lecture_title', $lecture->lecture_title) }}" placeholder="Enter the lecture title" required>
                        @error('lecture_title')
                            <span class="text-danger small">{{ $message }}</span>
                        @enderror
                    </div>

                    <div class="col-md-12 mt-3">
                        <label for="url-{{ $lecture->id }}" class="form-label">YouTube Video URL</label>
                        <input type="url" class="form-control video_url @error('url') is-invalid @enderror" name="url" id="url-{{ $lecture->id }}" placeholder="Enter the YouTube video URL"
                            value="{{ old('url', $lecture->url) }}">
                        @error('url')
                            <span class="text-danger small">{{ $message }}</span>
                        @enderror
                        <iframe class="videoPreview" style="margin-top: 15px; width: 100%; height: 250px; display: {{ $lecture->url ? 'block' : 'none' }};"
                            src="{{ $lecture->url ? 'https://www.youtube.com/embed/' . Str::after($lecture->url, 'v=') : '' }}"
                            frameborder="0" allowfullscreen></iframe>
                    </div>

                    <div class="col-md-12 mt-3">
                        <label for="video_duration-{{ $lecture->id }}" class="form-label">Video Duration (Minutes)</label>
                        <input type="number" step="0.01" class="form-control @error('video_duration') is-invalid @enderror" name="video_duration" 
                            value="{{ old('video_duration', $lecture->video_duration) }}" id="video_duration-{{ $lecture->id }}" />
                    </div>

                    <div class="col-md-12 mt-3">
                        <div class="form-check form-switch">
                            <input class="form-check-input live-class-toggle-edit" type="checkbox" name="is_live" value="1" id="is_live_edit{{ $lecture->id }}" {{ old('is_live', $lecture->is_live) ? 'checked' : '' }}>
                            <label class="form-check-label" for="is_live_edit{{ $lecture->id }}">Is this a Live Class?</label>
                        </div>
                    </div>

                    <div class="live-class-fields-edit" id="live_fields_edit{{ $lecture->id }}" style="display: {{ old('is_live', $lecture->is_live) ? 'block' : 'none' }};">
                        <div class="col-md-12 mt-3">
                            <label for="live_link-{{ $lecture->id }}" class="form-label">Live Class Link (Zoom/Meet)</label>
                            <input type="url" class="form-control @error('live_link') is-invalid @enderror" name="live_link" id="live_link-{{ $lecture->id }}"
                                value="{{ old('live_link', $lecture->live_link) }}" placeholder="https://zoom.us/j/...">
                            @error('live_link')
                                <span class="text-danger small">{{ $message }}</span>
                            @enderror
                        </div>
                        <div class="row">
                            <div class="col-md-6 mt-3">
                                <label for="live_id-{{ $lecture->id }}" class="form-label">Meeting ID</label>
                                <input type="text" class="form-control" name="live_id" id="live_id-{{ $lecture->id }}"
                                    value="{{ old('live_id', $lecture->live_id) }}" placeholder="Meeting ID">
                            </div>
                            <div class="col-md-6 mt-3">
                                <label for="live_password-{{ $lecture->id }}" class="form-label">Meeting Password</label>
                                <input type="text" class="form-control" name="live_password" id="live_password-{{ $lecture->id }}"
                                    value="{{ old('live_password', $lecture->live_password) }}" placeholder="Meeting Password">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 mt-3">
                                <label for="live_date-{{ $lecture->id }}" class="form-label">Scheduled Date</label>
                                <input type="date" class="form-control @error('live_date') is-invalid @enderror" name="live_date" id="live_date-{{ $lecture->id }}"
                                    value="{{ old('live_date', $lecture->live_date) }}">
                                @error('live_date')
                                    <span class="text-danger small">{{ $message }}</span>
                                @enderror
                            </div>
                            <div class="col-md-6 mt-3">
                                <label for="live_time-{{ $lecture->id }}" class="form-label">Scheduled Time</label>
                                <input type="time" class="form-control" name="live_time" id="live_time-{{ $lecture->id }}"
                                    value="{{ old('live_time', $lecture->live_time) }}">
                            </div>
                        </div>
                    </div>

                    <div class="col-md-12 mt-3">
                        <label for="content-{{ $lecture->id }}" class="form-label">Lecture Notes/Content</label>
                        <textarea class="form-control editor @error('content') is-invalid @enderror" name="content" id="content-{{ $lecture->id }}">{{ old('content', $lecture->content) }}</textarea>
                         @error('content')
                            <span class="text-danger small">{{ $message }}</span>
                        @enderror
                    </div>

                </form>
            </div>

            <!-- Modal Footer -->
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="submit" form="lecture-edit-form-{{ $lecture->id }}" class="btn btn-primary">Update</button>
            </div>

        </div>
    </div>
</div>





