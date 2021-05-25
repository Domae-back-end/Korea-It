<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<h3>회원정보</h3>
<form action="" method="post" enctype="multipart/form-data" name="frm" >
	<input type="hidden" id="userid" value="${sessionId } " />
	<div class = "inforouter">
		<p>회원님의 개인정보 보호를 위해 비밀번호를 입력하셔야 합니다.<br>
		<small>영화관 로그인 시 사용하시는 비밀번호를 입력해 주세요.</small></p>
		<input type="password" id="userpwchk" name="userpwchk" maxlength="16"  />
	</div>
	
	<div>
		<input type="button" id="mainGo" value="취소"/>
		<input type="button" id="check" value="확인"/>
	</div>
</form>