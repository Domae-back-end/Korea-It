<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<style>
*{
	margin: 0;
	padding: 0;
}
div{	
	margin: 0 auto;
	width: 320px;
	height: 200px;
}
.secondD{
	height: 40px;
}
a{
	margin-left:15px;
	text-decoration:none;
	color: #000;
	font-size: 15px;
}
input{
	width: 300px;
	height: 40px;
	padding: 3px;
	border : 1px solid rgb(192, 192, 192);
	margin: 5px;
	font-size: 18px;
}
input[type=submit]{
	margin-top: 20px;
	width: 310px;
	border :none;
	background-color:#000;
	color:#fff;
}
</style>
<script src="<c:url value="/my_js/jquery-3.6.0.js"/>"></script>
<script>
</script>
</head>
<body>
<form action ="loginReg" method="post" enctype="multipart/form-data" name="frm">
<h1>로그인</h1>
	<div>
		<input type="text" name="userid" maxlength="20" placeholder="아이디" autocomplete="off" />
		<input type="password" name="userpw" maxlength="20" placeholder="비밀번호" autocomplete="off" />
		
		<input type="submit" value="로그인"/>
	</div>
	<div class="secondD">
		<a href="idFind">ID/PW 찾기</a>
		<a href="../join/joinForm">회원가입</a>
		<a href="noMLogin">비회원 예매확인</a>
	</div>
	<div>
		<a href=""><img src="/img/ico-naver.png" alt="네이버 로그인" /></a>
	</div>
</form>
</body>
</html>