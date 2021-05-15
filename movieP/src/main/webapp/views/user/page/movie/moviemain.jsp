<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>movie main</title>
<% int cnt =0; %>
<c:forEach items="${moviedata }">
	<% cnt = cnt+1; %>
</c:forEach>
<script src="<c:url value="/my_js/jquery-3.6.0.js"/>"></script>
<script>
$(function(){
	$(".tBtn").click(function(){
		alert("예매페이지로 보내기")
	})
})
</script>

<style>
	.wrapper{
		width: 1000px;
		height: 100%;
		margin-left: 150px;
	}

	.pp{
		background: #a0a;
		color: white;
		width: 800px;
		margin-left: 200px;

	}
	
	.pp>div{
		display: inline-block;
		width: 250px;
		font-size: 30px;	
	}	
	.pp>div>a{
		text-decoration: none;
	}
	.wrapper>table{
		display: inline-block;
		margin: 35px;
	}
	.wrapper>table>tr{
		width: 200px;
		
	}
	#pos>img{
		width:250px;
		height:400px;
	}

</style>

</head>
<body>
	<div class = "pp">
		<div><a href='<c:url value="/views/user/page/movie/boxoffice.jsp"/>'>박스오피스</a></div>
		<div>상영예정작</div>
	</div>
<div class = "wrapper">
	<c:forEach items="${moviedata }" var="mm" varStatus="no">
	<table border="">
		<tr><td>${no.index +1}</td></tr>
		<tr><td id="pos"><img alt ="" src='<c:url value= "/views/user/img/movie/${mm.movieimg }"/>'></td></tr>
		<tr><td>${mm.movietitle }</td></tr>
		<tr>
			<td>평점: ${mm.star }
			<input class = "tBtn" type="button" value="예매하기"></td>
		</tr>
	</table>
	</c:forEach>
</div>

</body>
</html>