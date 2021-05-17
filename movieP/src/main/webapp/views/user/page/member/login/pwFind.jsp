<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>find</title>
<style>
*{
	margin: 0;
	padding: 0;
}
.main{
	margin: 0 auto;
	height: 150px;
	width: 500px;
	border-top: 1px solid rgb(192, 192, 192);
	background: #fff;
}
.mainList{
	margin: 0 auto;
	height: 85px;
	width: 500px;
	background: #fff;
}
.outF{
	width: 500px;
	height: 60px;
	text-align: center;
	line-height: 60px;
	float: left;
	border-bottom: 1px solid rgb(192, 192, 192);
}
.outT{
	float: left;
}
.outD{
	width:150px;
	height:60px;
	text-align: center;
	float: left;
	background: rgb(220, 220, 220);
}
input[type=submit]{
	margin-left: 200px;
	height: 50px;
	width: 100px;
	border :none;
	background-color:#000;
	color:#fff;
}
input{
	margin-left: 25px;
	width: 200px;
	height: 25px;
	padding: 3px;
	border : 1px solid rgb(192, 192, 192);
	margin-top: 10px;
}
</style>
<script src="<c:url value="/my_js/jquery-3.6.0.js"/>"></script>
<script>
	
</script>
</head>
<body>
<h1>아이디/비밀번호 찾기</h1>

	<form action="loginReg" method="post" enctype="multipart/form-data" name="frm">
		<div class="main">
			<div class="outF">
				<div class="outD">아이디</div>
				<div class="outT"><input type="text" name="userid" maxlength="20" placeholder="아이디" autocomplete="off" /></div>
			</div>
			<div class="outF">
				<div class="outD">이름</div>
				<div class="outT"><input type="text" name="username" maxlength="20" placeholder="이름" autocomplete="off" /></div>
			</div>
			<div class="outF">
				<div class="outD" >휴대폰 번호</div>
				<div class="outT"><input type="text" name="userpnum" maxlength="20" placeholder="'-'없이 입력" autocomplete="off" /></div>
			</div>
			<div class="outF">
				<div class="outD" >인증번호</div>
				<div class="outT"><input type="text" name="userpnum" maxlength="20" autocomplete="off" /></div>
			</div>
				<input type="submit" disabled="disabled" value="비밀번호 찾기" />
		</div>
	</form>
</body>
</html>