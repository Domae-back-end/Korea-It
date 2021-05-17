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
.boxF{	
	height: 40px;
} 
.boxS{
	height: 85px;
}
.firstT {
	width:150px;
	height: 75px;
	text-align: center;
	line-height: 75px;
	float: left;
	background: rgb(220, 220, 220);
}
.boxS >div:first-of-type {
	width:150px;
	height: 85px;
	text-align: center;
	line-height: 85px;
	float: left;
	background: rgb(220, 220, 220);
}
.boxF>div:first-of-type {
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
	frm.action = "/user/main"
	frm.submit()
}
function checkGo() {
	
	
}
</script>
</head>
<body>
<h1>기본정보</h1>
<form action ="joinReg" method="post" enctype="multipart/form-data" name="frm">
	<div>
		<div class = "boxF">
			<div><span>√</span>이름</div>
			<div><input type="text" name="username" maxlength="10"  placeholder="이름을 입력해주세요"/></div>
		</div>
		<div>
			<div class = "firstT"><span>√</span>아이디</div>
			<div>
				<input type="text" name="userid" maxlength="8" placeholder="아이디를 입력해주세요"/>
				<input type="button" onclick="checkGo()" value="중복확인"/>
				<small><p>영문자, 숫자 조합하여 8~12자리</p></small>
			</div>
		</div>
		<div class="boxS">
			<div><span>√</span>비밀번호</div>
			<div>
				<input type="password" name="userpw" maxlength="16" placeholder="비밀번호를 입력해주세요"/>
				<small>
					<p>영문자, 숫자,특수문자 조합하여 8~12자리, 아이디와 4자리이상 동일,반복 문자숫자 불가<br>
							사용 가능 특수 문자 : !"#$%&'()*+,-./:;<=>?@[]^_'{|}~</p>
				</small>
			</div>
		</div>
		<div class = "boxF">
			<div><span>√</span>비밀번호 확인</div>
			<div><input type="password" name="userpw" maxlength="16" placeholder="비밀번호를 재입력해주세요"/></div>
		</div>
		<div>
			<div class = "firstT"><span>√</span>생년월일</div>
			<div >
				<select name="birth">
					<c:forEach var="i" begin="1966" end="2020" step="1" >
						<option value="${i }">${i }</option>
					</c:forEach>	
				</select>
						<label>년</label>
				<select name="birth">
					<c:forEach var="i" begin="1" end="12" step="1" >
						<option value="${i }">${i }</option>
					</c:forEach>	
				</select>
						<label>월</label>
				<select name="birth">
					<c:forEach var="i" begin="1" end="31" step="1" >
						<option value="${i }">${i }</option>
					</c:forEach>		
				</select>
				<label>일</label>
				<small>
					<p>설정하신 생일을 기준으로 15일 전 생일쿠폰이 발행됩니다.</p>
				</small>
			</div>			
		</div>
		<div>
			<div class = "firstT"><span>√</span>휴대폰 번호</div>
			<div>
				<select name="userpnum">
						<option value="010" selected>010</option>
						<option value="011">011</option>
						<option value="016">016</option>
				</select> -
				<input type="text" name="userpnum" maxlength="4"/> -
				<input type="text" name="userpnum" maxlength="4"/>
				<small>
					<p>결제 쿠폰, 이벤트 정보 등을 제공 받으실 수 있습니다.</p>
				</small>
			</div>	
		</div>
		<div>
			<div class = "firstT"><span>√</span>이메일</div>
			<div>
				<input type="text" name="useremail" maxlength="16"/> @
				<input type="text" name="useremail" maxlength="16" placeholder= "naver.com"/>		
				<select name="tel">
							<option value="naver.com" selected>네이버</option>
							<option value="hanmail.net">한메일</option>
							<option value="nate.com">네이트</option>
							<option value="gmail.com">지메일</option>
				</select>
				<small>
					<p>이메일 주소 입력 시 사용 가능 특수 문자 : - . _</p>
				</small>
			</div>
		</div>
	</div>
<div>
	<input type="button" onclick="mainGo()" value="취소"/>
	<input type="submit" value="등록"/>
</div>
</form>

</body>
</html>