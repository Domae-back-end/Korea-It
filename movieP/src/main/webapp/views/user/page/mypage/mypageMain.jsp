<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
 
<c:choose>
	
	<c:when test="${sessionId!=null }">
		<nav>
			<ul>
				<a href="/member/mypage/mycinema"><li>나의 영화관</li></a>
				<a href="/member/mypage/mypurchase"><li>예매내역</li></a>
				<a href="/member/mypage/myfna"><li>문의내역</li></a>
				<a href="/member/mypage/myinfor"><li>내 정보수정</li></a>
			</ul>
			</nav>
		<div class="outer">
			 <jsp:include page="${subMenu.url}.jsp" /> 
		</div>	
	</c:when>
	
</c:choose>    
