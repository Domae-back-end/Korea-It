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

table {
	width: 500px;
	margin: 0 auto;
}
</style>
<div class="layouttime">
	<form action="">
		<select name="time_index">
			<option value="1">영화제목</option>
			<option value="2">날짜</option>
			<option value="3">시작시간</option>
			<option value="4">종료시간</option>
			<option value="5">관</option>
		</select>
		<input type="text" name="search" />
		<input type="submit" value="검색"/>
	</form>
</div>
<div class="timelayout">
	<div class="timebox">번호</div>
	<div class="timebox">영화 제목</div>
	<div class="timebox">관</div>
	<div class="timebox">날짜</div>
	<div class="timebox">시작 시간</div>
	<div class="timebox">종료 시간</div>
	<div class="both"></div>
	<c:forEach var="a" items="${data }" varStatus="in">
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