@extends('backend.admin.master')

@section('content')
    <div class="page-content">

        @include('backend.section.breadcrumb', ['title' => 'Permissions', 'sub_title' => 'All Permissions'])

        <div style="display: flex; align-items:center; justify-content:space-between">
            <h6 class="mb-0 text-uppercase">All Permissions</h6>
            <a href="{{ route('admin.permission.create') }}" class="btn btn-primary">Add Permission</a>
        </div>

        <hr />
        
        @if(session('success'))
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                {{ session('success') }}
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        @endif

        @if(session('error'))
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                {{ session('error') }}
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        @endif

        <div class="card">
            <div class="card-body">
                @if($permissions->count() > 0)
                    @foreach($permissions as $groupName => $groupPermissions)
                        <div class="mb-4">
                            <h5 class="text-primary mb-3">{{ $groupName ?? 'Other' }}</h5>
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered">
                                    <thead>
                                        <tr>
                                            <th width="5%">NO</th>
                                            <th width="25%">Name</th>
                                            <th width="20%">Slug</th>
                                            <th width="30%">Description</th>
                                            <th width="10%">Status</th>
                                            <th width="10%">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach($groupPermissions as $index => $permission)
                                        <tr>
                                            <td>{{ $index + 1 }}</td>
                                            <td>{{ $permission->name }}</td>
                                            <td><span class="badge bg-info">{{ $permission->slug }}</span></td>
                                            <td>{{ $permission->description ?? 'N/A' }}</td>
                                            <td>
                                                @if($permission->is_active)
                                                    <span class="badge bg-success">Active</span>
                                                @else
                                                    <span class="badge bg-danger">Inactive</span>
                                                @endif
                                            </td>
                                            <td>
                                                <a href="{{ route('admin.permission.edit', $permission->id) }}" class="btn btn-primary btn-sm" title="Edit">
                                                    <i class="bx bx-edit"></i>
                                                </a>
                                                <a href="javascript:void(0)" class="btn btn-danger btn-sm delete-permission" data-id="{{ $permission->id }}" title="Delete">
                                                    <i class="bx bx-trash"></i>
                                                </a>
                                            </td>
                                        </tr>
                                        @endforeach
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    @endforeach
                @else
                    <p class="text-muted">No permissions found.</p>
                @endif

                <form id="delete-form" method="POST" style="display: none;">
                    @csrf
                    @method('DELETE')
                </form>
            </div>
        </div>
    </div>
@endsection

@push('scripts')
<script>
    $(document).on('click', '.delete-permission', function (e) {
        e.preventDefault();

        let permissionId = $(this).data('id');
        let deleteUrl = "{{ route('admin.permission.destroy', ':id') }}".replace(':id', permissionId);

        Swal.fire({
            title: 'Are you sure?',
            text: "You won't be able to revert this!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Yes, delete it!'
        }).then((result) => {
            if (result.isConfirmed) {
                $('#delete-form').attr('action', deleteUrl).submit();
            }
        });
    });
</script>
@endpush
