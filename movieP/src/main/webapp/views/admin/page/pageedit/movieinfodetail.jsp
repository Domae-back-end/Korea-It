<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<script>
		$(document).ready(function() {

			window.onload = function() {//윈도우가 열리면
				document.getElementById("addactor").onclick = function() {

					var newinput = document.createElement("input");
					newinput.setAttribute("type", "text");
					newinput.setAttribute("name", "mactrs");
					document.getElementById("actor").appendChild(newinput)
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
					newinput.setAttribute("name", "file");
					document.getElementById("image").appendChild(newinput)			
					alert("이미지 추가");
				}
			}

		})
	</script>




	<form action="/admin/pageedit/movieinfoinsertReg" method="post"
		enctype="multipart/form-data">
		영화제목 <input type="text" name="movietitle" /><br> 감독 <input
			type="text" name="mdir" /><br>
<hr />
		<div id="actor">
			<button type="button" id="addactor">배우추가</button>
			배우 <input type="text" name="mactrs" />	<button type="button" id="actorsearch">배우찾기</button><br>
			배우 <input type="text" name="mactrs" /><button type="button" id="actorsearch">배우찾기</button><br>	
			

		</div>
<hr />
		<div id="cate">
			<button type="button" id="addcate">카테고리추가</button>
			카테고리 <input type="text" name="mcate" /><br>
			카테고리 <input type="text" name="mcate" /><br>
			
		</div>
		<hr />
		개봉일 <input type="date" name="mdate" /><br> 
		<hr />
		상영시간(숫자!) <input	type="text" name="mplaytime" /><br>
		<hr />
		 줄거리<br><textarea name="mplot" rows="5" cols="30"></textarea>
		<br>
		<hr />
		<div id="image">
			<button type="button" id="addimg">이미지추가</button>
			영화이미지 <input type="file" name="file" /><br>
			영화이미지 <input type="file" name="file" /><br>
			
		</div>
		<hr />
		<input type="submit" value="영화 등록하기" />
	</form>


</body>
</html>