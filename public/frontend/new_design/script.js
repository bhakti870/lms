// 2. The Animation Function
function startCounting(counters) {
    counters.forEach(counter => {
        const target = parseFloat(counter.innerText);
        const isFloat = counter.innerText.includes('.');
        const duration = 2000;
        const stepTime = 20;
        const steps = duration / stepTime;
        const increment = target / steps;
        let current = 0;

        const timer = setInterval(() => {
            current += increment;
            if (current >= target) {
                counter.innerText = target;
                clearInterval(timer);
            } else {
                counter.innerText = isFloat ? current.toFixed(1) : Math.ceil(current);
            }
        }, stepTime);
    });
}

function initStats() {
    const statsSection = document.querySelector('.stats-section');
    const counters = document.querySelectorAll('.counter');
    let started = false;

    if (statsSection && counters.length > 0) {
        const observer = new IntersectionObserver((entries) => {
            if (entries[0].isIntersecting && !started) {
                startCounting(counters);
                started = true;
            }
        }, { threshold: 0.5 });
        observer.observe(statsSection);
    }
}

function initTheme() {
    const toggleBtn = document.getElementById('theme-toggle');
    if (!toggleBtn) return;

    const themeIcon = toggleBtn.querySelector('i');
    const body = document.body;

    // Check for saved user preference
    const savedTheme = localStorage.getItem('theme');
    if (savedTheme === 'dark') {
        body.setAttribute('data-theme', 'dark');
        if (themeIcon) themeIcon.classList.replace('bi-moon-fill', 'bi-sun-fill');
        toggleBtn.classList.replace('btn-light', 'btn-dark');
    }

    // Toggle Event
    toggleBtn.addEventListener('click', () => {
        const isDark = body.getAttribute('data-theme') === 'dark';
        if (isDark) {
            body.removeAttribute('data-theme');
            if (themeIcon) themeIcon.classList.replace('bi-sun-fill', 'bi-moon-fill');
            toggleBtn.classList.replace('btn-dark', 'btn-light');
            localStorage.setItem('theme', 'light');
        } else {
            body.setAttribute('data-theme', 'dark');
            if (themeIcon) themeIcon.classList.replace('bi-moon-fill', 'bi-sun-fill');
            toggleBtn.classList.replace('btn-light', 'btn-dark');
            localStorage.setItem('theme', 'dark');
        }
    });
}

// Initial Run & Turbo Support
document.addEventListener('turbo:load', () => {
    initStats();
    initTheme();
});