<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="idfind_main">
	<h2>아이디 찾기</h2>
	<form action="" method="post" name="frm">
		<div class="main">
			<div class="outF">
				<div class="outD">이름</div>
				<div class="outT"><input type="text" id="username" name="username" maxlength="20" placeholder="이름" autocomplete="off" /></div>
			</div>
			<div class="outF">
				<div class="outD" >생년월일</div>
				<div class="outT"><input type="text" id="userbirth" name="userbirthM" maxlength="20" placeholder="19661122형식으로 입력" autocomplete="off" /></div>
			</div>
			<div class="outF">
				<div class="outD" >휴대폰 번호</div>
			<div class="outT"><input type="text" id="userpnum" name="userpnum" maxlength="20" placeholder="'-'제외하고 입력" autocomplete="off" /></div>
			</div>
				<input type="button" id="check" disabled="disabled" value="아이디 찾기"/>
		</div>
	</form>
</div>