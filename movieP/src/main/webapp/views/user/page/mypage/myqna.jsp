<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<form action="" method="post" enctype="multipart/form-data" name="frm">
<div>
	<h3>나의 문의내역</h3>
	<small>
		<p>
			고객센터를 통해 남기신 1:1 문의내역을 확인하실 수 있습니다.
		</p>
	</small>
	<input type="button" class="changeButt" id ="serviceGo" value="1:1문의하기" />
	<div>
		<select id="qnarecord" name="moiverecord">
			<option value="전체">전체</option>
			<option value="답변">답변</option>
			<option value="미답변">미답변</option>
		</select>
		<input type="text" />
		<button class="changeButt" id="fnafind">검색</button>
	</div>

	<div class="cimeminfor">
		<div id="titleinner">
			<div class="puchaseinner">작성자</div>
			<div class="puchaseinner">제목</div>
			<div class="puchaseinner">작성일</div>
			<div class="puchaseinner">답변일(답변상태)</div>
		</div>
		<c:forEach items="${memdata.qna }" var ="pp"> 
			<div>
				<div class="puchaseinner">${pp.persid }</div>
				<div class="puchaseinner">${pp.perstitle }</div>
				<div class="puchaseinner"><fmt:formatDate value="${pp.persqtime }" pattern="yyyy년 MM월 dd일"/></div>
				<div class="puchaseinner"><fmt:formatDate value="${pp.persatime }" pattern="yyyy년 MM월 dd일"/>(${pp.persstate })</div>
			</div>
		</c:forEach>
	</div>
</div>
</form>