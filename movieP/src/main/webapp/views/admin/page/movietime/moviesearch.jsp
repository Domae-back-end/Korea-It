<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
	
.timebox {
	width: 100px;
	height: 50px;
	float: left;
	line-height: 50px;
	border: 1px solid #000;
}
.both {
	clear: both;
}
.timelayout{
	width: 624px;
	height: 100%;
	margin: 0 auto;
}
.layouttime{
	width: 1000px;
	height: 50px;
	margin: 10px auto;
}
.layouttime > form > input[type="text"] {
	width: 500px;
	height: 25px;
}
.layouttime > form > input[type="submit"] {
	width: 100px;
	height: 25px;
}
</style>
<div class="layouttime">
	<form action="">
		<input type="text" />
		<input type="submit" value="검색"/>
	</form>
</div>
<div class="timelayout">
	<c:forEach var="a" items="${data.time }" varStatus="in">
		<div class="timebox">${in.index }</div>
		<div class="timebox">${a.movietitle }</div>
		<div class="timebox">${a.sectorno }</div>
		<div class="timebox">
		<fmt:formatDate value="${a.reg_date }" type="both"
							pattern="yyyy-MM-dd" />
		</div>
		<div class="timebox">
		<fmt:formatDate value="${a.starttime }" type="both"
							pattern="hh:mm:ss" />
		</div>
		<div class="timebox">
		<fmt:formatDate value="${a.endtime }" type="both"
							pattern="hh:mm:ss" />
		</div>
		<div class="both"></div>
	</c:forEach>
</div>