<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터 메인</title>
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
	<h2>고객센터 메인</h2>
	
	<form action="" name="frm">
	<input type="hidden" name="noticeindex" id="detailId" />
	
	<div class="search_Box">
		<div class="qna1">
			<label for="name">자주 묻는 질문</label>
			<input type="text" id="name" class="inputText" >
			<input type="submit" value="" class="inputButton">
		</div>
	</div>
	<div class="content2">
		<div class="qna2">
			<a href="serviceQna" title="자주묻는 질문"><img src="../../views/user/img/service/pic1.png" alt="" /></a>
		</div>
		<div class="history">
			<c:choose>
			<c:when test="${empty data.onesfdto.persid }">
				<li><a href="../../member/login/loginForm" title="상담내역 조회"><img src="../../views/user/img/service/pic2.png" alt="" /></a></li>
			</c:when>
			<c:otherwise>
				<li><a href="serviceHistory" title="상담내역 조회"><img src="../../views/user/img/service/pic2.png" alt="" /></a></li>
			</c:otherwise>
			</c:choose>
		</div>
		<div class="personal">
			<c:choose>
			<c:when test="${empty data.onesfdto.persid }">
				<li><a href="../../member/login/loginForm" title="1대1 문의"><img src="../../views/user/img/service/pic3.png" alt="" /></a></li>
			</c:when>
			<c:otherwise>
				<li><a href="servicePersonal" title="1대1 문의"><img src="../../views/user/img/service/pic3.png" alt="" /></a></li>
			</c:otherwise>
			</c:choose>
			
			
			
		</div>
	</div>
	
	<div class="content3">
		<div class="often">
			<div class="often_sctop">
				<span class="often_tx">자주 찾는 서비스</span>
			</div>
			<div class="often_scmain">
				<ul>
			<c:choose>
				<c:when test="${empty data.onesfdto.persid }">
					<li class="scmain_base" style="margin-right: 10px; margin-bottom: 10px; "><a href="../../member/login/loginForm" target="_blank" title="아이디 비밀번호 찾기">아이디/<br>비밀번호 찾기</a></li>
					<li class="scmain_base"><a href="../../member/login/loginForm" title="영화예매">영화<br>예매하기</a></li>
					<li class="scmain_base" style="margin-right: 10px; margin-bottom: 10px; "><a href="../../member/login/loginForm" title="예매내역 확인">예매내역<br>확인</a></li>
					<li class="scmain_base"><a href="../../member/login/loginForm" title="나의 무비스토리">나의<br>무비스토리</a></li>
					<li class="scmain_base" style="margin-right: 10px; "><a href="../../member/login/loginForm" title="분실물 문의">분실물<br>문의</a></li>
					<li class="scmain_base"><a href="../../member/login/loginForm" title="예매취소 문의">예매취소<br>문의</a></li>
				</c:when>
				<c:otherwise>
					<li class="scmain_spec" style="margin-right: 10px; margin-bottom: 10px; "><a href="#" class="click_block">아이디/<br>비밀번호 찾기</a></li>
					<li class="scmain_base"><a href="../../user/movietime/list" target="_blank" title="영화예매">영화<br>예매하기</a></li>
					<li class="scmain_base" style="margin-right: 10px; margin-bottom: 10px; "><a href="../../member/mypage/mypurchase" target="_blank" title="예매내역 확인">예매내역<br>확인</a></li>
					<li class="scmain_base"><a href="../../member/mypage/mymoviestroy?kind=seemovie" target="_blank" title="나의 무비스토리">나의<br>무비스토리</a></li>
					<li class="scmain_base" style="margin-right: 10px; "><a href="servicePersonal" title="분실물 문의">분실물<br>문의</a></li>
					<li class="scmain_base"><a href="servicePersonal" title="예매취소 문의">예매취소<br>문의</a></li>
				</c:otherwise>
			</c:choose>
				</ul>
			</div>
		</div>
		<div class="notice">
			<div class="notice_sctop">
				<span class="notice_tx">공지사항</span>
				<span class="notice_mr"><a href="serviceNotice" title="더보기">더보기<i></i></a></span>
			</div>
			<ul class="shotcut">
			<c:forEach items="${data.sfdto}" var="sfDTO" begin="0" end="5">
				<li>
					<p>
						<a href="javascript:detailGo(${sfDTO.noticeindex })" class="shotcut_hover" title="상세보기">
							<span>[${sfDTO.noticecateKr }]</span>
							<span>${sfDTO.noticetitle }</span>
							<span><fmt:formatDate value="${sfDTO.noticetime }" type="both" pattern="yyy.MM.dd"/></span>
						</a>
					</p>
				</li>
			</c:forEach>
			</ul>
		</div>
	</div>
	</form>
</div>

<div class="clear"></div>
</body>
</html>