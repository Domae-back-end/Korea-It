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
		height: 100%;
	}
	.movieImg > img{
		width: 200px;
		height: 300px;
	}

	.both{
		clear: both;
	}
	.removemenu{
		float: left;
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
		width: 1200px;
		height: 100%;
		margin: 0 auto;
	}
	.updatemenu{
		float: right;
		width: 150px;
		height: 50px;
		background: black;
		line-height: 50px;
		color: white;
		font-weight: bold;
	}
	.updatemenu > a{
		color: white;
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
	<div class="movieImg">${data.info.mplaytime } 분</div>
	<div class="movieImg">${data.info.star }</div>
	<div class="both"></div>
	<hr>
	<div class="updatemenu"><a href="update?movietitle=<%=request.getParameter("movietitle")%>">수정하기</a></div>
	<div class="detaillay">
		<div class="to1">관</div>
		<div class="to1">날짜</div>
		<div class="to1">시작 시간</div>
		<div class="to1">종료 시간</div>
		<div class="both"></div>
		<c:forEach var="a" items="<%=ac %>" varStatus="i">
				<div class="to1">
				${a.sectorno }
				</div>
				<div class="to1">
			<fmt:formatDate value="${a.reg_date }" type="both"
							pattern="yyyy-MM-dd" /></div>
			<div class="to1">
			<fmt:formatDate value="${a.starttime }" type="both"
							pattern="hh:mm:ss" />
							</div>
			<div class="to1">
			<fmt:formatDate value="${a.endtime }" type="both"
							pattern="hh:mm:ss" /></div>
			<c:if test="${i.index == 0  }">			
			</c:if>	
			<div class="removemenu"><a href="deleteReg?movietitle=${a.time_index}&m_index=${a.time_index}">삭제하기</a></div>
			<div class="both"></div>
		</c:forEach>
	</div>
</div>
<div class="both"></div>
<hr>








