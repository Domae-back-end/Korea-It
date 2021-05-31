<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="header">
	<div class="header_top">
		<ul>
			<c:if test="${sessionId == null or sessionId == ''}">
				<li><a href="/member/join/joinForm">회원가입</a></li>
			</c:if>
			<c:choose>
			<c:when test="${sessionId == null or sessionId == '' }">
				<li><a href="/member/login/loginForm">로그인</a></li>
			</c:when>
			<c:otherwise>
				<li><a href="/logout">로그아웃</a></li>
				<li><a href="/member/mypage/mypageMain">마이페이지</a></li>
			</c:otherwise>
			</c:choose>
		</ul>
	</div>

	<div class="header_gnb">
		<ul>
			<li><a href="/user/movie/moviemain?cg=boxoffice">영화</a></li>
			<li><a href="/user/movietime/list">예매</a></li>
			<li><a href="/user/mainpage/main">홈</a></li>
			<li><a href="/user/serviceC/serviceHome">고객센터</a></li>
			<li><a href="/user/serviceC/serviceNotice">공지사항</a></li>
		</ul>
	</div>
</div>