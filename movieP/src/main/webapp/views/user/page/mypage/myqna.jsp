<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<input type="hidden" name="userid" id="userid" value="${sessionId }" />

<h3>나의 문의내역</h3>
	<c:choose>
	
		<c:when test="${param.detail != null }">
			<jsp:include page="myqnadetail.jsp" /> 
		</c:when>
		
		<c:otherwise>
			<jsp:include page="myqnalist.jsp" /> 
		</c:otherwise>
	
	</c:choose>

