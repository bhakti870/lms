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



// Initial Run & Turbo Support
document.addEventListener('turbo:load', () => {
    initStats();
});