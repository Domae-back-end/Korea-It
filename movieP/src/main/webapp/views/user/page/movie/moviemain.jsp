<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
<link rel="stylesheet" type="text/css" href = "/resources/css/movie/moviemaincss.css"/>

<title>movie main</title>
<% int cnt =0; %>
<c:forEach items="${moviedata }">
	<% cnt = cnt+1; %>
</c:forEach>

<%
	String cg = request.getParameter("cg");
	String cgUrl = cg+".jsp";
%>

<script src="<c:url value="/resources/my_js/jquery-3.6.0.js"/>"></script>
<script>

function enterkey() {
    if (window.event.keyCode == 13) {
    	$(".sbtn").click();
    }
}

function likeGo(idx){
	
	location.href = "/user/movie/likeReg?m_index="+idx+"&cg=${param.cg}"
}

$(function(){
	

	$(".sbtn").click(function(){
		var value = $(".search").val();
		location.replace("moviemain?cg=<%=cg%>&sch="+$(".search").val());
	})
	
	
})	

</script>
</head>
<body>
<div class = "pp">
	<div class ="btn1"><a href = "?cg=boxoffice">박스오피스</a></div>
	<div class ="btn2"><a href = "?cg=expect">상영예정작</a></div>
</div>
<div id="searchbutton">
		<input class="search" type = "text" onkeyup="enterkey()" value="${param.sch}"/>
		<input class="sbtn" type="button" value="검색" />
</div>
<div class = "wrapper">
	<jsp:include page = "<%=cgUrl %>"/>
</div>

</body>
</html>