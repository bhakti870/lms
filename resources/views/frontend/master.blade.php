<!DOCTYPE html>
<html lang="en">

<head>

    <title>Skillpoint - Learning Management System</title>

    <meta name="csrf-token" content="{{ csrf_token() }}">
    
    {{-- Hotwire Turbo for SPA feel --}}
    <script src="https://unpkg.com/@hotwired/turbo@7.3.0/dist/turbo.es2017-umd.js" defer></script>
    <meta name="turbo-cache-control" content="no-preview">

    <!-- inject:css -->
    @include('frontend.section.link')
    <!-- end inject -->

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

    <!-- WhatsApp Chat Widget -->
    @php
        $siteInfo = \App\Models\SiteInfo::first();
        $dbPhone = $siteInfo ? $siteInfo->phone : null;

        // Ignore the default placeholder number from the database if present
        if ($dbPhone === '+1 (555) 123-4567') {
            $dbPhone = null;
        }

        if ($dbPhone) {
            $waNumber = preg_replace('/[^0-9]/', '', $dbPhone);
            // If the number is exactly 10 digits (common in India), add the country code '91'
            if (strlen($waNumber) === 10) {
                $waNumber = '91' . $waNumber;
            }
        } else {
            // Fallback to your provided number: 7017070270 with 91 country code
            $waNumber = '917016370260';
        }

        $waMessage = "Hello, I am interested in your courses and would like to know more.";
    @endphp

    <div class="whatsapp-widget">
        <a href="https://wa.me/{{ $waNumber }}?text={{ urlencode($waMessage) }}" target="_blank" class="whatsapp-btn">
            <i class="bi bi-whatsapp"></i>
            <span class="tooltip-text">Chat with us</span>
        </a>
    </div>

    <style>
        /* Main widget container */
.whatsapp-widget {
    position: fixed;
    bottom: 25px;
    right: 25px;
    z-index: 9999;
}

/* WhatsApp Button */
.whatsapp-btn {
    display: flex;
    align-items: center;
    gap: 10px;
    padding: 14px 18px;
    background: linear-gradient(135deg, #25D366, #1EBE5D);
    color: #fff;
    border-radius: 50px;
    font-size: 15px;
    font-weight: 600;
    text-decoration: none;
    box-shadow: 0 10px 25px rgba(37, 211, 102, 0.35);
    transition: all 0.3s ease;
    animation: bounceIn 1.2s ease;
}

/* Hover effect */
.whatsapp-btn:hover {
    transform: translateY(-3px) scale(1.03);
    box-shadow: 0 15px 35px rgba(37, 211, 102, 0.45);
    color: #fff;
}

/* WhatsApp Icon */
.whatsapp-btn i {
    font-size: 26px;
}

/* Text badge */
.whatsapp-text {
    background: rgba(255,255,255,0.15);
    padding: 6px 12px;
    border-radius: 20px;
    font-size: 14px;
    white-space: nowrap;
}

/* Pulse Ring Effect */
.whatsapp-btn::after {
    content: "";
    position: absolute;
    inset: 0;
    border-radius: 50px;
    animation: pulse 2s infinite;
}

/* Pulse Animation */
@keyframes pulse {
    0% {
        box-shadow: 0 0 0 0 rgba(37, 211, 102, 0.6);
    }
    70% {
        box-shadow: 0 0 0 18px rgba(37, 211, 102, 0);
    }
    100% {
        box-shadow: 0 0 0 0 rgba(37, 211, 102, 0);
    }
}

/* Entry Animation */
@keyframes bounceIn {
    0% {
        opacity: 0;
        transform: scale(0.6);
    }
    60% {
        opacity: 1;
        transform: scale(1.1);
    }
    100% {
        transform: scale(1);
    }
}

/* Mobile Friendly */
@media (max-width: 576px) {
    .whatsapp-text {
        display: none;
    }

    .whatsapp-btn {
        padding: 14px;
        border-radius: 50%;
    }
}

    </style>

    <!---tooltip--->
    @include('frontend.section.tooltip')


    <!-- template js files -->
    @include('frontend.section.script')
</body>

</html>
