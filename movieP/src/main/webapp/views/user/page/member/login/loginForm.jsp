<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style>
*{
	margin: 0;
	padding: 0;
}
h1{
	font-weight:lighter;
	margin-left: 230px;
}
form>div{
	height: 500px;
	width: 900px;
	border-top: 1px solid rgb(192, 192, 192);
	background: #fff;
	margin: 0 auto;
}
form>div:nth-of-type(2){
	height: 80px;
	border-color: #fff;
}
div>div {
	height: 75px;
	border-bottom: 1px solid rgb(192, 192, 192);
} 
div>div:nth-of-type(1), div>div:nth-of-type(4){	
	height: 40px;
} 
div>div:nth-of-type(2), div>div:nth-of-type(3){
	height: 85px;
} 
div>div>.firstT {
	
	width:150px;
	height: 75px;
	text-align: center;
	line-height: 75px;
	float: left;
	background: rgb(220, 220, 220);
}
div>div:nth-of-type(2)>div:first-of-type, div>div:nth-of-type(3)>div:first-of-type {
	width:150px;
	height: 85px;
	text-align: center;
	line-height: 85px;
	float: left;
	background: rgb(220, 220, 220);
}
div>div:nth-of-type(1)>div:first-of-type, div>div:nth-of-type(4)>div:first-of-type{
	
	width:150px;
	height:40px;
	text-align: center;
	line-height: 40px;
	float: left;
	background: rgb(220, 220, 220);
}
div>div>div:nth-of-type(2){
	margin-left: 250px;
	border-bottom: 0;
}
div:nth-of-type(2)>div:first-of-type{
	width:150px;
	height: 80px;
	text-align: center;
	line-height: 40px;
	float: left;
}
form>div:nth-of-type(2)>div:nth-of-type(2){
	margin-top: 15px;
	margin-left: 250px;
	border-bottom: 0;
}
form>div:nth-of-type(2)>div:nth-of-type(3){
	border-bottom: 0;
}
input[value=중복확인] {
	width:90px ;
	height: 30px;
	border :none;
}
input[value=취소] {
	margin-left: 370px;
	height: 50px;
	width: 100px;
	border :none;
}
input[type=submit]{
	height: 50px;
	width: 100px;
	border :none;
	background-color:#000;
	color:#fff;
}
input{
	padding: 3px;
	border : 1px solid rgb(192, 192, 192);
	margin-top: 10px;
}
input[name=tel]{
	width: 70px; 
	height: 25px;
}
span{
	color:orange;
}
select{
	border-color: rgb(192, 192, 192);;
	width: 70px;
	height: 30px;
	margin-top: 10px;
}
p{
	margin-top: 7px;
}
</style>
<script src="<c:url value="/my_js/jquery-3.6.0.js"/>"></script>
<script>
function mainGo() {
	
}
</script>
</head>
<body>
<form action ="joinReg" method="post" enctype="multipart/form-data" name="frm">
<h1>기본정보</h1>
	<div>
		<div>
			<div>아이디</div>
			<div>
				<input type="text" name="id" maxlength="8" placeholder="아이디를 입력해주세요"/>
			</div>
		</div>
		<div>
			<div>비밀번호</div>
			<div>
				<input type="password" name="pw" maxlength="16" placeholder="비밀번호를 입력해주세요"/>
			</div>
		</div>
	</div>
<div>
	<input type="submit" value="로그인"/>
</div>
</form>

</body>
</html>