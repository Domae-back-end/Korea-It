<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<div id="login_div">
<form action ="" method="post" enctype="multipart/form-data" name="frm">
<h1>로그인</h1>
	<div class="firstD">
		<input type="text" id="userid" name="userid" maxlength="20" placeholder="아이디" autocomplete="off" />
		<input type="password" id="userpw" name="userpw" maxlength="20" placeholder="비밀번호" autocomplete="off" />
		
		<input type="button" id="check" value="로그인"/>
	</div>
	<div class="secondD">
		<a href="idFind">ID 찾기</a>
		<a href="/member/join/joinForm">회원가입</a>
		<a href="pwFind">PW 찾기</a>
	</div>
	<div>
		<a href="/member/naverLogin"><img src="/resources/img/ico-naver.png" alt="네이버 로그인" /></a>
	</div>
</form>
</div>