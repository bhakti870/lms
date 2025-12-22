<!DOCTYPE html>
<html>
<head>
    <title>Course Certificate</title>
    <style>
        body { font-family: 'Helvetica', sans-serif; text-align: center; padding: 50px; background: #f0f0f0; }
        .certificate-container {
            width: 800px;
            margin: 0 auto;
            border: 10px solid #ddd;
            padding: 50px;
            background: #fff;
            position: relative;
        }
        .header { font-size: 40px; font-weight: bold; color: #333; margin-bottom: 20px; }
        .sub-header { font-size: 20px; color: #666; }
        .student-name { font-size: 32px; font-weight: bold; margin: 30px 0; border-bottom: 2px solid #333; display: inline-block; padding-bottom: 5px; }
        .course-name { font-size: 24px; font-style: italic; margin: 20px 0; }
        .date { font-size: 16px; margin-top: 40px; }
        .signature { margin-top: 50px; display: flex; justify-content: space-between; padding: 0 50px; }
        .sig-line { border-top: 1px solid #333; width: 200px; padding-top: 10px; }
        .print-btn { margin-top: 30px; padding: 10px 20px; background: #007bff; color: white; text-decoration: none; border-radius: 5px; cursor: pointer; border: none; font-size: 16px; }
        @media print {
            body { background: white; padding: 0; }
            .certificate-container { border: 5px solid #333; width: 100%; height: 100%; padding: 20px; box-sizing: border-box; }
            .print-btn { display: none; }
        }
    </style>
</head>
<body>

    <div class="certificate-container">
        <div class="header">Certificate of Completion</div>
        <div class="sub-header">This certifies that</div>
        
        <div class="student-name">{{ $user->name }}</div>
        
        <div class="sub-header">has successfully completed the course</div>
        
        <div class="course-name">{{ $course->course_name }}</div>
        
        <div class="date">Issued on: {{ \Carbon\Carbon::parse($certificate->issued_at)->format('F d, Y') }}</div>
        <div class="date">Certificate ID: {{ $certificate->certificate_number }}</div>

        <div class="signature">
            <div class="sig-block">
                <div class="sig-line">Instructor</div>
            </div>
            <div class="sig-block">
                <div class="sig-line">Director</div>
            </div>
        </div>
    </div>

    <button onclick="window.print()" class="print-btn">Download PDF</button>

</body>
</html>
