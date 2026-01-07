<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Course Invoice</title>
    <style>
        body { font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; line-height: 1.6; color: #333; background-color: #f9f9f9; padding: 20px; }
        .invoice-container { max-width: 600px; margin: 0 auto; background: #fff; padding: 30px; border-radius: 8px; box-shadow: 0 0 20px rgba(0,0,0,0.05); }
        .header { text-align: center; border-bottom: 2px solid #eee; padding-bottom: 20px; margin-bottom: 20px; }
        .header h1 { margin: 0; color: #2D58FF; }
        .order-details { margin-bottom: 30px; }
        .order-details table { width: 100%; border-collapse: collapse; }
        .order-details th, .order-details td { text-align: left; padding: 12px; border-bottom: 1px solid #eee; }
        .total { font-size: 18px; font-weight: bold; text-align: right; padding-top: 15px; }
        .footer { text-align: center; margin-top: 30px; font-size: 14px; color: #777; }
        .btn { display: inline-block; padding: 10px 20px; background-color: #25D366; color: white; text-decoration: none; border-radius: 5px; margin-top: 15px; }
    </style>
</head>
<body>
    <div class="invoice-container">
        <div class="header">
            <h1>Skillpoint Invoice</h1>
            <p>Thank you for your purchase!</p>
        </div>

        <div class="order-details">
            <p><strong>Order ID:</strong> #{{ $order->id }}</p>
            <p><strong>Date:</strong> {{ $order->created_at->format('d M, Y') }}</p>
            <p><strong>Customer:</strong> {{ $user->name }}</p>
            
            <h3>Order Summary</h3>
            <table>
                <thead>
                    <tr>
                        <th>Course</th>
                        <th>Instructor</th>
                        <th>Price</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>{{ $order->course_title }}</td>
                        <td>{{ $order->instructor->name ?? 'Skillpoint' }}</td>
                        <td>₹{{ $order->price }}</td>
                    </tr>
                </tbody>
            </table>
            
            <div class="total">
                Total Paid: ₹{{ $order->price }}
            </div>
        </div>

        <div class="footer">
            <p>You can access your course immediately from your dashboard.</p>
            <a href="{{ route('user.course.learn', $order->course_id) }}" class="btn">Start Learning</a>
            <p>&copy; {{ date('Y') }} Skillpoint. All rights reserved.</p>
        </div>
    </div>
</body>
</html>
