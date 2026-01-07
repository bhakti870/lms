@extends('backend.instructor.master')

@section('content')
    <div class="page-content">
        <!--breadcrumb-->
        <div class="page-breadcrumb d-none d-sm-flex align-items-center mb-3">
            <div class="breadcrumb-title pe-3">Order Details</div>
            <div class="ps-3">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb mb-0 p-0">
                        <li class="breadcrumb-item"><a href="{{ route('instructor.dashboard') }}"><i class="bx bx-home-alt"></i></a>
                        </li>
                        <li class="breadcrumb-item"><a href="{{ route('instructor.orders.index') }}">Order History</a>
                        </li>
                        <li class="breadcrumb-item active" aria-current="page">View Details</li>
                    </ol>
                </nav>
            </div>
        </div>
        <!--end breadcrumb-->

        <div class="row">
            <div class="col-md-6">
                <div class="card h-100">
                    <div class="card-header">
                        <h5 class="mb-0">Student Information</h5>
                    </div>
                    <div class="card-body">
                        <div class="d-flex align-items-center gap-3">
                            <img src="{{ !empty($order->user->photo) ? asset($order->user->photo) : asset('backend/assets/images/no_image.jpg') }}" 
                                 class="rounded-circle p-1 bg-primary" width="100" height="100" />
                            <div>
                                <h6 class="mb-1">{{ $order->user->name ?? 'N/A' }}</h6>
                                <p class="mb-0 text-secondary">{{ $order->user->email ?? 'N/A' }}</p>
                                <p class="mb-0 text-secondary">{{ $order->user->phone ?? 'N/A' }}</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-6">
                <div class="card h-100">
                    <div class="card-header">
                        <h5 class="mb-0">Order Information</h5>
                    </div>
                    <div class="card-body">
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item d-flex justify-content-between align-items-center">
                                Order Date <span>{{ $order->created_at->format('d M Y, h:i A') }}</span>
                            </li>
                            <li class="list-group-item d-flex justify-content-between align-items-center">
                                Transaction ID <span class="text-primary">{{ $order->payment->transaction_id ?? 'N/A' }}</span>
                            </li>
                            <li class="list-group-item d-flex justify-content-between align-items-center">
                                Payment Method <span class="text-uppercase">{{ $order->payment->payment_type ?? 'N/A' }}</span>
                            </li>
                            <li class="list-group-item d-flex justify-content-between align-items-center">
                                Invoice No <span class="text-danger">{{ $order->payment->invoice_no ?? 'N/A' }}</span>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <div class="row mt-4">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <h5 class="mb-0">Enrolled Course</h5>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table">
                                <thead class="table-light">
                                    <tr>
                                        <th>Image</th>
                                        <th>Course Name</th>
                                        <th>Category</th>
                                        <th>Selling Price</th>
                                        <th>Your Earnings</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>
                                            <img src="{{ asset($order->course->course_image) }}" width="70" class="rounded" alt="">
                                        </td>
                                        <td>{{ $order->course_title }}</td>
                                        <td>{{ $order->course->category->name ?? 'N/A' }}</td>
                                        <td>₹{{ number_format($order->price, 2) }}</td>
                                        <td><span class="badge bg-success">₹{{ number_format($order->price, 2) }}</span></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
@endsection
