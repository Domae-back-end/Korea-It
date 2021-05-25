<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div>
	<h3>예매내역</h3>
	<form action="" method="post" enctype="multipart/form-data" name="frm" >
	<input type="hidden" name="userid" id="userid" value="${sessionId }" />
	<div class="purchouter">
		<input type="radio" name="moivepur" id="now" value="now" checked="checked" />예매내역
		<input type="radio" name="moivepur" id="past" value="past"/>지난내역
		<select id="moiverecord" name="moiverecord" disabled="disabled" ></select>
		<input type="button" class="changeButt"  id="moiveButt" value="조회" disabled="disabled"  />
	</div>
	<div class="cimeminfor" id="recordpurchase">
		
	</div>
	</form>
	<h3>예매 취소내역</h3>
	<div class="cimeminfor">
		<div id="titleinner">
			<div class="puchaseinner">영화제목</div>
			<div class="puchaseinner">티켓개수</div>
			<div class="puchaseinner">취소금액</div>
			<div class="puchaseinner">결제일</div>
		</div> 
		<c:forEach items="${memdata.purchase }" var ="pp">
			<c:if test="${pp.salesprice < 0}">
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