<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//해당 페이지로 이동해야 함.
%>

<img id="bannerimg" src="" alt="이미지줘" style="width: 200px;height:150px;" />
바디
<script>
	$(document).ready(function(){
	
		function picture_slider(){
		    setInterval( switch_picture, 1000 ); // corrected removing "()"
		}
		var bild = document.getElementById("bannerimg")		
		picture_slider();
		function switch_picture() { // don't iterate a loop in here!
			bild.src = "/banner/poster"+ ((i++ % 5)+1) +".jpg";
		
		}
		
	})
	
	
	
	


</script>