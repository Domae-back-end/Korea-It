<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자주묻는질문</title>
</head>

<body>
<div id="sideBar">
	<ul>
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
	<h2>자주묻는질문</h2>
	
	<div class="qna1">
	<form action="">
			<label for="name">자주 묻는 질문</label>
			<input type="text" id="name" class="inputText" >
			<input type="submit" value="검색" class="inputButton">
		</form>
	</div>
	
	<div class="qna2">
		<div class="qna2_top">
			<ul>
				<li>
					<button type="button">전체</button>
				</li>
				<li>
					<button type="button" >영화/예매</button>
				</li>
				<li>
					<button type="button" >가입</button>
				</li>
				<li>
					<button type="button" >영화관</button>
				</li>
				<li>
					<button type="button" >기타</button>
				</li>
			</ul>
		</div>
		
		<div class="qna2_body">
			<div class="tot">
				총 10건이 검색되었습니다.
			</div>
			
			<table class="body_td">
				<tr>
					<td>번호</td>
					<td>카테고리</td><!-- 카테고리(전체, 영화/예매, 가입, 영화관, 기타) -->
					<td>제목</td>
				</tr>
				<tr>
					<td>4</td>
					<td>가입</td>
					<td>포인트적립도 있나요?</td>
				</tr>
				<tr>
					<td>3</td>
					<td>가입</td>
					<td>가입은 어떻게 하나요?</td>
				</tr>
				<tr>
					<td>2</td>
					<td>영화관</td>
					<td>휴관일정은 어디서 확인하나요?</td>
				</tr>
				<tr>
					<td>1</td>
					<td>영화/예매</td>
					<td>환불은 어떻게 하나요?</td>
				</tr>
			</table>
		</div><!-- qna2_body -->
	</div>
</div>

<div class="clear"></div>
</body>
</html>












