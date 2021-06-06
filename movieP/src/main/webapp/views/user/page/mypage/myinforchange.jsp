<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>        
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="<c:url value="/resources/js/modal/delete.js" />" ></script>    

<form action="" method="post" enctype="multipart/form-data" name="frm" >
<input type="hidden" id="userid" value="${sessionId }"/>
<input type="hidden" id="userpw" value="${memdata.dto.userpw }"/>
<input type="hidden" id="userpnum" value="${memdata.dto.userpnumM }"/>

 <div class="modal fade" data-backdrop="static" data-keyboard="false" id='inforDelete1'>
      <div class="modal-dialog">
        <div class="modal-content"></div>
 </div>
 </div>
<h2>개인정보 수정</h2>
	<div class = "idouter">
		<div class = "nameouter">아이디</div>
		<div>
			<div class = "dataouter">${sessionId }(가입일 : ${memdata.dto.joindayM })</div>
	
			<input type="button" class="changeButt" id="inforDelete" value="회원탈퇴" data-target="#inforDelete1"/>
	
		</div>
	</div>
	
	<h3>기본정보</h3>
	<div class = "changeouter">
		<div class = "mideouter">
			<div class = "nameouter">이름</div>
			<div>
				<div class = "dataouter">${memdata.dto.username }</div>
			</div>
		</div>
		
		<div class = "mideouter">
			<div class = "nameouter">생년월일</div>
			<div>
				<div class = "dataouter">${memdata.dto.userbirthM }</div>
			</div>
		</div>
		
		
		<div class = "mideouter" id ="pumMidouter">
			<div class = "nameouter" id ="pumnameouter" >휴대폰</div>
			<div>
				<div class = "dataouter" id="pnumouter">${memdata.dto.userpnumM }</div>
				<div class="emailouter">
					<input type="button" class="changeButt" id="pumnchangGo" value="휴대폰번호 변경"/>
				</div>
				<div class="emailouter">
					<input type="hidden" id="newpnum" maxlength="20" autocomplete="off" placeholder="-포함해서 입력"/>
					<input type="hidden" class="changeButt" id="checknumButt" value="인증번호 전송"/>
					<input type="hidden" id="checknum" maxlength="4" autocomplete="off" />
					<input type="hidden" class="changeButt" id="numfinish" value="확인"/>
				</div>
			</div>
		</div>
		
		
		<div class = "mideouter">
			<div class = "nameouter">이메일</div>
			<div class="emailouter"><input type="text" id="useremail" value="${memdata.dto.useremail }" /></div>
		</div>
			
		<div class = "mideouter">
			<div class = "nameouter">비밀번호</div>	
			<div class="emailouter">
				<c:choose>
					<c:when test="${memdata.dto.kind == '일반' }">
						<input type="button" class="changeButt" id="changepw" value="비밀번호 변경" />
					</c:when>
					<c:when test="${memdata.dto.kind == '네이버' }">
						<input type="button" class="changeButt" id="changepw" disabled="disabled" value="비밀번호 변경" />
						<small>네이버로그인 비밀번호 변경 불가.</small>
					</c:when>
				</c:choose>
			
			</div>
		</div>
	</div>
	
	<div>
		<input type="button" id="mainGo" value="취소"/>
		<input type="button" id="informodifyGo" value="등록"/>
	</div>
</form>