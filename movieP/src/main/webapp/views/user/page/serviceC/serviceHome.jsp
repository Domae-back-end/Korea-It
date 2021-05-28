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
	.qna1>.inputText {width: 370px; border: 0px; border-bottom: 3px solid black; outline: none; padding: 5px; height: 40px;}
	.qna1>.inputButton {font-size: 20px; width: 70px; height: 40px;  border: 0px; border-bottom: 3px solid black; margin-left: -5px;  
						position: absolute; left: 590px;}
	
	
	
	/* content2 속지 */
	.content2 {width: 800px; height: 250px; border-bottom: 1px solid #eaeaea; margin-bottom: 50px; }
	.qna2 {width: 250px; height: 200px; float: left; margin-right: 25px;  }
	.history {width: 250px; height: 200px; float: left;  margin-right: 25px; }
	.personal {width: 250px; height: 200px; float: left;}
	
	
	/* content3 속지 */
	.content3 {background: gren; width: 800px; height: 300px; margin-bottom: 100px; }
	.often {width: 300px; height: 300px; background: blue; float: left;}
	.notice {width: 470px; height: 300px; background: blue; float: left; margin-left: 30px; }
	
	/* 공지사항바로가기 */
	.notice {text-align: left; }
	.shotcut li { }
	.shotcut span:nth-of-type(1) {width: 370px; display: inline-block; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; }
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
		<li><a href="serviceHome">고객센터 홈</a></li>
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
			<input type="submit" value="검색" class="inputButton">
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
			<p>자주찾는 서비스</p>
		</div>
		<div class="notice">
			<p><span>공지사항</span><span><a href="serviceNotice">더보기</a></span></p>
			<ul class="shotcut">
			<c:forEach items="${data.sfdto}" var="sfDTO" begin="0" end="5">
				<li>
					<p>
						<a href="javascript:detailGo(${sfDTO.noticeindex })">
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