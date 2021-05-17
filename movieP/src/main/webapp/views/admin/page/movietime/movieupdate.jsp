<%@page import="com.model.MovieTimeDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
	.moviedetail{
		width: 1200px;
		height: 100%;
		margin: 0 auto;
	}
	.movieImg{
		float: left;
		width: 200px;
		height: 300px;
	}
	.movieImg > img{
		width: 200px;
		height: 300px;
	}

	.both{
		clear: both;
	}
	.removemenu{
		float: right;
		width: 150px;
		height: 50px;
		background: black;
		line-height: 50px;
		color: white;
		font-weight: bold;
	}
	.removemenu > a{
		color: white;
	}
	.to1{
		width: 200px;
		height: 50px;
		background: aqua;
		float: left;
	}
	.detaillay{
		width: 1000px;
		height: 100%;
		margin: 0 auto;
	}
</style>
<%
	HashMap<String, Object> ar = (HashMap<String, Object>)request.getAttribute("data");
	List<MovieTimeDTO> ac = (List<MovieTimeDTO>)ar.get("time");
%>
<div class="moviedetail">
	<div class="to1">이미지</div>
	<div class="to1">영화 제목</div>
	<div class="to1">줄거리</div>
	<div class="to1">상영시간</div>
	<div class="to1">평점</div>
	<div class="both"></div>
	<div class="movieImg"><img src="/img/${data.info.movieimg }" alt="이미지 파일 없음."></div>
	<div class="movieImg">${data.info.movietitle }</div>
	<div class="movieImg">${data.info.mplot }</div>
	<div class="movieImg">${data.info.mplaytime } 시간</div>
	<div class="movieImg">${data.info.star }</div>
	<div class="both"></div>
	<hr>
	
	<form action="/admin/movietime/updateReg">
		<div class="detaillay">
			<div class="to1">날짜</div>
			<div class="to1">시작 시간</div>
			<div class="to1">종료 시간</div>
			<div class="both"></div>
			<c:forEach var="a" items="<%=ac %>">
					<div class="to1">
					<input type="text" value="<fmt:formatDate value="${a.reg_date }" type="both"
								pattern="yyyy-MM-dd" />" name="reg_date">
				</div>
				<div class="to1">
					<input type="text" name="starttime" value="<fmt:formatDate value="${a.starttime }" type="both"
								pattern="hh:mm:ss" />">
								</div>
				<div class="to1">
		
					<input type="text" name="endtime" value="<fmt:formatDate value="${a.endtime }" type="both"
								pattern="hh:mm:ss" />"></div>
				<div class="both"></div>
			</c:forEach>
		</div>
		<input type="submit" value="수정하기" class="removemenu">
				
	</form>
	</div>
<div class="both"></div>
<hr>








