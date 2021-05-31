<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터 메인</title>
<style>
	* {padding: 0px; margin: 0px; font-size: 16px;  }
	ul, li {text-decoration: none; list-style: none; }
	a {text-decoration: none; color: black; }
	a:hover {text-decoration: none; }
	
	#sideBar {width: 170px; height: 500px; float: left; position: relative; }
	#content {width: 800px; position: relative; float: left; left: 30px;  }
	.clear {clear: both; }
	
	h2 {text-align: left; font-size: 28px; margin-bottom: 30px; }
	
	#sideBar ul li:nth-of-type(1) {height: 100px; line-height: 100px; background: #444; border: 1px solid #444; border-radius: 10px 10px 0 0; }
	#sideBar ul li:nth-of-type(1) a {font-size: 20px; height: 100px; color: white; }
	#sideBar ul li {width: 170px; height: 60px; background: #F2F4F5; line-height: 60px; display: inline-block; box-sizing: border-box; border: 1px solid #d8d9db; }
	#sideBar ul li a {width: 170px; height: 60px; display: inline-block;}
	#sideBar ul li:last-child {border-radius: 0 0 10px 10px; }
	#sideBar ul li:nth-of-type(2) {background: white; }
	
	
		
	/* content 속지 */
	.search_Box {width: 800px; height: 80px; background: #c5f7f5; border-radius: 10px; margin-bottom: 50px; padding-top: 20px; }
	.qna1 {width: 700px; height: 40px;}
	.qna1 label {font-weight: bold; }
	.qna1>.inputText {width: 370px; border: 0px; border-bottom: 3px solid #5467dc; outline: none; padding: 5px; height: 40px; margin-left: 10px; }
	.qna1>.inputButton {font-size: 20px; width: 40px; height: 40px;  border: 0px; border-bottom: 3px solid #5467dc; margin-left: -5px;  
						position: absolute; left: 590px; background-image: url("../../views/user/img/service/search.png") }
	
	
	
	/* content2 속지 */
	.content2 {width: 800px; height: 250px; border-bottom: 1px solid #eaeaea; margin-bottom: 50px; }
	.qna2 {width: 250px; height: 200px; float: left; margin-right: 25px;  }
	.history {width: 250px; height: 200px; float: left;  margin-right: 25px; }
	.personal {width: 250px; height: 200px; float: left;}
	
	
	/* content3 속지 */
	.content3 {background: gren; width: 800px; height: 300px; margin-bottom: 100px; text-align: left; }
	.often {width: 300px; height: 300px; float: left;}
	.often_sctop {border-bottom: 1px solid #444; padding-bottom: 10px; margin-bottom: 15px; }
	.often_tx {font-size: 20px; font-weight: bold; }
	.often_scmain ul li {width: 145px; height: 75px; float: left; box-sizing: border-box;
						background-image: url("../../views/user/img/service/shotcut1.png");
						border-radius: 5px; padding-left: 10px; padding-top: 10px; display: inline-block; }
	.often_scmain ul li a {display: inline-block;width: 145px; height: 75px;  } 
	.often_scmain:after {content:""; display: block; clear: both;}
	
	
	
	.notice {width: 470px; height: 300px; float: left; margin-left: 30px; text-align: left; border-bottom: 1px solid #444; }
	
	/* 공지사항바로가기 */
	.notice_sctop {border-bottom: 1px solid #444; padding-bottom: 10px; margin-bottom: 15px; }
	.notice .notice_tx {font-size: 20px; font-weight: bold; }
	.notice .notice_mr>a {font-size: 16px; color: #222; margin-left: 300px;}
	.notice .notice_mr>a>i { background-image: url("../../views/user/img/service/more.png"); background-repeat: no-repeat; width: 20px; height: 22px; display: inline-block; }
	.shotcut p{margin: 0px; line-height: 30px; display: inline-block;  }
	
	.shotcut span:nth-of-type(1) {display: inline-block; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; }
	.shotcut span:nth-of-type(2) {width: 310px; display: inline-block; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; }
	.shotcut span:nth-of-type(3) {display: inline-block; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; }
	.shotcut_hover:hover {font-weight: bold; color: #444; }
</style>

<script>
	function detailGo(aa) {
		//alert("detailGo 눌렀냐?"+aa)
		frm.action = "serviceNoticeDetail"
		$("#detailId").val(aa)
		alert(aa+"번으로 이동")
		frm.submit()
	}
	
</script>
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
			<a href="serviceQna"><img src="../../views/user/img/service/pic1.png" alt="" /></a>
		</div>
		<div class="history">
			<c:choose>
			<c:when test="${empty data.onesfdto.persid }">
				<li><a href="../../member/login/loginForm"><img src="../../views/user/img/service/pic2.png" alt="" /></a></li>
			</c:when>
			<c:otherwise>
				<li><a href="serviceHistory"><img src="../../views/user/img/service/pic2.png" alt="" /></a></li>
			</c:otherwise>
			</c:choose>
			
		</div>
		<div class="personal">
			<c:choose>
			<c:when test="${empty data.onesfdto.persid }">
				<li><a href="../../member/login/loginForm"><img src="../../views/user/img/service/pic3.png" alt="" /></a></li>
			</c:when>
			<c:otherwise>
				<li><a href="servicePersonal"><img src="../../views/user/img/service/pic3.png" alt="" /></a></li>
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
					<li style="margin-right: 10px; margin-bottom: 10px; "><a href="">아이디/<br>비밀번호 찾기</a></li>
					<li><a href="">영화<br>예매하기</a></li>
					<li style="margin-right: 10px; margin-bottom: 10px;  "><a href="">예매내역<br>확인</a></li>
					<li><a href="">나의<br>무비스토리</a></li>
					<li style="margin-right: 10px; "><a href="">분실물<br>문의</a></li>
					<li><a href="">예매취소<br>문의</a></li>
				</ul>
			</div>
		</div>
		<div class="notice">
			<div class="notice_sctop">
				<span class="notice_tx">공지사항</span>
				<span class="notice_mr"><a href="serviceNotice">더보기<i></i></a></span>
			</div>
			<ul class="shotcut">
			<c:forEach items="${data.sfdto}" var="sfDTO" begin="0" end="5">
				<li>
					<p>
						<a href="javascript:detailGo(${sfDTO.noticeindex })" class="shotcut_hover">
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