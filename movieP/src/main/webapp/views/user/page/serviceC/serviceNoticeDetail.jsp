<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
		<c:choose>
			<c:when test="${empty data.onesfdto.persid }">
				<li><a href="../../member/login/loginForm">상담내역 확인</a></li>
			</c:when>
			<c:otherwise>
				<li><a href="serviceHistory">상담내역 확인</a></li>
			</c:otherwise>
		</c:choose>
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
				<li>[${data.now.noticecateKr }] ${data.now.noticetitle }</li>				
				<li>등록일 <fmt:formatDate value="${data.now.noticetime }" type="both" pattern="yyy.MM.dd"/></li>
				<li>조회수 ${data.now.noticeview }</li>
			</ul>
		</div>
		<div class="detail_cont">
			<p>
				${data.now.noticecontBr }
			</p>
		</div>
		<div class="detail_bot">
			<table>
				<tr>
					<td>이전글</td>
					<c:if test="${data.next.noticetitle eq null}">
						<td><a href="#">이전글이 없습니다.</a></td>
					</c:if>
					<c:if test="${data.next.noticetitle != null}">
						<td><a href="serviceNoticeDetail?page=${data.npDTO.page }&noticeindex=${data.next.noticeindex }&kind=title">${data.next.noticetitle }</a></td>
					</c:if>
				</tr>
				<tr>
					<td>다음글</td>
					<c:if test="${data.before.noticetitle eq null}">
						<td><a href="#">다음글이 없습니다.</a></td>
					</c:if>
					<c:if test="${data.before.noticetitle != null}">
						<td><a href="serviceNoticeDetail?page=${data.npDTO.page }&noticeindex=${data.before.noticeindex }&kind=title">${data.before.noticetitle }</a></td>
					</c:if>
				</tr>
			</table>
			<div class="back_list">
				<a href="serviceNotice?page=${data.npDTO.page }&noticeindex=&kind2=${data.onesfdto.kind2 }&schkey=${data.onesfdto.schkey}">목록</a>
			</div>
		</div>
	</div>
</div>

<div class="clear"></div>
</body>
</html>















