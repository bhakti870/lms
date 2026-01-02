function initHeaderDropdowns() {
    const navbarDropdowns = document.querySelectorAll('.navbar .dropdown, .navbar .dropend');

    navbarDropdowns.forEach(function (dropdown) {
        const dropdownToggle = dropdown.querySelector('.dropdown-toggle');
        const dropdownMenu = dropdown.querySelector('.dropdown-menu');

        if (!dropdownToggle || !dropdownMenu) return;

        // Remove any click event listeners by preventing default
        dropdownToggle.addEventListener('click', function (e) {
            e.preventDefault();
            e.stopPropagation();
            return false;
        });

        // Show dropdown on mouse enter
        dropdown.addEventListener('mouseenter', function () {
            dropdownMenu.classList.add('show');
            dropdownToggle.setAttribute('aria-expanded', 'true');
        });

        // Hide dropdown on mouse leave
        dropdown.addEventListener('mouseleave', function () {
            dropdownMenu.classList.remove('show');
            dropdownToggle.setAttribute('aria-expanded', 'false');
        });

        // Prevent dropdown from closing when clicking inside
        dropdownMenu.addEventListener('click', function (e) {
            e.stopPropagation();
        });
    });
}

document.addEventListener('turbo:load', initHeaderDropdowns);

