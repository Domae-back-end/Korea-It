<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		background: black;
		width: 1000px;
		display:inline-block;
	}
	
	#title{
		width: 100px;
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
	}
	
	#link{

		margin-left: 750px;
		font-size:30px;
	}
	#sub{
	
	}
	#sub1>a{
		font-size: 30px;
	}
</style>
</head>
<body>
<div>
	<div id="detail">
		<p id="title">${moviedetail.movietitle }</p>
		<p id="poster"><img src="/resources/moviedata/${moviedetail.movieimg }"></p>	
		<div id="link">
			<a href ="/user/movietime/list?movietitle=${moviedetail.movietitle }" /> 예매하기</a>
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