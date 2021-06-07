<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form action ="" method="post" name="pp">
	<input type="hidden" name="qnastate" id="qnastate" value="${param.qnastate }" />
	<input type="hidden" name="qnacontent" id="qnacontent" value="${param.qnacontent }" />
	<input type="hidden" name="page" id="page" value ="${param.page }" />
</form>
	<input type="hidden" name="detail" id="detail" value="${param.detail}"/>

<div id="content">
	<div class = "fff" >
	
	</div>
</div>
<div class="hdetail_bot">
	<div class="back_list">
		<c:if test="${param.qnastate!=null }"><a class="backQ" id="backQna">목록</a></c:if>
		<c:if test="${param.qnastate ==null }"><a href="/member/mypage/mycinema" class="backQ">뒤로</a></c:if>
	</div>
</div>