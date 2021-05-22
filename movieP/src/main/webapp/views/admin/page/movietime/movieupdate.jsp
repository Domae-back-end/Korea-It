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
		<input type="hidden" value="<%=request.getParameter("movietitle") %>" name="movietitle"/>
		<div class="detaillay">
			<div class="to1">순서</div>
			<div class="to1">관</div>
			<div class="to1">날짜</div>
			<div class="to1">시작 시간</div>
			<div class="both"></div>
			<c:forEach var="a" items="<%=ac %>" varStatus="i">
					<input type="hidden" value="${a.m_index }" name="m_indexlist">
					<div class="to1">${i.index+1 }</div>
					<div class="to1">
						<select name="sectornolist">
							<c:choose>
								<c:when test="${a.sectorno eq '작은관' }">
									<option value="작은관" selected="selected">작은관</option>
								</c:when>
								<c:otherwise>
									<option value="작은관">작은관</option>
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${a.sectorno eq '기존관' }">
									<option value="기존관" selected="selected">기존관</option>
								</c:when>
								<c:otherwise>
									<option value="기존관">기존관</option>
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${a.sectorno eq '3D' }">
									<option value="3D" selected="selected">3D</option>
								</c:when>
								<c:otherwise>
									<option value="3D">3D</option>
								</c:otherwise>
							</c:choose>
						</select>
					</div>
					<div class="to1">
					<input type="date" value="<fmt:formatDate value="${a.reg_date }" type="both"
								pattern="yyyy-MM-dd" />" name="reg_datelist" />
				</div>
				<div class="to1">
					<input type="text" name="starttime1" value="<fmt:formatDate value="${a.starttime }" type="both"
								pattern="hh:mm:ss" />" />
								</div>
				<div class="both"></div>
			</c:forEach>
		</div>
		<input type="submit" value="수정하기" class="removemenu">
				
	</form>
	</div>
<div class="both"></div>
<hr>








