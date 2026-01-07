@extends('backend.instructor.master')

@section('content')
<div class="page-content">
    <!--breadcrumb-->
    <div class="page-breadcrumb d-none d-sm-flex align-items-center mb-3">
        <div class="breadcrumb-title pe-3">Manage Reviews</div>
        <div class="ps-3">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb mb-0 p-0">
                    <li class="breadcrumb-item"><a href="javascript:;"><i class="bx bx-home-alt"></i></a></li>
                    <li class="breadcrumb-item active" aria-current="page">Course Reviews</li>
                </ol>
            </nav>
        </div>
    </div>
    <!--end breadcrumb-->

    <div class="card">
        <div class="card-body">
            <div class="table-responsive">
                <table id="example" class="table table-striped table-bordered" style="width:100%">
                    <thead>
                        <tr>
                            <th>Sl</th>
                            <th>Course</th>
                            <th>User</th>
                            <th>Rating</th>
                            <th>Comment</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach($reviews as $key => $item)
                        <tr>
                            <td>{{ $key+1 }}</td>
                            <td>{{ $item->course->course_name }}</td>
                            <td>{{ $item->user->name }}</td>
                            <td>
                                @for($i = 1; $i <= 5; $i++)
                                    @if($i <= $item->rating)
                                        <i class='bx bxs-star text-warning'></i>
                                    @else
                                        <i class='bx bx-star text-secondary'></i>
                                    @endif
                                @endfor
                            </td>
                            <td>{{ Str::limit($item->comment, 50) }}</td>
                            <td>
                                @if($item->status == 1)
                                    <span class="badge bg-success">Approved</span>
                                @else
                                    <span class="badge bg-danger">Pending</span>
                                @endif
                            </td>
                            <td>
                                <div class="d-flex align-items-center gap-1">
                                    <form action="{{ route('instructor.update.review.status', $item->id) }}" method="POST">
                                        @csrf
                                        <select name="status" onchange="this.form.submit()" class="form-select form-select-sm">
                                            <option value="0" {{ $item->status == 0 ? 'selected' : '' }}>Pending</option>
                                            <option value="1" {{ $item->status == 1 ? 'selected' : '' }}>Approve</option>
                                        </select>
                                    </form>

                                    <form action="{{ route('instructor.delete.review', $item->id) }}" method="POST" id="delete-review-{{ $item->id }}">
                                        @csrf
                                        @method('DELETE')
                                        <button type="button" class="btn btn-danger btn-sm" onclick="confirmDelete({{ $item->id }})">
                                            <i class='bx bx-trash'></i>
                                        </button>
                                    </form>
                                </div>
                            </td>
                        </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<script>
    function confirmDelete(id) {
        if (confirm('Are you sure you want to delete this review?')) {
            document.getElementById('delete-review-' + id).submit();
        }
    }
</script>
@endsection
