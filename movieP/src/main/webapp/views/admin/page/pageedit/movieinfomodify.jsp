<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%  

	
	String data= "dd";
	



%>


	<script>
		$(document).ready(function() {

			//윈도우가 열리면
				document.getElementById("addactor").onclick = function() {

					var newinput = document.createElement("input");
					newinput.setAttribute("type", "text");
					newinput.setAttribute("name", "mactrs");
					document.getElementById("actor").appendChild(newinput)
					var newbtn = document.createElement("button");
					newbtn.setAttribute("type","button")
					newbtn.classList.add("actorsearch")
					alert("배우 추가합니다.");
				}

				document.getElementById("addcate").onclick = function() {
					var newinput = document.createElement("input");
					newinput.setAttribute("type", "text");
					newinput.setAttribute("name", "mcate");
					document.getElementById("cate").appendChild(newinput)
					alert("카테고리 추가");
				}
				document.getElementById("addimg").onclick = function() {
					var newinput = document.createElement("input");
					newinput.setAttribute("type", "file");
					newinput.setAttribute("name", "infoimg");
					document.getElementById("image").appendChild(newinput)			
					alert("이미지 추가");
				}
				//window.open("URL", "팝업이름", "팝업 옵션");				
				
				var searchbtns = document.getElementsByClassName("actorsearch")
				
				var searchfunc = function(){
					alert("검색들어감")
				}
				
				//for(var i=0; i<searchbtns.length; i++){
				// searchbtns[i].addEventListener('click', searchfunc(), false);
				//}
				
				Array.from(searchbtns).forEach(function(element){
					element.addEventListener('click',searchfunc)
				});
				
				
		})
	</script>




	<form action="movieinfomodifyReg" method="post"
		enctype="multipart/form-data">
		<div>
		</div>
		<!-- //  movieactors   moviecategory
		 -->
		영화제목 <input type="text" name="movietitle" value="${data.midto.movietitle}"  /><br>
		 감독 <input type="text" name="mdir" value="${data.midto.mdir}" /><br>
<hr />
		<div id="actor">
			<button type="button" id="addactor">배우추가</button>
			
			<c:forEach var = "i" items="${data.midto.allactors}" varStatus="no"  >
		배우 <input type="text" name="mactrs" id="mactrs" value="${i}"/>	<button type="button" class="actorsearch" data-popup-open="${no.index+1} " id="actorsearch">배우찾기</button><br>
		<!--각 actorsearch 와  mactrs value를 엮어주는 방법..  -->
	</c:forEach>

			
	

		</div>
<hr />
		<div id="cate">
			<button type="button" id="addcate">카테고리추가</button>
				<c:forEach var = "i" items="${data.midto.allcates}" varStatus="no"  >
			카테고리 <input type="text" name="mcate" value="${i}" /><br>
			</c:forEach>
			
		</div>
		<hr />
		개봉일 <input type="date" name="moviedate" value="${data.midto.moviedate}" /><br> <!--setMoviedate  -->
		<hr />
		상영시간(숫자!) <input	type="text" name="mplaytime"  value="${data.midto.mplaytime}"/><br>
		<hr />
		 줄거리<br><textarea name="mplot" rows="5" cols="30"  value="">${data.midto.mplot}</textarea>
		<br>
		<hr />
		<div id="image">
			<button type="button" id="addimg">이미지추가</button>
			영화이미지 <input type="file" name="infoimg" /><br>
			영화이미지 <input type="file" name="infoimg" /><br>
			
		</div>
		<hr />
		<input type="submit" value="영화정보 수정하기" />
	</form>


</body>
</html>