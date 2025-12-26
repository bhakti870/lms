 <!-- course section Modal -->
 <div class="modal" id="myModal">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">Add Section</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>

            <!-- Modal body -->
            <div class="modal-body">
                <form id="create-section-form" method="post" action="{{ route('instructor.course-section.store') }}">
                    @csrf
                    <input type="hidden" name="course_id" value="{{ $course->id }}" />
                    <div class="">
                        <label for="section" class="form-label">Section Title</label>
                        <input type="text" class="form-control" name="section_title" id="section-title"
                            placeholder="Enter the section">
                    </div>

                </form>
            </div>

            <!-- Modal Footer -->
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="submit" form="create-section-form" class="btn btn-primary">Submit</button>
            </div>



        </div>
    </div>
</div>
