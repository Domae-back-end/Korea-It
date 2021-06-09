<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="pwfind_main">
	<h2>비밀번호 찾기</h2>
	<form action="" method="post" name="frm">
	<input type="hidden" id="userpw" name="userpw" />
	<input type="hidden" id="paramID" name="userid" />
		<div class="main">
			<div class="outF">
				<div class="outD">아이디</div>
				<div class="outT"><input type="text" id="userid" name="userid" maxlength="20" placeholder="아이디" autocomplete="off" /></div>
			</div>
			<div class="outF">
				<div class="outD">이름</div>
				<div class="outT"><input type="text" id="username" name="username" maxlength="20" placeholder="이름" autocomplete="off" /></div>
			</div>
			<div class="outF">
				<div class="outD" >휴대폰 번호</div>
				<div class="outT"><input type="text" id="userpnum" name="userpnum" maxlength="20" placeholder="'-'제외하고 입력" autocomplete="off" /></div>
				<input type="button" class="chButt" id="pnumcheck" disabled="disabled" value="인증번호 발송"/>
			</div>
			<div class="outF">
				<div class="outD" >인증번호</div>
				<div class="outT"><input type="text" id="userpnumchk" name="userpnumchk" disabled="disabled" maxlength="20" autocomplete="off" /></div>
				<input type="button" class="chButt" id="checkBtn" disabled="disabled" value="확인"/>
			</div>
				<input type="button" id="check" disabled="disabled" value="비밀번호 찾기" />
		</div>
	</form>
</div>