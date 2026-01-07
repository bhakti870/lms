<div class="modal fade" id="editMaterialModal{{ $material->id }}" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Edit Resource Material</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="{{ route('instructor.instructor.material.update', $material->id) }}" method="POST" enctype="multipart/form-data">
                @csrf
                <div class="modal-body">
                    <div class="mb-3">
                        <label class="form-label">Material Title</label>
                        <input type="text" name="material_title" class="form-control" value="{{ $material->material_title }}" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Type</label>
                        <select name="type" class="form-select material-type-select-edit" required>
                            <option value="pdf" {{ $material->type == 'pdf' ? 'selected' : '' }}>PDF Document</option>
                            <option value="link" {{ $material->type == 'link' ? 'selected' : '' }}>External Link</option>
                            <option value="file" {{ $material->type == 'file' ? 'selected' : '' }}>Other File</option>
                        </select>
                    </div>
                    <div class="mb-3 file-input-group-edit" style="{{ $material->type == 'link' ? 'display:none;' : '' }}">
                        <label class="form-label">File (Leave blank to keep current)</label>
                        <input type="file" name="file" class="form-control">
                        @if($material->file_path)
                            <small class="text-muted">Current: <a href="{{ asset($material->file_path) }}" target="_blank">View File</a></small>
                        @endif
                    </div>
                    <div class="mb-3 link-input-group-edit" style="{{ $material->type != 'link' ? 'display:none;' : '' }}">
                        <label class="form-label">Link URL</label>
                        <input type="url" name="external_url" class="form-control" value="{{ $material->external_url }}" placeholder="https://example.com">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Update Material</button>
                </div>
            </form>
        </div>
    </div>
</div>
