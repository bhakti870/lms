
// 1. Select the section and all counter numbers
const statsSection = document.querySelector('.stats-section');
const counters = document.querySelectorAll('.counter');
let started = false; // Flag to ensure animation runs only once

// 2. The Animation Function
function startCounting() {
    counters.forEach(counter => {
        // Get the target number (e.g., 6.8, 120)
        const target = parseFloat(counter.innerText);

        // Check if the number has a decimal (like 6.8) or is an integer (like 120)
        const isFloat = counter.innerText.includes('.');

        // Animation settings
        const duration = 2000; // 2000ms = 2 seconds
        const stepTime = 20;   // Update every 20ms
        const steps = duration / stepTime;
        const increment = target / steps;

        let current = 0;

        const timer = setInterval(() => {
            current += increment;

            if (current >= target) {
                // Animation finished: set to exact target
                counter.innerText = target;
                clearInterval(timer);
            } else {
                // Animation running: update text
                // If it was a decimal (6.8), keep 1 decimal place. If integer, round it.
                counter.innerText = isFloat ? current.toFixed(1) : Math.ceil(current);
            }
        }, stepTime);
    });
}

// 3. The Observer (Triggers the function when you scroll to the section)
const observer = new IntersectionObserver((entries) => {
    // If the section is visible in the viewport...
    if (entries[0].isIntersecting && !started) {
        startCounting();
        started = true; // Stop it from running again
    }
}, { threshold: 0.5 }); // Trigger when 50% of the section is visible

// Start observing
if (statsSection) {
    observer.observe(statsSection);
}

// Select the button and icon
const toggleBtn = document.getElementById('theme-toggle');
const themeIcon = toggleBtn.querySelector('i');
const body = document.body;

// Check for saved user preference
const savedTheme = localStorage.getItem('theme');
if (savedTheme === 'dark') {
    body.setAttribute('data-theme', 'dark');
    themeIcon.classList.replace('bi-moon-fill', 'bi-sun-fill');
    toggleBtn.classList.replace('btn-light', 'btn-dark'); // Optional button styling
}

// Toggle Event
toggleBtn.addEventListener('click', () => {
    const isDark = body.getAttribute('data-theme') === 'dark';

    if (isDark) {
        // Switch to Light
        body.removeAttribute('data-theme');
        themeIcon.classList.replace('bi-sun-fill', 'bi-moon-fill');
        toggleBtn.classList.replace('btn-dark', 'btn-light');
        localStorage.setItem('theme', 'light');
    } else {
        // Switch to Dark
        body.setAttribute('data-theme', 'dark');
        themeIcon.classList.replace('bi-moon-fill', 'bi-sun-fill');
        toggleBtn.classList.replace('btn-light', 'btn-dark');
        localStorage.setItem('theme', 'dark');
    }
});