$(document).ready(function() {

	var slides = document.querySelector('.slides'),
	slide = document.querySelectorAll('.slides li'),
	currentIndex = 0;
    
    slideCnt = slide.length,
	slideWidth = 1000,
	slideMargin = 0,
	prevBtn = document.querySelector('.prev'),
	proBtn = document.querySelector('.next');
	
	var x = -1190;

	makeclone();

	function makeclone() {
		for (var i = 0; i < slideCnt; i++) {
			var cloneSlide = slide[i].cloneNode(true)
			cloneSlide.classList.add('clone');
			slides.appendChild(cloneSlide);
		}
		for (var i = slideCnt - 1; i >= 0; i--) {
			var cloneSlide = slide[i].cloneNode(true);
			cloneSlide.classList.add('clone');
			slides.prepend(cloneSlide);
		}
		updateWidth();
		setInit();
		setTimeout(function () {
			slides.classList.add('animated');
		}, 100);
	}

	function updateWidth() {
		var currentSlides = document.querySelectorAll('.slides li')
		var newSlideCount = currentSlides.length;
		var newWidth = (slideWidth + slideMargin) * newSlideCount - slideMargin + 'px';
		slides.style.width = newWidth;
    }
	
	function setInit() {
		var initialTranslateVal = - (slideWidth + slideMargin) * slideCnt;
		slides.style.transtorm = 'translateX(' + initialTranslateVal + 'px)';
	}

	var prevBtn = document.querySelector('.prev'),
		proBtn = document.querySelector('.next');

	function moveSlide(num){
		slides.style.left=  -num * (slideWidth+slideMargin)+'px';
		currentIndex = num;
		
		if(currentIndex  ==  slideCnt|| currentIndex == -slideCnt){
			setTimeout(function(){
				slides.classList.remove('animated')    
				slides.style.left='0px'
				currentIndex=0;
			},500)
			
			setTimeout(() => {
				slides.classList.add('animated')    
			}, 550);
		}
	}

	proBtn.addEventListener('click', function () {
		moveSlide(currentIndex +1);
	})

	prevBtn.addEventListener('click', function () {
		moveSlide(currentIndex -1);
	})

	setInterval(function() {
		moveSlide(currentIndex +1);
	}, 5000);
})