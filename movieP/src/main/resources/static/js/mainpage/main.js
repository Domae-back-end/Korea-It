$(document).ready(function(){
	
		function picture_slider(){
		    setInterval( switch_picture, 1000 ); // corrected removing "()"
		}

		var bild = document.getElementById("bannerimg")
		var i = 0; // Start from image 0.jpg
		picture_slider();

		function switch_picture() { 
			bild.src = "/resources/banner/poster"+ ((i++ % 5)+1) +".jpg";
			
		}
		
	})