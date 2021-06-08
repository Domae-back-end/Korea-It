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

<style>
	.wrapper{
		width: 1000px;
		height: 100%;
		text-align: left;
	}

	.pp{
		background: #c5f7f5;
		color: white;
		width: 1000px;
	}
	
	.pp>div{
		display: inline-block;
		width: 250px;
		font-size: 30px;	
	}	
	.pp>div>a{
		text-decoration: none;
	}
	.pp>div>a:hover{
		border: 1px solid #a00;
	}
	
	#movieinfomation{
		display: inline-block;
		margin: 35px;
		text-align: cetner;
	}
	td{
		width: 200px;
		text-align: center;
	}
	#pos>a>img{
		width:250px;
		height:400px;
	}
	#sh{
		width:1000px;
		float: right;
	}
	#searchbutton{
		display:inline-block;
		width:1000px;
		text-align: center;
		height: 50px;
		margin-top: 10px;
		text-align: right;
	}
	form{
		width: 1000px;
		hegith: 50px;
		margin-top: 10px;
		text-align: right;
	}
	.search{
		display:inline-block;
	}
	.sbtn{
	display:inline-block;
	}

</style>

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