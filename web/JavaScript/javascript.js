document.addEventListener('DOMContentLoaded', (event) => {
    const themeSwitcher = document.querySelector('input[type=checkbox]');
    const darkCircle = document.querySelector('.darkCircle');
    const lightCircle = document.querySelector('.lightCircle');
    const body = document.querySelector('body');

    themeSwitcher.addEventListener('change', () => {
        if (themeSwitcher.checked) {
            body.classList.add('dark');
            body.classList.remove('light');
        } else {
            body.classList.add('light');
            body.classList.remove('dark');
        }
    });
});
