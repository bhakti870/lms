@extends('backend.instructor.master')

@section('content')
    <div class="page-content">

        @if (!isApprovedUser())
            <div class="alert alert-danger border-0 bg-danger alert-dismissible fade show">
                <div class="text-white">
                    <p style="font-size: 20px">Your account is inactive. Please wait admin will check & approved it</p>
                </div>

            </div>
        @endif


        <div class="row row-cols-1 row-cols-md-2 row-cols-xl-4">
            <div class="col">
                <div class="card radius-10 border-start border-0 border-4 border-info">
                    <div class="card-body">
                        <div class="d-flex align-items-center">
                            <div>
                                <p class="mb-0 text-secondary">Total Orders</p>
                                <h4 class="my-1 text-info">{{ $total_orders }}</h4>
                                <p class="mb-0 font-13">Orders for your courses</p>
                            </div>
                            <div class="widgets-icons-2 rounded-circle bg-gradient-blues text-white ms-auto"><i
                                    class='bx bxs-cart'></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
             <div class="col">
                <div class="card radius-10 border-start border-0 border-4 border-danger">
                    <div class="card-body">
                        <div class="d-flex align-items-center">
                            <div>
                                <p class="mb-0 text-secondary">Total Revenue</p>
                                <h4 class="my-1 text-danger">₹{{ number_format($total_revenue, 2) }}</h4>
                                <p class="mb-0 font-13">Total earnings from sales</p>
                            </div>
                            <div class="widgets-icons-2 rounded-circle bg-gradient-burning text-white ms-auto">
                                <i class='bx bxs-wallet'></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card radius-10 border-start border-0 border-4 border-success">
                    <div class="card-body">
                        <div class="d-flex align-items-center">
                            <div>
                                <p class="mb-0 text-secondary">Total Courses</p>
                                <h4 class="my-1 text-success">{{ $total_courses }}</h4>
                                <p class="mb-0 font-13">Your active courses</p>
                            </div>
                            <div class="widgets-icons-2 rounded-circle bg-gradient-ohhappiness text-white ms-auto">
                                <i class='bx bxs-bar-chart-alt-2'></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card radius-10 border-start border-0 border-4 border-warning">
                    <div class="card-body">
                        <div class="d-flex align-items-center">
                            <div>
                                <p class="mb-0 text-secondary">Total Students</p>
                                <h4 class="my-1 text-warning">{{ $total_students }}</h4>
                                <p class="mb-0 font-13">Unique enrolled students</p>
                            </div>
                            <div class="widgets-icons-2 rounded-circle bg-gradient-orange text-white ms-auto">
                                <i class='bx bxs-group'></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div><!--end row-->
        
        <div class="row">
            <div class="col-12">
                <div class="card radius-10">
                    <div class="card-header">
                        <div class="d-flex align-items-center">
                            <div>
                                <h6 class="mb-0">Recent Orders</h6>
                            </div>
                            <div class="dropdown ms-auto">
                                <a class="dropdown-toggle dropdown-toggle-nocaret" href="#" data-bs-toggle="dropdown"><i
                                        class='bx bx-dots-horizontal-rounded font-22 text-option'></i>
                                </a>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="javascript:;">Action</a>
                                    </li>
                                    <li><a class="dropdown-item" href="javascript:;">Another action</a>
                                    </li>
                                    <li>
                                        <hr class="dropdown-divider">
                                    </li>
                                    <li><a class="dropdown-item" href="javascript:;">Something else here</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table align-middle mb-0">
                                <thead class="table-light">
                                    <tr>
                                        <th>Product</th>
                                        <th>Photo</th>
                                        <th>Product ID</th>
                                        <th>Status</th>
                                         <th>Amount</th>
                                        <th>Date</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                    <tbody>
                                        @foreach($recent_orders as $order)
                                        <tr>
                                            <td>{{ $order->course_title }}</td>
                                            <td><img src="{{ !empty($order->course->course_image) ? asset($order->course->course_image) : asset('upload/no_image.jpg') }}" class="product-img-2"
                                                     alt="product img"></td>
                                            <td>#{{ $order->invoice_no ?? $order->payment_id }}</td>
                                            <td>
                                                @if($order->payment->status == 'completed')
                                                <span class="badge bg-gradient-quepal text-white shadow-sm w-100">Paid</span>
                                                @else
                                                <span class="badge bg-gradient-bloody text-white shadow-sm w-100">{{ $order->payment->status }}</span>
                                                @endif
                                            </td>
                                            <td>${{ number_format($order->price, 2) }}</td>
                                            <td>{{ $order->created_at->format('d M Y') }}</td>
                                            <td>
                                                <a href="{{ route('instructor.orders.show', $order->id) }}" class="btn btn-primary btn-sm">View</a>
                                            </td>
                                        </tr>
                                        @endforeach
                                    </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div><!--end row-->


    </div>
@endsection
