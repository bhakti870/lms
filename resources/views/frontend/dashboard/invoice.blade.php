<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Invoice - {{ $payment->invoice_no }}</title>

    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap');

        body {
            font-family: 'Poppins', sans-serif;
            background: #f4f6f8;
            padding: 40px;
            color: #333;
        }

        .invoice-wrapper {
            max-width: 900px;
            margin: auto;
            background: #ffffff;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 20px 40px rgba(0,0,0,0.1);
        }

        /* Header */
        .invoice-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 2px solid #e5e7eb;
            padding-bottom: 20px;
        }

        .invoice-header h1 {
            margin: 0;
            font-size: 28px;
            letter-spacing: 2px;
        }

        .brand {
            text-align: right;
        }

        .brand h2 {
            margin: 0;
            font-size: 22px;
            color: #0f766e;
        }

        .invoice-meta {
            margin-top: 25px;
            display: flex;
            justify-content: space-between;
            font-size: 14px;
            color: #555;
        }

        /* Table */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 30px;
        }

        table thead th {
            background: #f9fafb;
            padding: 14px;
            text-align: left;
            font-weight: 600;
            border-bottom: 2px solid #e5e7eb;
        }

        table tbody td {
            padding: 14px;
            border-bottom: 1px solid #e5e7eb;
            font-size: 15px;
        }

        table tbody tr:last-child td {
            border-bottom: none;
        }

        /* Total */
        .total-box {
            margin-top: 30px;
            display: flex;
            justify-content: flex-end;
        }

        .total {
            background: #0f766e;
            color: #fff;
            padding: 14px 30px;
            border-radius: 8px;
            font-size: 18px;
            font-weight: 600;
        }

        /* Footer */
        .invoice-footer {
            margin-top: 40px;
            text-align: center;
            font-size: 13px;
            color: #777;
        }

        /* Print Button */
        .print-btn {
            text-align: center;
            margin-top: 25px;
        }

        .print-btn button {
            background: #0f766e;
            color: #fff;
            border: none;
            padding: 12px 28px;
            font-size: 15px;
            border-radius: 8px;
            cursor: pointer;
        }

        /* Print */
        @media print {
            body {
                background: #fff;
                padding: 0;
            }
            .print-btn {
                display: none;
            }
            .invoice-wrapper {
                box-shadow: none;
                border-radius: 0;
            }
        }
    </style>
</head>

<body>

<div class="invoice-wrapper">

    <!-- HEADER -->
    <div class="invoice-header">
        <h1>INVOICE</h1>
        <div class="brand">
            <h2>{{ config('app.name') }}</h2>
            <div style="font-size:13px;color:#666;">
                Premium Learning Platform
            </div>
        </div>
    </div>

    <!-- META -->
    <div class="invoice-meta">
        <div>
            <strong>Invoice No:</strong> {{ $payment->invoice_no }}<br>
            <strong>Invoice Date:</strong> {{ \Carbon\Carbon::parse($payment->order_date)->format('F d, Y') }}
        </div>
        <div style="text-align:right;">
            <strong>Status:</strong> Paid<br>
            <strong>Currency:</strong> INR
        </div>
    </div>

    <!-- ITEMS -->
    <table>
        <thead>
            <tr>
                <th>Course / Item</th>
                <th style="text-align:right;">Price</th>
            </tr>
        </thead>
        <tbody>
            @foreach($payment->orders as $order)
            <tr>
                <td>{{ $order->course_title }}</td>
                <td style="text-align:right;">₹{{ number_format($order->price, 2) }}</td>
            </tr>
            @endforeach
        </tbody>
    </table>

    <!-- TOTAL -->
    <div class="total-box">
        <div class="total">
            Total Amount: ₹{{ number_format($payment->total_amount, 2) }}
        </div>
    </div>

    <!-- FOOTER -->
    <div class="invoice-footer">
        Thank you for your purchase.<br>
        This is a system-generated invoice and does not require a signature.
    </div>

</div>

<div class="print-btn">
    <button onclick="window.print()">Download / Print Invoice</button>
</div>

</body>
</html>
