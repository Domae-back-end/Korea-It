<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src="<c:url value="/resources/js/modal/delete.js" />" ></script>
   
<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	<h2>회원 탈퇴</h2>
</div>

<div class="modal-body">
	<input type="password" placeholder="비밀번호" maxlength="16" id="chkPw">
	<button type="button" id="checkBtn" class="btn btn-secondary">확인</button>
	<button class="close" data-dismiss="modal">닫기</button>
</div>

