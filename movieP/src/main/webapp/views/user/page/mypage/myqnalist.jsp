<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div>

	<small>
		<p class="pMargin">
			고객센터를 통해 남기신 1:1 문의내역을 확인하실 수 있습니다.
		</p>
	</small>
	
	<form action ="" method="post" name="qq">
		<input type="hidden" name="qnastate" id="qnastateGo" value="${param.qnastate }" />
		<input type="hidden" name="qnacontent" id="qnacontentGo" value="${param.qnacontent }" />
		<input type="hidden" name="detail" id="detail" />
		<input type="hidden" name="page" id="page" value="${param.page }" />
	</form>
		
	<form action ="" method="post" name="frm">
	<input type="button" class="changeButt" id ="serviceGo" value="1:1문의하기" />
	</form>
	
	<div class="qnaMargin">
		<select id="qnastate" name="moiverecord">
			<option value="전체">전체</option>
			<option value="답변완료">답변완료</option>
			<option value="미답변">미답변</option>
		</select>
		<input type="text" id="qnacontent" />
		<button class="changeButt" id="qnafind">검색</button>
	</div>

	<div class="cimeminfor" id="qnaRecord">
		<div id="titleinner">
			<div class="puchaseinner">작성자</div>
			<div class="puchaseinner">제목</div>
			<div class="puchaseinner">작성일</div>
			<div class="puchaseinner">답변일(답변상태)</div>
		</div>
		<div id="qqq">
		<div class="fff">
			<c:forEach items="${memdata.qna }" var ="pp" > 
				<div class="puchaseinner">${pp.persid }</div>
				<a class="qnaDetailGo" value="${pp.persindex }" dd="${pp.persindex }" ><div class="puchaseinner" id="titleOver">${pp.perstitle }</div></a>
				<div class="puchaseinner">${pp.persqtime }</div>
				<div class="puchaseinner">${pp.persatime }(${pp.persstate })</div>
			</c:forEach>
		</div> 
		</div>
		
		<div id="pageRecord">
			<div class="fff">
				<c:if test="${memdata.pdto.startPage > 1}">
		    		<input type="button" class="btnnn pagebtn pagebtn_lr" onclick="qnapageChange(${memdata.pdto.startPage-1})" value="&lt" />
				</c:if>
		            
				<c:forEach begin="${memdata.pdto.startPage}" end="${memdata.pdto.endPage}" step="1" var="i">
					<c:choose>
						<c:when test="${i == memdata.pdto.page}">
							<input type="text" class="pagebtn_sel" value="${i }" pp="${i }" readonly/>
						</c:when>
						<c:otherwise>
							<input type="button" class="btnnn pagebtn" onclick="qnapageChange(${i})" value="${i}" />
						</c:otherwise>
					</c:choose>
				</c:forEach>
		            
				<c:if test="${memdata.pdto.endPage < memdata.pdto.total}">
		    		<input type="button" class="btnnn pagebtn pagebtn_lr" onclick="qnapageChange(${memdata.pdto.endPage+1})" value="&gt" />
				</c:if>
			</div>
		</div>
	</div>
	
</div>
