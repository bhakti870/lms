@extends('backend.admin.master')

@section('content')
    <div class="page-content">
        @include('backend.section.breadcrumb', ['title' => 'Roles', 'sub_title' => 'Role Details'])

        <div class="row">
            <div class="col-xl-12 mx-auto">
                <div class="card">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <h5 class="mb-0">Role Details</h5>
                        <div>
                            <a href="{{ route('admin.role.edit', $role->id) }}" class="btn btn-primary btn-sm">
                                <i class="bx bx-edit"></i> Edit
                            </a>
                            <a href="{{ route('admin.role.index') }}" class="btn btn-secondary btn-sm">
                                <i class="bx bx-arrow-back"></i> Back
                            </a>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <h6 class="text-muted">Role Name</h6>
                                <p class="fw-bold">{{ $role->name }}</p>
                            </div>
                            <div class="col-md-6">
                                <h6 class="text-muted">Slug</h6>
                                <p><span class="badge bg-info">{{ $role->slug }}</span></p>
                            </div>
                        </div>

                        <div class="row mb-3">
                            <div class="col-md-6">
                                <h6 class="text-muted">Status</h6>
                                <p>
                                    @if($role->is_active)
                                        <span class="badge bg-success">Active</span>
                                    @else
                                        <span class="badge bg-danger">Inactive</span>
                                    @endif
                                </p>
                            </div>
                            <div class="col-md-6">
                                <h6 class="text-muted">Total Users</h6>
                                <p class="fw-bold">{{ $role->users->count() }}</p>
                            </div>
                        </div>

                        <div class="row mb-3">
                            <div class="col-md-12">
                                <h6 class="text-muted">Description</h6>
                                <p>{{ $role->description ?? 'No description provided' }}</p>
                            </div>
                        </div>

                        <hr>

                        <div class="row">
                            <div class="col-md-12">
                                <h6 class="mb-3">Assigned Permissions ({{ $role->permissions->count() }})</h6>
                                @if($role->permissions->count() > 0)
                                    @php
                                        $groupedPermissions = $role->permissions->groupBy('group_name');
                                    @endphp
                                    @foreach($groupedPermissions as $groupName => $permissions)
                                        <div class="mb-3">
                                            <h6 class="text-primary">{{ $groupName ?? 'Other' }}</h6>
                                            <div class="d-flex flex-wrap gap-2">
                                                @foreach($permissions as $permission)
                                                    <span class="badge bg-secondary">{{ $permission->name }}</span>
                                                @endforeach
                                            </div>
                                        </div>
                                    @endforeach
                                @else
                                    <p class="text-muted">No permissions assigned to this role.</p>
                                @endif
                            </div>
                        </div>

                        @if($role->users->count() > 0)
                            <hr>
                            <div class="row">
                                <div class="col-md-12">
                                    <h6 class="mb-3">Users with this Role</h6>
                                    <div class="table-responsive">
                                        <table class="table table-sm table-bordered">
                                            <thead>
                                                <tr>
                                                    <th>Name</th>
                                                    <th>Email</th>
                                                    <th>Status</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                @foreach($role->users as $user)
                                                    <tr>
                                                        <td>{{ $user->name }}</td>
                                                        <td>{{ $user->email }}</td>
                                                        <td>
                                                            @if($user->status == '1')
                                                                <span class="badge bg-success">Active</span>
                                                            @else
                                                                <span class="badge bg-danger">Inactive</span>
                                                            @endif
                                                        </td>
                                                    </tr>
                                                @endforeach
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        @endif
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
