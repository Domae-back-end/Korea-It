<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	int cnt =0;
%>
<c:forEach items="${movieactor }" var="n">
	<% cnt = cnt+1; %>
</c:forEach>
<div id="plot">줄거리<br> ${moviedetail.mplot }</div><hr>
<div id="dirc">
감독: ${moviedetail.mdir }
개봉일: ${moviedetail.mdate_s }
</div>
<div id="actor">
	<%
		if(cnt > 0){
	%>
	배우: 
		<c:forEach items="${movieactor }" var="aa" varStatus="no">
			${ aa.actorname}
		</c:forEach>
<%} %>
</div>
<div id="cate">
	장르: 
	<c:forEach items="${moviecate }" var="cc" varStatus="no">
		${cc.cate }
	</c:forEach>
</div>