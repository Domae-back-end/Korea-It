<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>        
<form action="" method="post" enctype="multipart/form-data" name="frm" >
<h2>개인정보 수정</h2>
	<div class = "idouter">
		<div class = "nameouter">아이디</div>
		<div>
			<div class = "dataouter">${sessionId }</div>
			<input type="button" class="changeButt" value="회원탈퇴"/>
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
				<div class = "dataouter">${memdata.dto.userbirth }</div>
			</div>
		</div>
		
		
		<div class = "mideouter">
			<div class = "nameouter">휴대폰</div>
			<div>
				<div class = "dataouter" id="pnumouter">${memdata.dto.userpnum }</div>
				<input type="button" class="changeButt" value="휴대폰번호 변경"/>
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
		<input type="button" id="modifyGo" value="등록"/>
	</div>
</form>