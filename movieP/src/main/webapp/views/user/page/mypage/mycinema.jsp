<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div>
<div class = "cimemaouter">
	<div>
		<div>${memdata.dto.username }님의 마이페이지 입니다</div>
		<a href="/member/mypage/myinfor">개인정보수정 ></a>
	</div>
</div>

<div>
	<div>
		<h4>나의 무비스토리</h4>
	</div>

	<div class="cimemastory">
		<div class="myrecord">
			<div class="recordinner">끝</div>
			<div class="recordinner">본 영화</div>
		</div>
		<div class="myrecord">
			<div class="recordinner">끝</div>
			<div class="recordinner">관람평</div>
		</div>
		<div class="myrecord">
			<div class="recordinner">끝</div>
			<div class="recordinner">좋아요</div>
		</div>		
	</div>
</div>

<div>
	<div>
		<h4>나의 예매내역</h4>
		<div class = "seemore"><a href="/member/mypage/mypurchase">더보기 ></a></div>
	</div>

	<div class="cimeminfor">
		<c:forEach begin="1" step="1" end="3" items="${memdata.purchase }"> 
			<div>
			
			</div>
		</c:forEach>
	</div>
</div>

<div>
	<div>
		<h4>나의 문의내역</h4>
		<div class = "seemore"><a href="/member/mypage/myfna">더보기 ></a></div>
	</div>

	<div class="cimeminfor">
		
	</div>
</div>


</div>