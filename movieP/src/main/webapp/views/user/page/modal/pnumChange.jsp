<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>        
<script src="<c:url value="/resources/js/modal/pnumChange.js" />" ></script>

<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	<h2>핸드폰번호 변경</h2>
</div>

<div class="modal-body bodywidth">
	<h4>핸드폰번호 입력</h4>
	<div class="main">
		<div class="outF">
			<div class="outD" >휴대폰 번호</div>
			<input type="text"  class="outT" id="newpnum" name="newpnum" maxlength="20" placeholder="'-'제외하고 입력" autocomplete="off" />
			<input type="button" class="chButt" id="checknumButt"  value="인증번호 발송"/>
		</div>
		<div class="outF">
			<div class="outD" >인증번호</div>
			<input type="text"  class="outT" id="userpnumchk" name="userpnumchk" disabled="disabled" maxlength="20" autocomplete="off" />
			<input type="button" class="chButt" id="checknewnum" disabled="disabled" value="확인"/>
		</div>
	</div>
	<button class="close" id="close" data-dismiss="modal">닫기</button>
</div>
