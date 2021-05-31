<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>find</title>

<script src="<c:url value="/resources/my_js/jquery-3.6.0.js"/>"></script>
<link rel="stylesheet" href='<c:url value="/resources/css/${PPPData.cate}/${PPPData.service}.css" />'>
<script src="<c:url value="/resources/js/${PPPData.cate}/${PPPData.service}.js" />" ></script>

</head>
<body>
<div id="idfind_main">
	<h1>아이디/비밀번호 찾기</h1>
	<form action="" method="post" enctype="multipart/form-data" name="frm">
		<div class="main">
			<div class="outF">
				<div class="outD">이름</div>
				<div class="outT"><input type="text" id="username" name="username" maxlength="20" placeholder="이름" autocomplete="off" /></div>
			</div>
			<div class="outF">
				<div class="outD" >생년월일</div>
				<div class="outT"><input type="text" id="userbirth" name="userbirth" maxlength="20" placeholder="1966-11-22형식" autocomplete="off" /></div>
			</div>
			<div class="outF">
				<div class="outD" >휴대폰 번호</div>
			<div class="outT"><input type="text" id="userpnum" name="userpnum" maxlength="20" placeholder="'-'포함해서 입력" autocomplete="off" /></div>
			</div>
				<input type="button" id="check" value="아이디 찾기"/>
		</div>
	</form>
</div>
</body>
</html>