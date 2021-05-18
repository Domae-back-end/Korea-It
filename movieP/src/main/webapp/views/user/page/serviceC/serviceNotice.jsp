<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
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
		
	
	/* 공지테이블 */
	.td1 {font-size: 16px; border-top: 1px solid gray; border-bottom: 1px solid gray; border-spacing: 0; }
	.td1 tr:first-of-type>td {background: yellow; font-weight: bold; border-bottom: 1px solid gray; }
	.td1 tr:first-of-type>td:nth-of-type(1) {width: 50px;  }
	.td1 tr:first-of-type>td:nth-of-type(2) {width: 100px;  }
	.td1 tr:first-of-type>td:nth-of-type(3) {width: 430px;  }
	.td1 tr:first-of-type>td:nth-of-type(4) {width: 120px;  }
	.td1 tr:first-of-type>td:nth-of-type(5) {width: 100px;  }
	
	/* 검색 search */
	.search {width: 400px; height: 50px; background: lime; margin-left: 400px; }
	.search>select {font-size: 16px; width: 100px; height: 40px;   }
	.search>input[type="text"] {font-size: 16px; width: 200px; height: 36px; }
	.search>input[type="submit"] {font-size: 16px; width: 50px; height: 40px; }
	
</style>
</head>

<body>
<div id="sideBar">
	<ul>
		<li><a href="serviceMain">고객센터 홈</a></li>
		<li><a href="serviceHistory">상담내역 확인</a></li>
		<li><a href="#">자주 묻는 질문</a></li>
		<li><a href="#">1대1 문의</a></li>
		<li><a href="#">공지사항</a></li>
	</ul>
</div>

<div id="content">
	<h2>공지사항</h2>
	<form action="" method="post">
		<div class="search">
			<select name="kind">
				<option value="title" >제목</option>
				<option value="pname" >내용</option>
			</select>
			<input type="text" />
			<input type="submit" value="검색" />
		</div>
		
		<div class="notice_tb">
			<!-- 구분 시스템, 영화관, 기타 -->
			<table class="td1">
				<tr>
					<td>번호</td>
					<td>구분</td>
					<td>제목</td>
					<td>등록일</td>
					<td>조회수</td>
				</tr>
				<tr>
					<td>2</td>
					<td>시스템</td>
					<td>홈페이지 점검</td>
					<td>2020/05/17</td>
					<td>4</td>
				</tr>
				<tr>
					<td>1</td>
					<td>영화관</td>
					<td>영화관 휴관일정</td>
					<td>2020/05/17</td>
					<td>3</td>
				</tr>
			</table>
		</div>
	</form>
</div>

<div class="clear"></div>
</body>
</html>