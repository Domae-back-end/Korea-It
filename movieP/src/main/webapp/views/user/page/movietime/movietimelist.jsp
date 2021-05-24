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
		overflow:auto;
		width: 250px;
		height: 500px;
		margin: 5px;
		border: 1px solid #000;
		float: left;
	}
	.lay1_2{
		overflow:scroll;
		width: 150px;
		height: 500px;
		margin: 5px;
		border: 1px solid #000;
		float: left;
	}
	.movietitle{
		width: 248px;
		height: 50px;
		color: white;
		border: 1px solid #000;
		text-align: center;
		line-height: 50px;
		background: black;
	}
	.movietitle2{
		width: 130px;
		height: 50px;
		color: white;
		border: 1px solid #000;
		text-align: center;
		line-height: 50px;
		background: black;
	}
	.movietitlelay{
		width: 248px;
		height: 50px;
		text-align: center;
		font-weight: bold;
	}
	.totaltiketing{
		width: 100%;
		height: 100px;
		background: gray;
		color: black;
		text-align: center;
		font-weight: bold;
		font-size: 20px;
	}
	.buttonticket{
		width: 100px;
		height: 50px;
		float: right;
	}
</style>
<form action="">
	<div class="ticketinglay1">
		<div class="lay1_1">
		<div class="movietitle">영화</div>
			<c:forEach var="a" items="${data.movielist}">
				<div class="movietitlelay"><a href="?movietitle=${a.movietitle }">${a.movietitle }</a></div>
			</c:forEach>
		</div>
		<div class="lay1_1">
			<div class="movietitle">극장</div>
				<div class="movietitlelay"><a href="?movietitle=<%=request.getParameter("movietitle") %>&sectorno=기존관">기존관</a></div>
				<div class="movietitlelay"><a href="?movietitle=<%=request.getParameter("movietitle") %>&sectorno=3D관">3D</a></div>
				<div class="movietitlelay"><a href="?movietitle=<%=request.getParameter("movietitle") %>&sectorno=작은관">작은관</a></div>
			</div>
		<div class="lay1_2">
			<div class="movietitle2">날짜</div>
		</div>
		<div class="lay1_1">
			<div class="movietitle">선택</div>
		</div>
		<div class="both"></div>
		<div class="totaltiketing">
			영화 : <%=request.getParameter("movietitle") %>   /
			관 : <%=request.getParameter("sectorno") %>   /
			시간 : <%=request.getParameter("sectorno") %>   /
			선택 : <%=request.getParameter("sectorno") %><br>
			<input class="buttonticket" type="submit" value="예약" />
		</div>
	</div> 
</form>
