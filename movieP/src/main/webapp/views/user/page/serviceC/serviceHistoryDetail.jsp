<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상담내역 자세히</title>
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
	
	<div class="history_detail">
		<!-- 구분 시스템, 영화관, 기타 -->
		<div class="hdetail_top">
			<ul>
				<li>[${data.now.perscateKr }] ${data.now.perstitle }</li>
				<li><span>등록일</span> <fmt:formatDate value="${data.now.persqtime }" type="both" pattern="yyy.MM.dd"/></li>
				<li><span>답변상태</span> ${data.now.persstate }</li>
			</ul>
		</div>
		<div class="hdetail_cont">
			<p class="hdetail_cont_ques">
				${data.now.perscontBr }
			</p>
			<p class="hdetail_cont_pic">
				<c:if test="${data.now.persimg != null}">
					<img src='<c:url value="../../views/user/img/persupload/${data.now.persimg }" />' alt="" />
				</c:if>
			</p>
			<p class="hdetail_cont_status">
				<span> <fmt:formatDate value="${data.now.persatime }" type="both" pattern="yyy.MM.dd"/></span> ${data.now.persstate }
			</p>
			<p class="hdetail_cont_ans">
				${data.now.persacontBr }
			</p>
		</div>
		<div class="hdetail_bot">
			<div class="back_list">
				<a href="serviceHistory">목록</a>
			</div>
		</div>
	</div>
</div>

<div class="clear"></div>
</body>
</html>











