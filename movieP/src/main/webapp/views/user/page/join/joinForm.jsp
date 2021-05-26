<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>

<script src="<c:url value="/resources/my_js/jquery-3.6.0.js"/>"></script>
<script src="<c:url value="/resources/my_js/jquery-ui.min.js"/>"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href='<c:url value="/resources/css/${PPPData.cate}/${PPPData.service}.css" />'>
<script src="<c:url value="/resources/js/${PPPData.cate}/${PPPData.service}.js" />" ></script>
</head>
<body>
<h1>기본정보</h1>
<form action ="joinReg" method="post" enctype="multipart/form-data" name="frm">
	
	<input type="hidden" name="userpnum" id="userpnum">
	<input type="hidden" name="useremail" id="useremail">
    <input type="hidden" name="birthYear" id="birthYear">
    <input type="hidden" name="birthDay" id="birthDay">
    <input type="hidden" name="kind" id="kind" value="일반" >
	
	<div>
		<div class = "boxF">
			<div><span>√</span>이름</div>
			<div>
				<input type="text" id="username" name="username" maxlength="10"  placeholder="이름을 입력해주세요"/>
				<div class="check_msg" id="name_check"></div>
			</div>	
		</div>
		<div class = "boxF">
			<div><span>√</span>아이디</div>
			<div>
				<input type="text" id="userid" name="userid" maxlength="20" placeholder="아이디를 입력해주세요"/>
				<input type="button" class="chButt" id="usercheck" disabled="disabled" value="중복확인"/>
				<div class="check_msg" id="id_check"></div>
			</div>
		</div>
		<div class="boxF">
			<div><span>√</span>비밀번호</div>
			<div>
				<input type="password" id="userpw" name="userpw" maxlength="16" placeholder="비밀번호를 입력해주세요"/>
				<div class="check_msg" id="pw_check"></div>
			</div>
		</div>
		<div class = "boxF">
			<div><span>√</span>비밀번호 확인</div>
			<div>
				<input type="password" id="userpwchk" name="userpwchk" readonly="readonly" maxlength="16" placeholder="비밀번호를 재입력해주세요"/>
				<div class="check_msg" id="pw_check2"></div>
			</div>
		</div>
		<div class = "boxF">
			<div><span>√</span>생년월일</div>
			<div>
				<select id="birthY" name="birthY">
					<c:forEach var="i" begin="1966" end="2020" step="1" >
						<option value="${i }">${i }</option>
					</c:forEach>	
				</select>
						<label>년</label>
				<select id="birthM" name="birthM">
					<c:forEach var="i" begin="1" end="12" step="1" >
						<option value="${i }">${i }</option>
					</c:forEach>	
				</select>
						<label>월</label>
				<select id="birthD" name="birthD">
					<c:forEach var="i" begin="1" end="31" step="1" >
						<option value="${i }">${i }</option>
					</c:forEach>		
				</select>
				<label>일</label>
			</div>			
		</div>
		<div class = "boxF" id ="boxS">
			<div id ="boxS"><span>√</span>휴대폰 번호</div>
			<div>
				<select id="pnumF" name="pnumF">
					<c:forEach var="i" begin="0" end="9" step="1" >
						<option value="01${i }">01${i }</option>
					</c:forEach>
				</select> -
				<input type="text" class="pnumDes" id="pnumM" name="pnumM" maxlength="4"/> -
				<input type="text" class="pnumDes" id="pnumL" name="pnumL" maxlength="4"/>
				<input type="button" class="chButt" id="pnumcheck" disabled="disabled" value="인증번호 발송"/>
				<input type="hidden" class="pnumDes" id="pchecknum" maxlength="4"/>
				<input type="hidden" class="chButt" id="checkBtn" value="확인"/>
				<div class="check_msg" id="pnum_check"></div>
			</div>
		</div>
		<div class = "boxF">
			<div><span>√</span>이메일</div>
			<div id="email_Ch">
				<input type="text" id="emailId" name="emailId" maxlength="20"/> @
				<input type="text" id="emailAd" name="emailAd" maxlength="16"/>		
				<select name="emailSe" id="emailSe">
					<option value="직접입력" selected>직접입력</option>
					<option value="naver.com" >네이버</option>
					<option value="hanmail.net">한메일</option>
					<option value="nate.com">네이트</option>
					<option value="gmail.com">지메일</option>
				</select>
				<div class="check_msg" id="email_check"></div>
			</div>
		</div>
	</div>
<div>
	<input type="button" onclick="mainGo()" value="취소"/>
	<input type="submit" id="check" value="등록"/>
</div>
</form>

</body>
</html>