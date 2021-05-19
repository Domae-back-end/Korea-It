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
	
	
	
	.notice_detail {background: yellow; }
	
	.detail_top{padding: 5px 0; border-bottom: 1px solid black; background: lime;  }
	.detail_top>ul>li {text-align: left; margin: 5px 0;   }
	.detail_top>ul>li:nth-of-type(1) {font-size: 20px; font-weight: bold;  }
	
	.detail_cont {text-align: left; margin: 20px 0; background: fuchsia;   }

	.detail_bot  {text-align: left; background: teal;  }
	.detail_bot tr td:nth-of-type(1) {width: 150px; background: blue; padding: 10px 20px;  }
	.detail_bot tr td:nth-of-type(2) {width: 650px; background: red; }
	.detail_bot>table a {width: 650px; height: 40px; line-height: 40px;  display: inline-block; background: yellow; }
	
	.back_list>a {width: 100px; height: 50px; line-height: 50px;  background: orange; display: inline-block; text-align: center; border-radius: 10px;  }
	.back_list {width: 100px; margin: 20px auto; }
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
	<h2>공지사항</h2>
	
	<div class="notice_detail">
		<!-- 구분 시스템, 영화관, 기타 -->
		<div class="detail_top">
			<ul>
				<li>[영화관] 휴관일정 공지사하아아아앙앙</li>
				<li>등록일 2021.05.18</li>
				<li>조회수 8</li>
			</ul>
		</div>
		<div class="detail_cont">
			<p>
				안녕하십니까. CGV인천연수입니다. <br />
				제9회 디아스포라영화제 대관으로 인해 CGV인천연수 상영관은 미운영됩니다. <br />
				CGV인천연수 이용 고객님께서는 아래 일정을 참고 부탁드립니다. <br />
				일반영화 관람을 원하시는 경우 인근 CGV인천, CGV인천학익을 이용 부탁드립니다. <br />
				감사합니다. <br />
			</p>
		</div>
		<div class="detail_bot">
			<table>
				<tr>
					<td>이전글</td>
					<td><a href="">[시스템] 아이돌 마스터 밀리언 라이브! 7thLive Q@MP FLYER!!!</a></td>
				</tr>
				<tr>
					<td>다음글</td>
					<td><a href="">[기타] 제 9회 디아스포라 영화제 대관으로 인한 미운영</a></td>
				</tr>
			</table>
			<div class="back_list">
				<a href="serviceNotice">목록</a>
			</div>
		</div>
	</div>
</div>

<div class="clear"></div>
</body>
</html>















