<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
</style>
</head>

<body>
<div id="sideBar">
	<ul>
		<li><a href="serviceHome">고객센터 홈</a></li>
		<li><a href="serviceHistory">상담내역 확인</a></li>
		<li><a href="serviceQna">자주 묻는 질문</a></li>
		<li><a href="servicePersonal">1대1 문의</a></li>
		<li><a href="serviceNotice">공지사항</a></li>
	</ul>
</div>

<div id="content">
	<h2>상담내역 확인</h2>
	
	<div>
	<table class="td1" >
		<tr>
			<td>번호</td>
			<td>카테고리</td>
			<td>제목</td>
			<td>등록일</td>
			<td>상태</td>
		</tr>
		<tr>
			<td>2</td>
			<td>가입</td>
			<td>ㅇ안된다고</td>
			<td>2020/05/17</td>
			<td>
				<p class="pp">2020/05/18</p>
				<p class="pp">답변완료</p>
			</td>
		</tr>
		<tr>
			<td>1</td>
			<td>가입</td>
			<td>가입이안되요</td>
			<td>2020/05/17</td>
			<td>
				<p></p>
				<p>미답변</p>
			</td>
		</tr>
	</table>
	</div>
</div>

<div class="clear"></div>
</body>
</html>











