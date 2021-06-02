<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
 
<div id="mypage_main">

	<nav>
		<ul>
			<li><a href="/member/mypage/mycinema">나의 영화관</a></li>
			<li><a href="/member/mypage/mypurchase">예매내역</a></li>
			<li><a href="/member/mypage/mymoviestroy?kind=seemovie">나의 무비스토리</a></li>
			<li><a href="/member/mypage/myqna">문의내역</a></li>
			
			<c:choose>
				<c:when test="${memdata.dto.kind == '일반' }">
					<li><a href="/member/mypage/myinfor">내 정보수정</a></li>
				</c:when>
				<c:when test="${memdata.dto.kind == '네이버' }">
					<li><a href="/member/mypage/myinforchange">내 정보수정</a></li>
				</c:when>
			</c:choose>
		</ul>
	</nav>
	
	<div class="outer">
		<jsp:include page="${subMenu.url}.jsp" /> 
	</div>	
	
</div>    
