<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2>비밀번호 변경</h2>
<form action="" method="post" enctype="multipart/form-data" name="frm" >
	
	<input type="hidden" id="userid" value="${sessionId } " />
	<p><small>현재 비밀번호를 입력한 후 새로 사용할 비밀번호를 입력하세요.</small></p>
	
	<div class = "changeouter" id="changeouter">
		<div class = "mideouter">
			<div class = "pwnameouter">현재 비밀번호</div>
			<div class="emailouter"><input type="password" id="nowpw" class="pwinner" maxlength="16" /></div>
		</div>
		<div class = "mideouter" id="mideouter">
			<div class = "pwnameouter" id="pwnameouter" >새 비밀번호</div>
			<div class="emailouter"><input type="password" id="newpw" class="pwinner" maxlength="16"/></div>
			<div class="check_msg" id="pw_check"></div>
		</div>
		<div class = "mideouter" id="mideouter">
			<div class = "pwnameouter" id="pwnameouter" >새 비밀번호 재입력</div>
			<div class="emailouter"><input type="password" id="newpwch" readonly="readonly" class="pwinner" maxlength="16"/></div>
			<div class="check_msg" id="pw_check2"></div>
		</div>
	</div>
	
	<div>
		<input type="button" id="mainGo" value="취소"/>
		<input type="button" id="pwmodifyGo" value="수정"/>
	</div>
</form>