<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>SkillPoint Course Certificate</title>

    <style>
        body {
            margin: 0;
            padding: 0;
            background: #0f766e;
            font-family: 'Poppins', 'Helvetica', sans-serif;
        }

        .certificate-wrapper {
            width: 1000px;
            height: 700px;
            margin: 40px auto;
            background: #ffffff;
            position: relative;
            padding: 60px;
            box-sizing: border-box;
            border: 14px solid #0f766e;
            overflow: hidden;
        }

        /* Decorative corners */
        .corner-top {
            position: absolute;
            top: 0;
            left: 0;
            width: 350px;
            height: 350px;
            background: linear-gradient(135deg, #065f46 50%, #d4af37 50%);
        }

        .corner-bottom {
            position: absolute;
            bottom: 0;
            right: 0;
            width: 320px;
            height: 320px;
            background: linear-gradient(315deg, #065f46 50%, #d4af37 50%);
        }

        .content {
            position: relative;
            z-index: 2;
            height: 100%;
            text-align: center;
        }

        .brand {
            font-size: 38px;
            font-weight: 900;
            color: #065f46;
            letter-spacing: 3px;
        }

        .certificate-title {
            margin-top: 25px;
            font-size: 50px;
            font-weight: 700;
            color: #111;
        }

        .subtitle {
            margin-top: 8px;
            font-size: 18px;
            color: #555;
        }

        .student-name {
            margin: 40px auto 10px;
            font-size: 44px;
            font-weight: 700;
            color: #065f46;
            border-bottom: 3px solid #d4af37;
            display: inline-block;
            padding-bottom: 6px;
        }

        .course-text {
            margin-top: 22px;
            font-size: 20px;
            color: #333;
        }

        .course-name {
            font-size: 26px;
            font-style: italic;
            font-weight: 600;
            margin-top: 10px;
            color: #000;
        }

        .meta {
            margin-top: 35px;
            font-size: 15px;
            color: #444;
            line-height: 1.6;
        }

        /* Gold Stamp Seal */
        .stamp {
            position: absolute;
            right: 90px;
            top: 200px;
            width: 150px;
            height: 150px;
            border-radius: 50%;
            border: 7px double #d4af37;
            color: #d4af37;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            font-weight: 800;
            font-size: 14px;
            transform: rotate(-18deg);
            background: radial-gradient(circle, rgba(212,175,55,0.15), transparent 70%);
            box-shadow: 0 0 0 4px rgba(212,175,55,0.25);
        }

        .stamp span {
            line-height: 1.4;
            letter-spacing: 1px;
        }

        /* Signatures */
        .signatures {
            position: absolute;
            bottom: 90px;
            left: 0;
            right: 0;
            display: flex;
            justify-content: space-around;
            padding: 0 80px;
        }

        .sign-box {
            text-align: center;
            width: 260px;
        }

        .signature-text {
            font-family: 'Brush Script MT', 'Comic Sans MS', cursive;
            font-size: 34px;
            color: #111;
            margin-bottom: 8px;
        }

        .sign-line {
            border-top: 2px solid #333;
            margin-bottom: 6px;
        }

        .sign-label {
            font-size: 14px;
            color: #333;
        }

        .print-btn {
            margin: 25px auto;
            display: block;
            padding: 12px 26px;
            background: #065f46;
            color: #fff;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
        }

        @media print {
            body {
                background: #fff;
            }
            .print-btn {
                display: none;
            }
        }
    </style>
</head>

<body>

<div class="certificate-wrapper">
    <div class="corner-top"></div>
    <div class="corner-bottom"></div>

    <div class="content">

        <div class="brand">SKILLPOINT</div>

        <div class="certificate-title">Certificate of Completion</div>
        <div class="subtitle">This is proudly presented to</div>

        <div class="student-name">{{ $user->name ?? 'John Doe' }}</div>

        <div class="course-text">For successfully completing the course</div>
        <div class="course-name">{{ $course->course_name ?? 'Full Stack Web Development' }}</div>

        <div class="meta">
            Issued on: {{ \Carbon\Carbon::now()->format('F d, Y') }}<br>
            Certificate ID: SP-{{ rand(100000,999999) }}
        </div>

        <!-- Gold Stamp -->
        <div class="stamp">
            <span>
                VERIFIED<br>
                OFFICIAL<br>
                SKILLPOINT
            </span>
        </div>

        <!-- Signatures -->
        <div class="signatures">

            <div class="sign-box">
                <div class="signature-text">A. Sharma</div>
                <div class="sign-line"></div>
                <div class="sign-label">Course Instructor</div>
            </div>

            <div class="sign-box">
                <div class="signature-text">R. Mehta</div>
                <div class="sign-line"></div>
                <div class="sign-label">Authorized Director</div>
            </div>

        </div>
    </div>
</div>

<button onclick="window.print()" class="print-btn">Download PDF</button>

</body>
</html>
