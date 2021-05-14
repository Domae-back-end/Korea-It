<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인</title>
<style>
	* {padding: 0px; margin: 0px; }
	ul, li {text-decoration: none; list-style: none; }
	a {text-decoration: none; }
	
	#sideBar {width: 170px; height: 500px; background: yellow; float: left; position: relative;  }
	#content {width: 800px; background: aqua; position: relative; float: left; left: 30px;  }
	.clear {clear: both; }
	
	h2 {text-align: left; font-size: 30px; margin-bottom: 20px; }
	
	div ul li {width: 170px; height: 60px; background: red; margin-bottom: 5px; line-height: 60px; display: inline-block; }
	div ul li a {font-size: 18px; width: 170px; height: 60px; display: inline-block;}
		
	/* content 속지 */
	.qna1 {width: 800px; height: 100px; background: blue; margin-bottom: 50px; border-radius: 25px; font-size: 25px; line-height: 100px;}
	.inputText {font-size: 25px; width: 370px;  }
	.inputButton {font-size: 25px; width: 70px; }
	
	
	/* content2 속지 */
	.content2 {padding-bottom: 50px; width: 800px; background: yellow; height: 200px; border-bottom: 1px solid gray; margin-bottom: 50px; }
	.qna2 {width: 250px; height: 200px; background: blue; float: left; margin-right: 25px;  }
	.history {width: 250px; height: 200px; background: blue; float: left;  margin-right: 25px; }
	.personal {width: 250px; height: 200px; background: blue; float: left;}
	
	
	/* content3 속지 */
	.content3 {background: gren; width: 800px; height: 300px; margin-bottom: 100px; }
	.often {width: 300px; height: 300px; background: blue; float: left;}
	.notice {width: 470px; height: 300px; background: blue; float: left; margin-left: 30px; }
	
	
	
</style>


</head>

<body>
<div id="sideBar">
	<ul>
		<li><a href="serviceMain2">고객센터 홈</a></li>
		<li><a href="serviceHistory">상담내역 확인</a></li>
		<li><a href="#">자주 묻는 질문</a></li>
		<li><a href="#">1대1 문의</a></li>
		<li><a href="#">공지사항</a></li>
	</ul>
</div>

<div id="content">
	<h2>고객센터 홈</h2>
	
	<div class="qna1">
		<form action="">
			<label for="name">자주 묻는 질문</label>
			<input type="text" id="name" class="inputText" >
			<input type="submit" value="검색" class="inputButton">
		</form>
	</div>
	
	<div class="content2">
		<div class="qna2">
			<p>자주묻는 질문</p>
		</div>
		<div class="history">
			<p>상담내역 확인</p>
		</div>
		<div class="personal">
			<p>1대1 문의</p>
		</div>
	</div>
	
	<div class="content3">
		<div class="often">
			<p>자주찾는 서비스</p>
		</div>
		<div class="notice">
			<p>공지사항</p>
		</div>
	</div>
</div>

<div class="clear"></div>
</body>
</html>