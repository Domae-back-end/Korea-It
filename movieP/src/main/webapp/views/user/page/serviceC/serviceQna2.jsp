<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자주묻는질문</title>
<style>
	* {padding: 0px; margin: 0px; }
	ul, li {text-decoration: none; list-style: none; }
	a {text-decoration: none; }
	
	#sideBar {width: 170px; height: 500px; background: yellow; float: left; position: relative;  }
	#content {width: 800px; background: aqua; position: relative; float: left; left: 30px;  }
	.clear {clear: both; }
	
	h2 {text-align: left; font-size: 30px; margin-bottom: 20px; }
	
	#sideBar ul li {width: 170px; height: 60px; background: red; margin-bottom: 5px; line-height: 60px; display: inline-block; }
	#sideBar ul li a {font-size: 18px; width: 170px; height: 60px; display: inline-block;}
		
	/* content 속지 */
	.qna1 {width: 800px; height: 100px; background: blue; margin-bottom: 50px; border-radius: 25px; font-size: 25px; line-height: 100px;}
	.inputText {font-size: 25px; width: 370px;  }
	.inputButton {font-size: 25px; width: 70px; }
	
	/* qna2 상단bar */
	.qna2_top {width: 800px; background: yellow; }
	.qna2_top>ul {display: block; }
	.qna2_top>ul>li {float: left; display: inline-block; width: 160px; line-height: 40px; height: 40px;  }
	.qna2_top>ul>li>button {width: 160px; height: 40px; font-size: 14px; line-height: 40px; cursor: pointer;
							box-sizing: border-box;border: 1px solid gray; background: yellow; }
	
	
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
	<h2>자주묻는질문</h2>
	
	<div class="qna1">
	<form action="">
			<label for="name">자주 묻는 질문</label>
			<input type="text" id="name" class="inputText" >
			<input type="submit" value="검색" class="inputButton">
		</form>
	</div>
	
	<div class="qna2">
		<div class="qna2_top">
			<ul>
				<li>
					<button type="button">전체</button>
				</li>
				<li>
					<button type="button" >영화/예매</button>
				</li>
				<li>
					<button type="button" >가입</button>
				</li>
				<li>
					<button type="button" >영화관</button>
				</li>
				<li>
					<button type="button" >기타</button>
				</li>
			</ul>
		</div>
	</div>
</div>

<div class="clear"></div>
</body>
</html>












