<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
	.ticketinglay1{
		width: 1000px;
		height: 100%;
		margin: 0 auto;
		background-color: #F5F5DC;
	}
	.both{
		clear: both;
	}
	.lay1_1{
		width: 250px;
		height: 500px;
		margin: 5px;
		border: 1px solid #000;
		float: left;
	}
	.lay1_2{
		width: 150px;
		height: 500px;
		margin: 5px;
		border: 1px solid #000;
		float: left;
	}
	.movietitle{
		width: 250px;
		height: 50px;
		color: white;
		border: 1px solid #000;
		text-align: center;
		line-height: 50px;
		background: black;
	}
	.movietitle2{
		width: 150px;
		height: 50px;
		color: white;
		border: 1px solid #000;
		text-align: center;
		line-height: 50px;
		background: black;
	}
	.movietitlelay{
		width: 100%;
		height: 50px;
		font-weight: bold;
	}
</style>

<div class="ticketinglay1">
	<div class="lay1_1">
	<div class="movietitle">영화</div>
		<c:forEach var="a" items="${data.movielist}">
			<div class="movietitlelay"><a href="?movietitle=${a.movietitle }">${a.movietitle }</a></div>
		</c:forEach>
	</div>
	<div class="lay1_1">
		<div class="movietitle">극장</div>
			<div class="movietitlelay"><a href="?sectorno=기존관">기존관</a></div>
			<div class="movietitlelay"><a href="?sectorno=3D">3D</a></div>
			<div class="movietitlelay"><a href="?sectorno=작은관">작은관</a></div>
	</div>
	<div class="lay1_2">
		<div class="movietitle2">날짜</div>
	</div>
	<div class="lay1_1">
		<div class="movietitle">시간</div>
	</div>
	<div class="both"></div>
</div> 