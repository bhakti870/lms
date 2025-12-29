<!DOCTYPE html>
<html lang="en">

<head>

    <title>Skillpoint - Learning Management System</title>

    <!-- Google fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@100;200;300;400;500;600;700;800&display=swap"
        rel="stylesheet">

    <!-- Favicon -->
    <link rel="icon" sizes="16x16" href="{{ asset('frontend/images/favicon.png') }}">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    
    {{-- Hotwire Turbo for SPA feel --}}
    <script src="https://unpkg.com/@hotwired/turbo@7.3.0/dist/turbo.es2017-umd.js" defer></script>



    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@400;500;600;700&display=swap" rel="stylesheet">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="style.css">
    <link
        href="https://fonts.googleapis.com/css2?family=Merriweather:wght@700;900&family=Roboto:wght@400;500&display=swap"
        rel="stylesheet">
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <meta name="turbo-cache-control" content="no-preview">

    <!-- inject:css -->

    @include('frontend.section.link')

    <!-- end inject -->
</head>

<body>

    <!-- start cssload-loader -->
    @include('frontend.section.preloader')

    <!--START HEADER AREA-->
    @include('frontend.section.header')

    @yield('content')


    <!--START COURSE First AREA-->



    <!--START COURSE AREA-->



    <!--START FUNFACT AREA -->



    <!--START CTA AREA-->

    <!--START TESTIMONIAL AREA-->


    <div class="section-block"></div>

    <!--START ABOUT AREA-->



    <div class="section-block"></div>

    <!--START REGISTER AREA-->


    <div class="section-block"></div>

    <!--START CLIENT-LOGO AREA -->




    <!--START BLOG AREA -->




    <!----START GET STARTED AREA---->



    <!---subscribe-area------->



    <!---footer-area--->
    @include('frontend.section.footer')


    <!-- start scroll top -->
    <div id="scroll-top">
        <i class="la la-arrow-up" title="Go top"></i>
    </div>


    <!---tooltip--->

    @include('frontend.section.tooltip')


    <!-- template js files -->
    @include('frontend.section.script')
</body>

</html>
