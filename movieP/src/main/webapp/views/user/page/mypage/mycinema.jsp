<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div>
	<div class = "cimemaouter">
		<div>
			<div>${memdata.dto.username }님의 마이페이지 입니다</div>
			<c:choose>
				<c:when test="${memdata.dto.kind == '일반' }">
					<a href="/member/mypage/myinfor">개인정보수정 ></a>
				</c:when>
				<c:when test="${memdata.dto.kind == '네이버' }">
					<a href="/member/mypage/myinforchange">개인정보수정 ></a>
				</c:when>
			</c:choose>
			
		</div>
	</div>

	<div>
		<div>
			<h4>나의 무비스토리</h4>
		</div>
	
		<div class="cimemastory">
			<a href="/member/mypage/mymoviestroy?kind=seemovie">
				<div class="myrecord">
					<div class="recordinner">${memdata.cnt.sc }</div>
					<div class="recordinner">본 영화</div>
				</div>
			</a>
			<a href="/member/mypage/mymoviestroy?kind=writemovie">
				<div class="myrecord">
					<div class="recordinner">${memdata.cnt.rc }</div>
					<div class="recordinner">관람평</div>
				</div>
			</a>
			<a href="/member/mypage/mymoviestroy?kind=likemovie">
				<div class="myrecord">
					<div class="recordinner">${memdata.cnt.uc }</div>
					<div class="recordinner">좋아요</div>
				</div>		
			</a>
		</div>
	</div>

<div>
	<div>
		<h4>나의 예매내역</h4>
		<div class = "seemore"><a href="/member/mypage/mypurchase">더보기 ></a></div>
	</div>

	<div class="cimeminfor">
		<div id="titleinner">
			<div class="puchaseinner">영화제목</div>
			<div class="puchaseinner">티켓개수</div>
			<div class="puchaseinner">결제금액</div>
			<div class="puchaseinner">결제일</div>
		</div>
		<c:forEach items="${memdata.purchase }" var ="pp" end="1" varStatus="no"> 
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
		<div class = "seemore"><a href="/member/mypage/myqna">더보기 ></a></div>
	</div>

	<div class="cimeminfor">
		<div id="titleinner">
			<div class="puchaseinner">작성자</div>
			<div class="puchaseinner">제목</div>
			<div class="puchaseinner">작성일</div>
			<div class="puchaseinner">답변일(답변상태)</div>
		</div>
		<c:forEach items="${memdata.qna }" var ="pp" end="1" > 
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