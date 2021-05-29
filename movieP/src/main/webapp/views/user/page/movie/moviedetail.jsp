<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
    
<%
	String ss = request.getParameter("sub");
	String subUrl = "submenu/"+ss+".jsp";
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#detail{
		background: pink;
		width: 1000px;
		height: 560px;
		display:inline-block;
	}
	
	#title{
		width: 100px;
		height: 50px;
		font-size: 30px;
		color:white;
	}
	
	#poster{
		width: 300px;
		margin-right: 50px;
		float:right;
		margin-bottom: 0px;
	}
	
	#poster>img{
		width: 300px;
		height: 450px;
	}
	
	#link{
		width: 300px;
		font-size:30px;
		display: inline-block;
	}
	#sub{
	
	}
	#sub1>a{
		font-size: 30px;
	}
	#gpa{
		width: 1000px;
		display: inline-block;
		font-size:30px;
	}
	#gpa>div>i{
		color:gold;
		font-size:30px;
	}
</style>
</head>
<body>
<div>
	<div id="detail">
		<p id="title">${moviedetail.movietitle }</p>
		<div id="poster"><img src="/moviedata/${moviedetail.movieimg }"></div>	
	    <div id="gpa">
	    <div  style="float: left;">
	    	평점:
			<c:forEach begin="1" end="${moviedetail.gpa }" var="st" varStatus="no">
				<i class="fas fa-star"></i>
				</c:forEach>
			<c:forEach begin="1" end="${5-moviedetail.gpa }" var="st">
				<i class="far fa-star"></i>
			</c:forEach>
		</div>
			<div id="link" style="float: right;">
			<a href ="/user/movietime/list?movietitle=${moviedetail.movietitle }">예매하기</a>
			</div>
		</div>

	</div>
</div>
<div id="sub1">
	<a href="?sub=info&ind=${moviedetail.m_index }">주요정보</a>
	<a href="?sub=review&ind=${moviedetail.m_index }">관람평</a>
	<a href="?sub=pic&ind=${moviedetail.m_index }">스틸컷</a>
</div>
<div>
	<jsp:include page="<%=subUrl %>"></jsp:include>
</div>
</body>
</html>