<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    

<input type="hidden" name="userid" id="userid" value="${sessionId }" />
<div>
	<h3>나의 문의내역</h3>
	<small>
		<p>
			고객센터를 통해 남기신 1:1 문의내역을 확인하실 수 있습니다.
		</p>
	</small>
	<input type="button" class="changeButt" id ="serviceGo" value="1:1문의하기" />
	<div>
		<select id="qnastate" name="moiverecord">
			<option value="전체">전체</option>
			<option value="답변">답변</option>
			<option value="미답변">미답변</option>
		</select>
		<input type="text" id="qnacontent" />
		<button class="changeButt" id="qnafind">검색</button>
	</div>

	<div class="cimeminfor" id="qnarecord">
		<div id="titleinner">
			<div class="puchaseinner">작성자</div>
			<div class="puchaseinner">제목</div>
			<div class="puchaseinner">작성일</div>
			<div class="puchaseinner">답변일(답변상태)</div>
		</div>

	</div>
</div>
