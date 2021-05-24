<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div>
<div class = "cimemaouter">
	<div>
		<div>${sessionId }${memdata.dto.username }님의 마이페이지 입니다</div>
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
		<c:forEach items="${memdata.purchase }" var ="pp" > 
			<c:if test="${pp.salesprice > 0}">
				<div>
					<div class="puchaseinner">${pp.movietitle }</div>
					<div class="puchaseinner">${pp.ticket_pcount }</div>
					<div class="puchaseinner">${pp.salesprice }</div>
					<div class="puchaseinner"><fmt:formatDate value="${pp.sales_time }" pattern="yyyy년 MM월 dd일"/></div>
				</div>
			</c:if>
		</c:forEach>
	</div>
</div>

<div>
	<div>
		<h4>나의 문의내역</h4>
		<div class = "seemore"><a href="/member/mypage/myfna">더보기 ></a></div>
	</div>

	<div class="cimeminfor">
		<c:forEach items="${memdata.fna }" var ="pp"> 
			<div>
				<div class="puchaseinner">${pp.persid }</div>
				<div class="puchaseinner">${pp.perstitle }</div>
				<div class="puchaseinner"><fmt:formatDate value="${pp.persqtime }" pattern="yyyy년 MM월 dd일"/></div>
				<div class="puchaseinner"><fmt:formatDate value="${pp.persatime }" pattern="yyyy년 MM월 dd일"/>(${pp.persstate })</div>
			</div>
		</c:forEach>
	</div>
</div>


</div>