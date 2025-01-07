// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
const semi_title = document.querySelectorAll('.semi-title');

const showTitle = (entries) => {
    const keyframes = [
        { opacity: 0, transform: 'translate(200px, 0)' },
        { opacity: 1, transform: 'translate(0, 0)' }
    ];
    const options = {
        duration: 2000,
        fill: 'forwards',
        threshold: 0,
    };
    entries[0].target.animate(keyframes, options);
};

const titleObserver = new IntersectionObserver(showTitle);

semi_title.forEach((one_title)=> {
    titleObserver.observe(one_title);
});

const btn = document.getElementById("top-btn");

btn.addEventListener("click", () =>{
    window.scroll({
        top: 0,
    });
});

const menu_btn = document.getElementById("menu-btn");
const side_bar = document.querySelector('.on-side-bar');
menu_btn.addEventListener("click", () =>{
    side_bar.classList.toggle('on-side-bar');
});
