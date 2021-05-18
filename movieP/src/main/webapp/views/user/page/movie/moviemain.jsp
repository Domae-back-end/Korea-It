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

<%
	String cg = request.getParameter("cg");
	String cgUrl = cg+".jsp";
%>

<script src="<c:url value="/my_js/jquery-3.6.0.js"/>"></script>
<script>

$(function(){
	
	$("#tBtn").click(function(){
		alert("예매창으로");
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
	#pos>a>img{
		width:250px;
		height:400px;
	}
	

</style>

</head>
<body>
	<div class = "pp">
		<div class ="btn1"><a href = "?cg=boxoffice">박스오피스</a></div>
		<div class ="btn2"><a href = "?cg=expect">상영예정작</a></div>
	</div>
<div class = "wrapper">
	<jsp:include page = "<%=cgUrl %>"/>
</div>

</body>
</html>