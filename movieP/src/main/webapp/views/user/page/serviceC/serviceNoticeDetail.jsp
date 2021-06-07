<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 자세히</title>
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
	<h2>공지사항</h2>
	
	<div class="notice_detail">
		<!-- 구분 시스템, 영화관, 기타 -->
		<div class="detail_top">
			<ul>
				<li>[${data.now.noticecateKr }] ${data.now.noticetitle }</li>				
				<li>등록일 <fmt:formatDate value="${data.now.noticetime }" type="both" pattern="yyy.MM.dd"/></li>
				<li>조회수 ${data.now.noticeview }</li>
			</ul>
		</div>
		<div class="detail_cont">
			<p>
				${data.now.noticecontBr }
			</p>
		</div>
		<div class="detail_bot">
			<table>
				<tr>
					<td>이전글</td>
					<c:if test="${data.next.noticetitle eq null}">
						<td><a href="#">이전글이 없습니다.</a></td>
					</c:if>
					<c:if test="${data.next.noticetitle != null}">
						<td><a href="serviceNoticeDetail?page=${data.npDTO.page }&noticeindex=${data.next.noticeindex }&kind=title">${data.next.noticetitle }</a></td>
					</c:if>
				</tr>
				<tr>
					<td>다음글</td>
					<c:if test="${data.before.noticetitle eq null}">
						<td><a href="#">다음글이 없습니다.</a></td>
					</c:if>
					<c:if test="${data.before.noticetitle != null}">
						<td><a href="serviceNoticeDetail?page=${data.npDTO.page }&noticeindex=${data.before.noticeindex }&kind=title">${data.before.noticetitle }</a></td>
					</c:if>
				</tr>
			</table>
			<div class="back_list">
				<a href="serviceNotice?page=1&noticeindex=&kind2=${data.onesfdto.kind2 }&schkey=${data.onesfdto.schkey}">목록</a>
			</div>
		</div>
	</div>
</div>

<div class="clear"></div>
</body>
</html>















