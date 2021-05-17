<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2> 배너등관리 &#36;data => ${empty data}</h2>

<script>



</script>

<div id="bannercontainer">
<c:forEach var="i" items="${data}" >

		<div id="banner${i.bannerindex }">${i.bannerindex }</div>
		<img src='<c:url value="/banner/${i.imgurl}"/>'  style="width:300px;height:180px"  alt="이;미지내놔" />
		<button id="del${i.bannerindex }" value="${i.bannerindex }"  >삭제하기</button>
		<button id="change${i.bannerindex }" value="${i.bannerindex }"  >수정하기</button>
		
</c:forEach>
</div>



</body>
</html>