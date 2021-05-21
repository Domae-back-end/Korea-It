<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
	#plot{
		width: 1000px;
		background: pink;
	}
</style>
<div id="plot">${moviedetail.mplot }</div><hr>
<div id="dirc">
감독: ${moviedetail.mdir }
개봉일: ${moviedetail.mdate_s }
</div>
<div id="actor">
	배우: 
	<c:forEach items="${movieactor }" var="aa" varStatus="no">
		${ aa.actorname}
	</c:forEach>
</div>
<div id="cate">
	장르: 
	<c:forEach items="${moviecate }" var="cc" varStatus="no">
		${cc.cate }
	</c:forEach>
</div>