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
	<br>
	<c:choose>
		<c:when test="${not empty submenu}">

			<c:forEach var="i" items="${submenu }">

				<a href="${i.url}">${i.title }</a>
				<br>

			</c:forEach>
		</c:when>

	</c:choose>


</body>
</html>