<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상담내역 확인</title>
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
	<h2>상담내역 확인</h2>
		
	<div class="search_result">
		<p>총 <span>${data.snpdto.ttt }</span> 건이 검색되었습니다.</p>
	</div>
		
	<div>
		<form action="" name="frm">
		<input type="hidden" name="page" id="pageIN" value="${data.snpdto.page}" />
		<input type="hidden" name="persindex" id="detailId" />
		<table class="td1" >
			<tr>
				<td>번호</td>
				<td>카테고리</td>
				<td>제목</td>
				<td>등록일</td>
				<td>상태</td>
			</tr>
		<c:forEach items="${data.sfdto }" var="sfDTO" varStatus="no" >
			<tr>
				<td>${sfDTO.persindex }</td>
				<td>${sfDTO.perscateKr }</td>
				<td>
					<a href="javascript:detailGo(${sfDTO.persindex })"><span>${sfDTO.perstitle }</span></a>
				</td>
				<td>					
					<fmt:formatDate value="${sfDTO.persqtime}" type="both" pattern="yyy.MM.dd"/>					
				</td>
				<td>
					<p><fmt:formatDate value="${sfDTO.persatime }" type="both" pattern="yyy.MM.dd"/></p>
					<p>${sfDTO.persstate }</p>
				</td>
			</tr>
		</c:forEach>
		
		
		
			<tr>
				<td colspan="5" align="center">
				
					<c:if test="${data.snpdto.startPage > 1 }">
						<input type="button" class="btnnn pagebtn pagebtn_lr" dd="${data.snpdto.startPage-1 }" value="&lt" />	
					</c:if>
					
					<c:forEach begin="${data.snpdto.startPage }" end="${data.snpdto.endPage }" step="1" var="i">
						<c:choose>
							<c:when test="${i==data.snpdto.page }">
								<input type="text" class="pagebtn_sel" dd="${i }" value="${i }" readonly/>
							</c:when>
							<c:otherwise>
								<input type="button" class="btnnn pagebtn" dd="${i }" value="${i }" />
							</c:otherwise>
						</c:choose>
					</c:forEach>
					
					<c:if test="${data.snpdto.endPage < data.snpdto.total }">
						<input type="button" class="btnnn pagebtn pagebtn_lr" dd="${data.snpdto.endPage+1 }" value="&gt" />
					</c:if>
				
				
				
				</td>
			</tr>
		
		
		
		
		
		
		
		
		
		</table>
		</form>
	</div>
</div>

<div class="clear"></div>
</body>
</html>











