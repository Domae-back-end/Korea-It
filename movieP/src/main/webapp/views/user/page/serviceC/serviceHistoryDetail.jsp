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
	* {padding: 0px; margin: 0px; }
	ul, li {text-decoration: none; list-style: none; }
	a {text-decoration: none; }
	
	#sideBar {width: 170px; height: 500px; background: yellow; float: left; position: relative;  }
	#content {width: 800px; background: aqua; position: relative; float: left; left: 30px;  }
	.clear {clear: both; }
	
	h2 {text-align: left; font-size: 30px; margin-bottom: 40px; }
	
	#sideBar ul li {width: 170px; height: 60px; background: red; margin-bottom: 5px; line-height: 60px; display: inline-block; }
	#sideBar ul li a {font-size: 18px; width: 170px; height: 60px; display: inline-block;}
		
	.td1 {font-size: 16px; border-top: 1px solid gray; border-bottom: 1px solid gray; border-spacing: 0; }
	.td1 tr:first-of-type>td {background: yellow; font-weight: bold; border-bottom: 1px solid gray; }
	.td1 tr:first-of-type>td:nth-of-type(1) {width: 50px;  }
	.td1 tr:first-of-type>td:nth-of-type(2) {width: 100px;  }
	.td1 tr:first-of-type>td:nth-of-type(3) {width: 430px; }
	.td1 tr>td:nth-of-type(3) {text-align: left; }
	.td1 tr:first-of-type>td:nth-of-type(4) {width: 120px;  }
	.td1 tr:first-of-type>td:nth-of-type(5) {width: 100px;  }
	.pp {margin: 5px 0;  }
	
	
	.history_detail {background: yellow; }
	
	.hdetail_top{padding: 5px 0; border-bottom: 1px solid black; background: lime;  }
	.hdetail_top>ul>li {text-align: left; margin: 5px 0;   }
	.hdetail_top>ul>li:nth-of-type(1) {font-size: 20px; font-weight: bold;  }
	.hdetail_top span {width: 80px; display: inline-block;}
	
	.hdetail_cont {text-align: left; margin: 20px 0; background: fuchsia;   }
	.hdetail_cont_ques {padding-bottom: 50px; border-bottom: 1px solid black; margin-bottom: 50px;  }
	.hdetail_cont_status {}
	.hdetail_cont_ans {}
	
	.hdetail_bot  {text-align: left; background: teal;  }

	.back_list>a {width: 100px; height: 50px; line-height: 50px;  background: orange; display: inline-block; text-align: center; border-radius: 10px;  }
	.back_list {width: 100px; margin: 20px auto; }
	
</style>
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











