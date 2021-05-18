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
<div id="actor">
	<c:forEach items="${movieactor }" var="aa" varStatus="no">
		${ aa.actorname}
	</c:forEach>
</div>
<div id="cate">
	<c:forEach items="${moviecate }" var="cc" varStatus="no">
		${cc.cate }
	</c:forEach>
</div>