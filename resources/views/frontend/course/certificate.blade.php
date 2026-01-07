<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>SkillPoint Certificate</title>

<style>
@import url('https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600;700;900&family=Poppins:wght@300;400;500&family=Allura&display=swap');

body{
    margin:0;
    background:#e6c04a;
    font-family:'Poppins',sans-serif;
}

/* Certificate box */
.certificate{
    width:1100px;
    height:750px;
    background:#fff;
    margin:40px auto;
    padding:70px;
    border:20px solid #d4af37;
    box-sizing:border-box;
    position:relative;
}

/* Inner border */
.certificate:before{
    content:"";
    position:absolute;
    inset:18px;
    border:2px solid #0f766e;
}

/* Header */
.brand{
    text-align:center;
    font-family:'Playfair Display',serif;
    font-size:42px;
    font-weight:900;
    color:#0f766e;
    letter-spacing:4px;
}

.title{
    text-align:center;
    font-family:'Playfair Display',serif;
    font-size:54px;
    margin-top:25px;
}

.subtitle{
    text-align:center;
    margin-top:10px;
    color:#555;
}

/* Name */
.name{
    text-align:center;
    font-family:'Playfair Display',serif;
    font-size:46px;
    margin:45px auto 15px;
    color:#0f766e;
    display:inline-block;
    padding-bottom:10px;
    border-bottom:3px solid #d4af37;
}

/* Course */
.course-text{
    text-align:center;
    font-size:20px;
    margin-top:25px;
}

.course-name{
    text-align:center;
    font-size:26px;
    font-style:italic;
    font-weight:600;
    margin-top:8px;
}

/* Footer info */
.meta{
    text-align:center;
    margin-top:35px;
    font-size:15px;
}

/* BLUE REALISTIC STAMP */
.stamp{
    position:absolute;
    bottom:150px;
    left:100px;
    width:160px;
    height:160px;
    border-radius:50%;
    border:6px dashed #1e40af;
    color:#1e40af;
    display:flex;
    align-items:center;
    justify-content:center;
    text-align:center;
    font-weight:800;
    font-size:14px;
    letter-spacing:1px;
    transform:rotate(-18deg);
    opacity:0.75;
    background:radial-gradient(circle, rgba(30,64,175,0.15), transparent 70%);
}

/* Signatures */
.signatures{
    position:absolute;
    bottom:80px;
    left:0;
    right:0;
    display:flex;
    justify-content:space-between;
    padding:0 160px;
}

.sign-box{
    width:260px;
    text-align:center;
}

.signature{
    font-family:'Allura',cursive;
    font-size:38px;
    color:#000;
}

.line{
    border-top:2px solid #333;
    margin:8px 0;
}

.label{
    font-size:14px;
}

/* Print */
.print-btn{
    display:block;
    margin:30px auto;
    padding:14px 32px;
    font-size:16px;
    background:#0f766e;
    color:#fff;
    border:none;
    border-radius:8px;
    cursor:pointer;
}

@media print{
    body{background:#fff;}
    .print-btn{display:none;}
}
</style>
</head>

<body>

<div class="certificate">

    <div class="brand">SKILLPOINT</div>
    <div class="title">Certificate of Excellence</div>
    <div class="subtitle">This certificate is proudly presented to</div>

    <div style="text-align:center;">
        <div class="name">{{ $user->name ?? 'Student 3' }}</div>
    </div>

    <div class="course-text">For successfully completing the professional course</div>
    <div class="course-name">
        {{ $course->course_name ?? 'Cyber Security – Masterclass (Vol 3)' }}
    </div>

    <div class="meta">
        Issued on: {{ \Carbon\Carbon::now()->format('F d, Y') }}<br>
        Certificate ID: SP-{{ rand(100000,999999) }}
    </div>

    <!-- BLUE INK STAMP -->
    <div class="stamp">
        VERIFIED<br>PREMIUM<br>SKILLPOINT
    </div>

    <!-- SIGNATURES -->
    <div class="signatures">
        <div class="sign-box">
            <div class="signature">A. Sharma</div>
            <div class="line"></div>
            <div class="label">Course Instructor</div>
        </div>

        <div class="sign-box">
            <div class="signature">R. Mehta</div>
            <div class="line"></div>
            <div class="label">Authorized Director</div>
        </div>
    </div>
</div>

<button class="print-btn" onclick="window.print()">Download Certificate</button>

</body>
</html>
