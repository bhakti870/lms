<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>SkillPoint Loader</title>

<style>
/* ===== PRELOADER WRAPPER ===== */
.preloader {
    position: fixed;
    inset: 0;
    background: #0f172a;
    display: flex;
    align-items: center;
    justify-content: center;
    z-index: 9999;
    transition: opacity 0.5s ease;
}

/* ===== LOADER CONTENT ===== */
.skillpoint-loader {
    text-align: center;
}

/* ===== LOGO ===== */
.skillpoint-loader .logo {
    width: 90px;
    margin-bottom: 15px;
    animation: pulse 1.6s infinite;
}

/* ===== BRAND NAME ===== */
.brand-name {
    font-size: 38px;
    font-weight: 800;
    letter-spacing: 2px;
    color: #38bdf8;
}

.brand-name span {
    display: inline-block;
    animation: wave 1.4s infinite;
}

/* animation delays */
.brand-name span:nth-child(1){animation-delay:.1s}
.brand-name span:nth-child(2){animation-delay:.2s}
.brand-name span:nth-child(3){animation-delay:.3s}
.brand-name span:nth-child(4){animation-delay:.4s}
.brand-name span:nth-child(5){animation-delay:.5s}
.brand-name span:nth-child(6){animation-delay:.6s}
.brand-name span:nth-child(7){animation-delay:.7s}
.brand-name span:nth-child(8){animation-delay:.8s}
.brand-name span:nth-child(9){animation-delay:.9s}
.brand-name span:nth-child(10){animation-delay:1s}

/* ===== TAGLINE ===== */
.tagline {
    margin-top: 8px;
    color: #cbd5f5;
    font-size: 14px;
    opacity: 0.8;
}

/* ===== ANIMATIONS ===== */
@keyframes wave {
    0%, 100% {
        transform: translateY(0);
        opacity: 0.6;
    }
    50% {
        transform: translateY(-8px);
        opacity: 1;
    }
}

@keyframes pulse {
    0% {
        transform: scale(1);
        opacity: 0.85;
    }
    50% {
        transform: scale(1.1);
        opacity: 1;
    }
    100% {
        transform: scale(1);
        opacity: 0.85;
    }
}
</style>
</head>

<body>

<!-- ===== PRELOADER ===== -->
<div class="preloader">
    <div class="skillpoint-loader">
        <!-- Replace logo path -->
        <!-- <img src="logo.png" class="logo" alt="SkillPoint Logo"> -->
         <i class="bi bi-mortarboard-fill text-theme me-2"></i>

        <h1 class="brand-name">
            <span>S</span><span>k</span><span>i</span><span>l</span><span>l</span>
            <span>P</span><span>o</span><span>i</span><span>n</span><span>t</span>
        </h1>

        <!-- <p class="tagline">Level Up Your Skills</p>i -->
    </div>
</div>

<!-- ===== MAIN PAGE CONTENT (DEMO) ===== -->
<!-- <div style="padding:40px;color:#111;font-family:sans-serif">
    <h2>SkillPoint LMS Loaded 🎉</h2>
    <p>Your website content goes here.</p>
</div> -->

<script>
/* ===== SHOW LOADER ONLY ONCE PER SESSION ===== */
(function() {
    const preloader = document.querySelector(".preloader");
    const hasSeenLoader = sessionStorage.getItem('skillpoint_loader_shown');

    if (hasSeenLoader) {
        // If already seen in this session, hide immediately without ceremony
        if (preloader) {
            preloader.style.display = "none";
        }
    } else {
        // First time in session: Show then hide
        window.addEventListener("load", function () {
            if (preloader) {
                preloader.style.opacity = "0";
                setTimeout(() => {
                    preloader.style.display = "none";
                    sessionStorage.setItem('skillpoint_loader_shown', 'true');
                }, 600);
            }
        });
    }
})();

/* Disable Turbo-driven loader triggers to prevent it appearing on every click */
document.addEventListener("turbo:load", function () {
    const preloader = document.querySelector(".preloader");
    if (preloader) {
        preloader.style.display = "none";
    }
});
</script>

</body>
</html>
