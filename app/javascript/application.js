// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
const semi_title = document.querySelectorAll('.semi-title');

const showTitle = (entries) => {
    const keyframes = {
        opacity: [0, 1],
        translate: ['0 400px', 1],
    };
    const options = {
        duration: 1000,
        fill: 'forwards',
        rootMargin: '-10px',
        threshold: 0,
    };
    entries[0].target.animate(keyframes, options);
};

const titleObserver = new IntersectionObserver(showTitle);

semi_title.forEach((one_title)=> {
    titleObserver.observe(one_title);
});


