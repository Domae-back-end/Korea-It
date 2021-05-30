<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<div>
	<h3>예매내역</h3>
	<input type="hidden" name="userid" id="userid" value="${sessionId }" />
	<div class="purchouter">
		<input type="radio" name="moivepur" id="now" value="now" checked="checked" />예매내역
		<input type="radio" name="moivepur" id="past" value="past"/>지난내역
		<select id="moiverecord" name="moiverecord" disabled="disabled" ></select>
		<input type="button" class="changeButt"  id="moiveButt" value="조회" disabled="disabled"  />
	</div>
	<div class="cimeminfor" id="recordpurchase">
		
		<div id="titleinner">
			<div class="puchaseinner">영화제목</div>
			<div class="puchaseinner">티켓개수</div>
			<div class="puchaseinner">결제금액</div>
			<div class="puchaseinner">결제일</div>
		</div>
		<div class="ppp">
			<c:forEach items="${memdata.purchase }" var ="pp" > 
				<c:if test="${pp.salesprice > 0}">
					<div>
						<div class="puchaseinner">${pp.movietitle }</div>
						<div class="puchaseinner">${pp.ticket_pcount }</div>
						<div class="puchaseinner">${pp.salesprice }</div>
						<div class="puchaseinner">${pp.sales_time }</div>
					</div>
				</c:if>
			</c:forEach>
		</div> 
		<div id="pageRecord">
			<div class="fff">
				<c:if test="${memdata.pdto.startPage > 1}">
		    		<input type="button" class="btnnn pagebtn pagebtn_lr" onclick="pageChange(${memdata.pdto.startPage-1})" value="&lt" />
				</c:if>
		            
				<c:forEach begin="${memdata.pdto.startPage}" end="${memdata.pdto.endPage}" step="1" var="i">
					<c:choose>
						<c:when test="${i == memdata.pdto.page}">
							<input type="text" class="pagebtn_sel" value="${i }" readonly/>
						</c:when>
						<c:otherwise>
							<input type="button" class="btnnn pagebtn" onclick="pageChange(${i})" value="${i}" />
						</c:otherwise>
					</c:choose>
				</c:forEach>
		            
				<c:if test="${memdata.pdto.endPage < memdata.pdto.total}">
		    		<input type="button" class="btnnn pagebtn pagebtn_lr" onclick="pageChange(${memdata.pdto.endPage+1})" value="&gt" />
				</c:if>
			</div>
		</div>
	</div>
	
	<h3>예매 취소내역</h3>
	<div class="cimeminfor" >
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
					<div class="puchaseinner">${pp.sales_time }</div>
				</div>
			</c:if>
		</c:forEach>
	</div>
	
</div>