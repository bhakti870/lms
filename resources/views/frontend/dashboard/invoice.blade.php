<!DOCTYPE html>
<html>
<head>
    <title>Invoice - {{ $payment->invoice_no }}</title>
    <style>
        body { font-family: sans-serif; padding: 40px; color: #333; }
        .invoice-box { max-width: 800px; margin: auto; padding: 30px; border: 1px solid #eee; box-shadow: 0 0 10px rgba(0, 0, 0, 0.15); font-size: 16px; line-height: 24px; color: #555; }
        .invoice-header { display: flex; justify-content: space-between; margin-bottom: 20px; }
        .invoice-header h2 { margin: 0; color: #333; }
        .table { width: 100%; text-align: left; margin-top: 20px; border-collapse: collapse; }
        .table th, .table td { padding: 10px; border-bottom: 1px solid #eee; }
        .table th { background: #f9f9f9; }
        .total { text-align: right; font-weight: bold; font-size: 18px; margin-top: 20px; }
        .btn-print { margin-top: 20px; text-align: center; }
        .btn-print button { padding: 10px 20px; font-size: 16px; cursor: pointer; background: #007bff; color: white; border: none; border-radius: 5px; }
        @media print { .btn-print { display: none; } .invoice-box { border: none; box-shadow: none; } }
    </style>
</head>
<body>
    <div class="invoice-box">
        <div class="invoice-header">
            <div>
                <h2>INVOICE</h2>
                <p>Invoice #: {{ $payment->invoice_no }}<br>
                   Date: {{ \Carbon\Carbon::parse($payment->order_date)->format('F d, Y') }}</p>
            </div>
            <div style="text-align: right;">
                <h3>{{ config('app.name') }}</h3>
            </div>
        </div>
        
        <table class="table">
            <thead>
                <tr>
                    <th>Item</th>
                    <th>Price</th>
                </tr>
            </thead>
            <tbody>
                @foreach($payment->orders as $order)
                <tr>
                    <td>{{ $order->course_title }}</td>
                    <td>₹{{ number_format($order->price, 2) }}</td>
                </tr>
                @endforeach
            </tbody>
        </table>
        
        <div class="total">
            Total: ₹{{ number_format($payment->total_amount, 2) }}
        </div>
    </div>
    
    <div class="btn-print">
        <button onclick="window.print()">Print Invoice</button>
    </div>
</body>
</html>
