<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1대1 문의</title>
</head>

<body>
<div id="sideBar">
	<ul>
		<li><a href="serviceHome">고객센터</a></li>
		<li><a href="serviceHome">고객센터 홈</a></li>
		<c:choose>
			<c:when test="${empty data.onesfdto.persid }">
				<li><a href="../../member/login/loginForm">상담내역 확인</a></li>
			</c:when>
			<c:otherwise>
				<li><a href="serviceHistory">상담내역 확인</a></li>
			</c:otherwise>
		</c:choose>
		<li><a href="serviceQna">자주 묻는 질문</a></li>
		<c:choose>
			<c:when test="${empty data.onesfdto.persid }">
				<li><a href="../../member/login/loginForm">1대1 문의</a></li>
			</c:when>
			<c:otherwise>
				<li><a href="servicePersonal">1대1 문의</a></li>
			</c:otherwise>
		</c:choose>
		<li><a href="serviceNotice">공지사항</a></li>
	</ul>
</div>

<div id="content">
	<h2>1대1 문의</h2>
	
	<div class="subtitle">
		<p>- 문의하시기 전 자주묻는 질문을 확인하시면 궁금증을 더욱 빠르게 해결하실 수 있습니다.</p>
	</div>
	
	<div class="qna_form">
		<form action="/user/serviceC/qnainsertReg" method="post" enctype="multipart/form-data" name="fff"> 
		
			<div class="must_cont">* 필수</div>
			<table class="qna_form_tb">
				<tr>
					<td>문의유형 <span class="must_star">*</span></td>
					<td>
						<select name="perscate">
							<option value="basic">일반문의</option>
							<option value="movinfo">영화정보</option>
							<option value="member">회원</option>
							<option value="ticket">예매</option>
							<option value="lost">분실물</option>
							<option value="suggest">제안/건의</option>
						</select>
					</td>
				</tr>
				<tr>
					<td><label for="titleG">제목 <span class="must_star">*</span></label></td>
					<td><input type="text" name="perstitle" id="titleG" class="title" /></td>
				</tr>
				<tr>
					<td><label for="contG">내용 <span class="must_star">*</span></label></td>
					<td><textarea name="perscont" cols="30" rows="5" id="contG"></textarea></td>
				</tr>
				<tr>
					<td>사진첨부</td>
					
					<td>
						<div class="upload_box">
							<p>* JPG, JPEG, PNG 형식의 1MB 이하의 파일만 첨부 가능합니다.</p>
							<label for="upfileG" class="upfile_class">파일선택</label>
							<input type="file" name="file" id="upfileG" class="upload_hidden" onchange="checkfile(this, this.value)"/>
							<input class="upload_name" value="파일선택" disabled="disabled">
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center; background: none; border-bottom: none; ">
						<input type="button" value="등록" class="sbm" onclick="emptychk()"/>
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>

<div class="clear"></div>
</body>
</html>


















