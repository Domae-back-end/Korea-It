$(document).ready(function() {

	
	
	  var slides = document.querySelector('.slides'),
        // 클론추가전의 li태그묶음들
        slide = document.querySelectorAll('.slides li'),
        currentIndex = 0;
    slideCnt = slide.length,
        slideWidth = 1000,
        slideMargin = 30,
        prevBtn = document.querySelector('.prev'),
        proBtn = document.querySelector('.next');
    var x = -1190;

    makeclone();

    function makeclone() {
        for (var i = 0; i < slideCnt; i++) {
            var cloneSlide = slide[i].cloneNode(true)
            cloneSlide.classList.add('clone');
            slides.appendChild(cloneSlide);
            //1 2 3 4 5  뒤에 차차 붙여
        }
        for (var i = slideCnt - 1; i >= 0; i--) {
            var cloneSlide = slide[i].cloneNode(true);
            cloneSlide.classList.add('clone');
            slides.prepend(cloneSlide);
            //5 4 3 2 1 앞에서부터 붙여.
        }
        updateWidth();
        setInit();
        setTimeout(function () {
            slides.classList.add('animated');


        }, 100);



    }

    function updateWidth() {
        //기능: 특정종류의 자식노드를 가져올수가 있다야.
        var currentSlides = document.querySelectorAll('.slides li')// 15  예상이됩니다.
        var newSlideCount = currentSlides.length;
        // 새로운 가로길이는 말이야.15 
        var newWidth = (slideWidth + slideMargin) * newSlideCount - slideMargin + 'px';//픽셀까지 써줄 것
        slides.style.width = newWidth;

    }
    //translate X의 기능은 무엇인가.
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
            
       
       
            console.log("현재index." + currentIndex)
            // x = x + 230;
            // document.querySelector('.slides').style.transform = "translateX(" + x + "px) "
        })

        prevBtn.addEventListener('click', function () {
            moveSlide(currentIndex -1);
            console.log("현재index." + currentIndex)
        
        
            // nnslide = document.querySelectorAll('.slides li')

            // console.log(x + "다음사진" + nnslide.length)
            // console.log(slideWidth)
            // x = x - 230;
            // document.querySelector('.slides').style.transform = "translateX(" + x + "px) "
        })

        setInterval(function() {
            moveSlide(currentIndex +1);
            }, 5000);
    

})