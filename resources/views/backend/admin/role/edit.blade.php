@extends('backend.admin.master')

@section('content')
    <div class="page-content">
        @include('backend.section.breadcrumb', ['title' => 'Roles', 'sub_title' => 'Edit Role'])

        <div class="row">
            <div class="col-xl-12 mx-auto">
                <div class="card">
                    <div class="card-header">
                        <h5 class="mb-0">Edit Role: {{ $role->name }}</h5>
                    </div>
                    <div class="card-body">
                        <form action="{{ route('admin.role.update', $role->id) }}" method="POST">
                            @csrf
                            @method('PUT')

                            <div class="mb-3">
                                <label for="name" class="form-label">Role Name <span class="text-danger">*</span></label>
                                <input type="text" class="form-control @error('name') is-invalid @enderror" 
                                       id="name" name="name" value="{{ old('name', $role->name) }}" required>
                                @error('name')
                                    <div class="invalid-feedback">{{ $message }}</div>
                                @enderror
                            </div>

                            <div class="mb-3">
                                <label for="description" class="form-label">Description</label>
                                <textarea class="form-control @error('description') is-invalid @enderror" 
                                          id="description" name="description" rows="3">{{ old('description', $role->description) }}</textarea>
                                @error('description')
                                    <div class="invalid-feedback">{{ $message }}</div>
                                @enderror
                            </div>

                            <div class="mb-3">
                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" id="is_active" name="is_active" 
                                           {{ old('is_active', $role->is_active) ? 'checked' : '' }}>
                                    <label class="form-check-label" for="is_active">Active Status</label>
                                </div>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Assign Permissions</label>
                                <div class="card">
                                    <div class="card-body">
                                        @if($permissions->count() > 0)
                                            @foreach($permissions as $groupName => $groupPermissions)
                                                <div class="mb-3">
                                                    <h6 class="mb-2">
                                                        <input type="checkbox" class="form-check-input select-all-group" 
                                                               data-group="{{ $groupName }}" id="group_{{ Str::slug($groupName) }}"
                                                               {{ $groupPermissions->pluck('id')->diff($rolePermissions)->isEmpty() ? 'checked' : '' }}>
                                                        <label for="group_{{ Str::slug($groupName) }}" class="form-check-label fw-bold">
                                                            {{ $groupName ?? 'Other' }}
                                                        </label>
                                                    </h6>
                                                    <div class="row ms-3">
                                                        @foreach($groupPermissions as $permission)
                                                            <div class="col-md-3 mb-2">
                                                                <div class="form-check">
                                                                    <input class="form-check-input permission-checkbox" 
                                                                           type="checkbox" 
                                                                           name="permissions[]" 
                                                                           value="{{ $permission->id }}" 
                                                                           id="permission_{{ $permission->id }}"
                                                                           data-group="{{ $groupName }}"
                                                                           {{ in_array($permission->id, $rolePermissions) ? 'checked' : '' }}>
                                                                    <label class="form-check-label" for="permission_{{ $permission->id }}">
                                                                        {{ $permission->name }}
                                                                    </label>
                                                                </div>
                                                            </div>
                                                        @endforeach
                                                    </div>
                                                </div>
                                                <hr>
                                            @endforeach
                                        @else
                                            <p class="text-muted">No permissions available. Please create permissions first.</p>
                                        @endif
                                    </div>
                                </div>
                            </div>

                            <div class="d-flex gap-2">
                                <button type="submit" class="btn btn-primary">Update Role</button>
                                <a href="{{ route('admin.role.index') }}" class="btn btn-secondary">Cancel</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('scripts')
<script>
    // Select all permissions in a group
    $(document).on('change', '.select-all-group', function() {
        let groupName = $(this).data('group');
        let isChecked = $(this).is(':checked');
        
        $('.permission-checkbox[data-group="' + groupName + '"]').prop('checked', isChecked);
    });

    // Update group checkbox when individual permissions change
    $(document).on('change', '.permission-checkbox', function() {
        let groupName = $(this).data('group');
        let totalInGroup = $('.permission-checkbox[data-group="' + groupName + '"]').length;
        let checkedInGroup = $('.permission-checkbox[data-group="' + groupName + '"]:checked').length;
        
        $('.select-all-group[data-group="' + groupName + '"]').prop('checked', totalInGroup === checkedInGroup);
    });
</script>
@endpush
