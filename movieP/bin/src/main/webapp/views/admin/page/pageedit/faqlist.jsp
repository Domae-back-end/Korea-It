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

<title>자주찾는질문관리</title>
</head>


<body>
<h2>자주찾는질문관리</h2>

<div class="notice_tb">
			<!-- 구분 시스템, 영화관, 기타 -->
			<table class="td1">
				<tr>
					<td colspan="5" style="text-align: right; ">
						<a href="faqinsert">글쓰기</a>
						<!-- <a href="admin/pageedit/faqmodify">수정</a> -->
					<!-- 	<a href="admin/pageedit/faqdelete">삭제</a> -->
					</td>
				</tr>
				<tr>
					<td>번호</td>
					<td>구분</td>
					<td>제목</td>
					<td>등록일</td>
					<td>조회수</td>
				</tr>
			<c:forEach items="${data.sfDTO }" var="faqDTO" varStatus="no" >
				<tr>
					<td>${faqDTO.bqindex }</td>
					<td>${faqDTO.bqcate }</td>
					<td>${faqDTO.bqtitle }</td>
					
				</tr>
			</c:forEach>

			
			
			
			<tr>
				<td colspan="5" align="center"><c:if
						test="${data.pdto.startPage > 1}">
						<%-- <a href="?page=${data.pdto.startPage-1}"> < </a> --%>

						<input type="button" class="btn"
							pagetoGo="${data.pdto.startPage-1}" value="&lt;" />
					</c:if> <c:forEach begin="${data.pdto.startPage}"
						end="${data.pdto.endPage }" step="1" var="i">
						<c:choose>
							<c:when test="${i==data.pdto.page }">
						[${i }]
					</c:when>
							<c:otherwise>
								<input type="button" class="btn" pagetoGo="${i }" value="${i }" />
								<%-- 	<a href="?page=${i }">${i }</a>	 --%>
							</c:otherwise>
						</c:choose>

					</c:forEach> <c:if test="${data.pdto.endPage < data.pdto.total}">
						<%-- <a href="?page=${data.pdto.endPage+1}&cnt=${data.bdto.cnt}"> > </a> --%>
						<input type="button" class="btn" pagetoGo="${data.pdto.endPage+1}"
							value="&gt;" />
					</c:if></td>
			</tr>
			
			
			
			
			
			
			
			
			</table>
		</div>
</body>
</html>