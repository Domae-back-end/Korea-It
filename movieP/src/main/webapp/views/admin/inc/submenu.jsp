<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

	<br>
	<c:choose>
		<c:when test="${not empty submenu}">
			
			<c:forEach var="i" items="${submenu }">

			<a href="${i.url}"><button class="mb-3 btn  col-md-12
			<c:choose> 
				<c:when test="${i.url== ppp.service}">
			 btn-success </c:when>
			 <c:otherwise>
			 	btn-secondary
			 
			 </c:otherwise>
			
			
			 </c:choose>
			">${i.title }
			
						</button>	</a>
			</c:forEach>
		</c:when>

	</c:choose>



</html>