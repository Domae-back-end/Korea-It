<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
	<div id="detail">
		<p id="title">${moviedetail.movietitle }</p>
		<p id="poster"><img src="/views/user/img/movie/${moviedetail.movieimg }"></p>	
	</div>
</div>
<div>
	<p id="plot">${moviedetail.mplot }</p>
	<p id="movieinfo">${moviedetail.mdir }</p>
</div>
</body>
</html>