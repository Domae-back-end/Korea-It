<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h2>비밀번호 변경</h2>
<form action="" method="post" enctype="multipart/form-data" name="frm" >
	
	<input type="hidden" id="userid" value="${sessionId } " />
	<input type="hidden" id="userpw" name="userpw" value="${param.userpw }" />
	<input type="hidden" id="paramID" name="userid" value="${param.userid }" />

	<p><small>현재 비밀번호를 입력한 후 새로 사용할 비밀번호를 입력하세요.</small></p>
	
	<div class = "changeouter" id="changeouter">
		<div class = "mideouter">
			<div class = "pwnameouter">현재 비밀번호</div>
			<c:if test="${param.userpw!=null }">
				<div class="emailouter"><input type="password" id="nowpw" class="pwinner" maxlength="16" value="${param.userpw }"  disabled="disabled"/></div>
			</c:if>
			<c:if test="${param.userpw ==null }">
			<div class="emailouter"><input type="password" id="nowpw" class="pwinner" maxlength="16" /></div>
			</c:if>
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