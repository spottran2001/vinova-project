// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "./controllers"
import * as bootstrap from "bootstrap"

let product_items = document.querySelectorAll('.carousel .new-product-carousel')

product_items.forEach((el) => {
    const minPerSlide = 3
    let next = el.nextElementSibling
    for (var i=1; i<minPerSlide; i++) {
        if (!next) {
            // wrap carousel by using first child
            next = product_items[0]
        }
        let cloneChild = next.cloneNode(true)
        el.appendChild(cloneChild.children[0])
        next = next.nextElementSibling
    }
});

let promo_items = document.querySelectorAll('.carousel .promo-carousel')

promo_items.forEach((el) => {
    const minPerSlide = 2
    let next = el.nextElementSibling
    for (var i=1; i<minPerSlide; i++) {
        if (!next) {
            // wrap carousel by using first child
            next = promo_items[0]
        }
        let cloneChild = next.cloneNode(true)
            el.appendChild(cloneChild.children[0])
            next = next.nextElementSibling
        }
})

let items = document.querySelectorAll('.carousel .product-image')

		items.forEach((el) => {
			const minPerSlide = 4
			let next = el.nextElementSibling
			for (var i=1; i<minPerSlide; i++) {
				if (!next) {
            // wrap carousel by using first child
            next = items[0]
        }
        let cloneChild = next.cloneNode(true)
        el.appendChild(cloneChild.children[0])
        next = next.nextElementSibling
    }
})


/***********
	Carousel
************/

const carouselContainer = document.querySelector('.carousel-container');
const listImageArea = carouselContainer.querySelector('.carousel-inner');
const listOfImages = listImageArea.querySelectorAll('img');
const currentImage = carouselContainer.querySelector('.current-image');


function changeCurrentImage (newImage) {
	currentImage.classList.add('fadeIn');
	setTimeout(function () {
		currentImage.classList.remove('fadeIn');
	}, 500);
	currentImage.attributes.src.value = this.attributes.src.value;
	//listOfImages.forEach(image => image.classList.remove('current-image-list'));

	this.classList.add('img-fluid');
}

(function () {
    if ( typeof NodeList.prototype.forEach === "function" ) return false;
    NodeList.prototype.forEach = Array.prototype.forEach;
})();

//listOfImages.forEach(image => image.addEventListener('click', changeCurrentImage));
listOfImages.forEach(function(image) {
	image.addEventListener('click', changeCurrentImage);
});
