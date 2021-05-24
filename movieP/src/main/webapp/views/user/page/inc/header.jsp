<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<a href="/user/mainpage/main">홈</a>
<a href="/user/movie/moviemain?cg=boxoffice">영화</a>
<a href="/user/movietime/list">예매</a>
<a href="/user/serviceC/serviceHome">고객센터</a>
<c:if test="${sessionId == null or sessionId == ''}"><a href="/member/join/joinForm">회원가입</a></c:if>
<c:choose>
	<c:when test="${sessionId == null or sessionId == '' }">
		<a href="/member/login/loginForm">로그인</a>
	</c:when>
	
	<c:otherwise>
		<a href="/logout">로그아웃</a>
	</c:otherwise>
</c:choose>
<a href="/member/mypage/mypageMain">마이페이지</a>

