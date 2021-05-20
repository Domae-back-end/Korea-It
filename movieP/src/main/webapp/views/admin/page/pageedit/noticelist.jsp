<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	* {padding: 0px; margin: 0px; }
	ul, li {text-decoration: none; list-style: none; }
	a {text-decoration: none; }
	
	
	
	/* 공지테이블 */
	.td1 {font-size: 16px; border-top: 1px solid gray; border-bottom: 1px solid gray; border-spacing: 0; }
	.td1 tr:nth-of-type(2)>td {background: yellow; font-weight: bold; border-bottom: 1px solid gray; }
	.td1 tr:nth-of-type(2)>td:nth-of-type(1) {width: 50px;  }
	.td1 tr:nth-of-type(2)>td:nth-of-type(2) {width: 100px;  }
	.td1 tr:nth-of-type(2)>td:nth-of-type(3) {width: 430px;  }
	.td1 tr:nth-of-type(2)>td:nth-of-type(4) {width: 120px;  }
	.td1 tr:nth-of-type(2)>td:nth-of-type(5) {width: 100px;  }
	
</style>

<title>공지뉴스/리스트</title>
</head>


<body>
<h2>공지/뉴스 게시판 리스트</h2>

<div class="notice_tb">
			<!-- 구분 시스템, 영화관, 기타 -->
			<table class="td1">
				<tr>
					<td colspan="5" style="text-align: right; ">
						<a href="noticeinsert">글쓰기</a>
						<a href="">수정</a>
						<a href="">삭제</a>
					</td>
				</tr>
				<tr>
					<td>번호</td>
					<td>구분</td>
					<td>제목</td>
					<td>등록일</td>
					<td>조회수</td>
				</tr>
			<c:forEach items="${data }" var="nDTO" varStatus="no" >
				<tr>
					<td>${nDTO.noticeindex }</td>
					<td>${nDTO.noticecate }</td>
					<td>${nDTO.noticetitle }</td>
					<td>${nDTO.datetime }</td>
					<td>${nDTO.noticeview }</td>
				</tr>
			</c:forEach>

			
			
			
			
			
			
			
			
			
			
			
			
			</table>
		</div>
</body>
</html>