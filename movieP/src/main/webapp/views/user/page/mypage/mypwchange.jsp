<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h2>비밀번호 변경</h2>
<form action="" method="post" enctype="multipart/form-data" name="frm" >
	<input type="hidden" id="userid" value="${sessionId } " />
	<input type="hidden" id="userpw" value="${memdate.dto.userpw } " />
	<p><small>현재 비밀번호를 입력한 후 새로 사용할 비밀번호를 입력하세요.</small></p>
	<div class = "changeouter" id="changeouter">
		<div class = "mideouter">
			<div class = "pwnameouter">현재 비밀번호</div>
			<div class="emailouter"><input type="text" id="nowpw" class="pwinner" maxlength="16" /></div>
		</div>
		<div class = "mideouter">
			<div class = "pwnameouter">새 비밀번호</div>
			<div class="emailouter"><input type="text" id="newpw" class="pwinner" maxlength="16"/></div>
			<p><small>※ 영문, 숫자, 특수문자 중 2가지 이상 조합하여 8~16자리 사이로 입력 해 주세요.</small></p>
		</div>
		<div class = "mideouter">
			<div class = "pwnameouter">새 비밀번호 재입력</div>
			<div class="emailouter"><input type="text" id="newpwch" class="pwinner" maxlength="16"/></div>
			<p><small>※ 비밀번호 확인을 위해 한 번 더 입력해 주시기 바랍니다.</small><p>
		</div>
	</div>
	
	<div>
		<input type="button" id="mainGo" value="취소"/>
		<input type="button" id="pwmodifyGo" value="수정"/>
	</div>
</form>