@extends('backend.admin.master')

@section('content')
    <div class="page-content">
        @include('backend.section.breadcrumb', ['title' => 'Permissions', 'sub_title' => 'Edit Permission'])

        <div class="row">
            <div class="col-xl-8 mx-auto">
                <div class="card">
                    <div class="card-header">
                        <h5 class="mb-0">Edit Permission: {{ $permission->name }}</h5>
                    </div>
                    <div class="card-body">
                        <form action="{{ route('admin.permission.update', $permission->id) }}" method="POST">
                            @csrf
                            @method('PUT')

                            <div class="mb-3">
                                <label for="name" class="form-label">Permission Name <span class="text-danger">*</span></label>
                                <input type="text" class="form-control @error('name') is-invalid @enderror" 
                                       id="name" name="name" value="{{ old('name', $permission->name) }}" 
                                       placeholder="e.g., View Users, Create Course" required>
                                @error('name')
                                    <div class="invalid-feedback">{{ $message }}</div>
                                @enderror
                                <small class="text-muted">Enter a descriptive name for the permission</small>
                            </div>

                            <div class="mb-3">
                                <label for="group_name" class="form-label">Group Name <span class="text-danger">*</span></label>
                                <input type="text" class="form-control @error('group_name') is-invalid @enderror" 
                                       id="group_name" name="group_name" value="{{ old('group_name', $permission->group_name) }}" 
                                       list="groupsList" placeholder="e.g., User Management, Course Management" required>
                                @error('group_name')
                                    <div class="invalid-feedback">{{ $message }}</div>
                                @enderror
                                <datalist id="groupsList">
                                    @foreach($groups as $group)
                                        <option value="{{ $group }}">
                                    @endforeach
                                </datalist>
                                <small class="text-muted">Group permissions by functionality (you can select existing or create new)</small>
                            </div>

                            <div class="mb-3">
                                <label for="description" class="form-label">Description</label>
                                <textarea class="form-control @error('description') is-invalid @enderror" 
                                          id="description" name="description" rows="3" 
                                          placeholder="Describe what this permission allows">{{ old('description', $permission->description) }}</textarea>
                                @error('description')
                                    <div class="invalid-feedback">{{ $message }}</div>
                                @enderror
                            </div>

                            <div class="mb-3">
                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" id="is_active" name="is_active" 
                                           {{ old('is_active', $permission->is_active) ? 'checked' : '' }}>
                                    <label class="form-check-label" for="is_active">Active Status</label>
                                </div>
                            </div>

                            <div class="d-flex gap-2">
                                <button type="submit" class="btn btn-primary">Update Permission</button>
                                <a href="{{ route('admin.permission.index') }}" class="btn btn-secondary">Cancel</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
