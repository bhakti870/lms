@extends('backend.admin.master')

@section('content')
    <div class="page-content">

        @include('backend.section.breadcrumb', ['title' => 'Roles', 'sub_title' => 'All Roles'])

        <div style="display: flex; align-items:center; justify-content:space-between">
            <h6 class="mb-0 text-uppercase">All Roles</h6>
            <a href="{{ route('admin.role.create') }}" class="btn btn-primary">Add Role</a>
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
                <div class="table-responsive">
                    <table id="example" class="table table-striped table-bordered" style="width:100%">
                        <thead>
                            <tr>
                                <th>NO</th>
                                <th>Name</th>
                                <th>Slug</th>
                                <th>Description</th>
                                <th>Permissions</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($roles as $index => $role)
                            <tr>
                                <td>{{ $index + 1 }}</td>
                                <td>{{ $role->name }}</td>
                                <td><span class="badge bg-info">{{ $role->slug }}</span></td>
                                <td>{{ $role->description ?? 'N/A' }}</td>
                                <td>
                                    <span class="badge bg-primary">{{ $role->permissions->count() }} Permissions</span>
                                </td>
                                <td>
                                    @if($role->is_active)
                                        <span class="badge bg-success">Active</span>
                                    @else
                                        <span class="badge bg-danger">Inactive</span>
                                    @endif
                                </td>
                                <td>
                                    <a href="{{ route('admin.role.show', $role->id) }}" class="btn btn-info btn-sm" title="View">
                                        <i class="bx bx-show"></i>
                                    </a>
                                    <a href="{{ route('admin.role.edit', $role->id) }}" class="btn btn-primary btn-sm" title="Edit">
                                        <i class="bx bx-edit"></i>
                                    </a>
                                    <a href="javascript:void(0)" class="btn btn-danger btn-sm delete-role" data-id="{{ $role->id }}" title="Delete">
                                        <i class="bx bx-trash"></i>
                                    </a>

                                    <form id="delete-form" method="POST" style="display: none;">
                                        @csrf
                                        @method('DELETE')
                                    </form>
                                </td>
                            </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('scripts')
<script>
    $(document).on('click', '.delete-role', function (e) {
        e.preventDefault();

        let roleId = $(this).data('id');
        let deleteUrl = "{{ route('admin.role.destroy', ':id') }}".replace(':id', roleId);

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
