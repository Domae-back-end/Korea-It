<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<title>FAQ_Detail</title>

<body>
<h1>FAQ_Detail</h1>
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
<form action="/user/serviceC/serviceDetail" method="post" name="frm">
<input type="hidden" name="bqindex" value="${data.sfDTO.bqindex }">
<input type="hidden" name="page" value="${data.npDTO.page }">
	<table class="table table-striped">
		<tr>
			<td>ID</td>
			<td>카테고리</td>
			<td>조회수</td>
			<td>제목</td>
			<td>내용</td>
		</tr>
		<tr>
			<td>${data.sfDTO.bqindex }</td>
			<td>${data.sfDTO.bqcate }</td>
			<td>${data.sfDTO.viewcnt }</td>
			<td>${data.sfDTO.bqtitle }</td>
			<td>${data.sfDTO.bqcontbr }</td>
		</tr>
		<tr>
			<td colspan="5" align="right">
				<a href="serviceQna?bqindex=${data.sfDTO.bqindex}&page=${data.npDTO.page}">뒤로</a>
			</td>
		</tr>
	</table>
</form>
</div>

<div class="clear"></div>
</body>
