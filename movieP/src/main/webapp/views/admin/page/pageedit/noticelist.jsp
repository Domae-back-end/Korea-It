<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>

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
<script src="../../../../my_js/jquery-3.6.0.js"></script>
<script>
	$(function() {
		//alert("안녕");
		$(".btn").click(function(){
			//alert("눌렀냐?"+$(this).attr("dd"))
			$("#pageIN").val($(this).attr("dd"))
			frm.submit()
		})
	})
	
</script>

<body>
<h2>공지/뉴스 게시판 리스트</h2>

<div class="notice_tb">
	<form action="" method="post" name="frm">
		<input type="hidden" name="page" id="pageIN" value="${data.snpdto.page}" />
	
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
			<c:forEach items="${data.sfdto }" var="nDTO" varStatus="no" >
				<tr>
					<td><input type="checkbox" /> ${nDTO.noticeindex }</td>
					<td>${nDTO.noticecate }</td>
					<td>${nDTO.noticetitle }</td>
					<td>
						<fmt:formatDate value="${nDTO.noticetime}" type="both" pattern="yyy.MM.dd"/>					
					</td>
					<td>${nDTO.noticeview }</td>
				</tr>
			</c:forEach>

			
			
			
				<tr>
					<td colspan="5" align="center">
					
						<c:if test="${data.snpdto.startPage > 1 }">
							<input type="button" class="btn" dd="${data.snpdto.startPage-1 }" value="&lt" />	
						</c:if>
						
						<c:forEach begin="${data.snpdto.startPage }" end="${data.snpdto.endPage }" step="1" var="i">
							<c:choose>
								<c:when test="${i==data.snpdto.page }">
									[${i }]
								</c:when>
								<c:otherwise>
									<input type="button" class="btn" dd="${i }" value="${i }" />
								</c:otherwise>
							</c:choose>
						</c:forEach>
						
						<c:if test="${data.snpdto.endPage < data.snpdto.total }">
							<input type="button" class="btn" dd="${data.snpdto.endPage+1 }" value="&gt" />
						</c:if>
					
					
					
					</td>
				</tr>
			
			
			
			
			
			
			
			
			
			
			
			
			</table>
			</form>
		</div>
		
</body>
</html>