<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상담내역 확인</title>
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
	#sideBar ul li:nth-of-type(3) {background: white; }
	
	
	
	
	.history_detail {}
	
	.hdetail_top{padding: 5px 0; border-top: 1px solid black; background: #f7f8f9; border-bottom: 1px solid #d8d9db;  padding-left: 5px;  }
	.hdetail_top>ul>li {text-align: left; margin: 5px 0;   }
	.hdetail_top>ul>li:nth-of-type(1) {font-size: 20px; font-weight: bold;  }
	.hdetail_top span {width: 80px; display: inline-block;}
	
	.hdetail_cont {text-align: left; margin: 20px 0 0 0;   }
	.hdetail_cont_ques {padding-bottom: 50px; padding-left: 5px;  }
	.hdetail_cont_status {font-size: 20px ; font-weight: bold; width: 800px; height: 100px; background: #f7f8f9; 
							line-height: 100px; border-top: 1px solid #d8d9db;  padding-left: 5px; }
	.hdetail_cont_status span {font-size: 20px ; font-weight: bold;  }
	.hdetail_cont_ans {border-bottom: 1px solid black; padding-bottom: 50px; }
	
	.hdetail_bot  {text-align: left;  }

	.back_list>a {width: 100px; height: 50px; line-height: 50px;  background: orange; display: inline-block; text-align: center; border-radius: 10px;  }
	.back_list {width: 100px; margin: 70px auto; }
	
</style>
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











