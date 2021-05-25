<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1대1문의 그동안 답변내역</title>
</head>
<style>
	* {padding: 0px; margin: 0px; }
	ul, li {text-decoration: none; list-style: none; }
	a {text-decoration: none; }
	
	/* 공지테이블 */
	.td1 {font-size: 16px; border-top: 1px solid gray; border-bottom: 1px solid gray; border-spacing: 0; }
	.td1 tr:nth-of-type(1)>td {background: yellow; font-weight: bold; border-bottom: 1px solid gray; }
	.td1 tr:nth-of-type(1)>td:nth-of-type(1) {width: 50px;  }
	.td1 tr:nth-of-type(1)>td:nth-of-type(2) {width: 100px;  }
	.td1 tr:nth-of-type(1)>td:nth-of-type(3) {width: 350px;  }
	.td1 tr:nth-of-type(1)>td:nth-of-type(4) {width: 100px;  }
	.td1 tr:nth-of-type(1)>td:nth-of-type(5) {width: 100px;  }
	.td1 tr:nth-of-type(1)>td:nth-of-type(6) {width: 100px;  }
</style>
</head>
<script>
	$(function() {
		$(".btnnn").click(function(){ //페이지번호
			//alert("눌렀냐?"+$(this).attr("dd"))
			$("#pageIN").val($(this).attr("dd"))
			frm.submit()
		})
		
	})
	
	
	function detailGo(aa) { //디테일페이지꺼
		alert("detailGo 눌렀냐?"+aa)
		frm.action = "persqnahistorydet"
		
		$("#detailId").val(aa)
		
		alert(aa+"번으로 이동")
		frm.submit()
	}
	
</script>


<body>
<h2>1대1문의 그동안 답변내역</h2>
<div class="persqnanew_tb">
	<form action="" name="frm">
		<input type="hidden" name="page" id="pageIN" value="${data.snpdto.page}" />
		<input type="hidden" name="persindex" id="detailId" />
		
		<table class="td1">
		<!-- 번호, 문의유형(일반문의, 영화정보, 회원, 예매, 분실물, 제안/건의), 아이디, 제목, 내용, 사진, 등록일, 답변칸, 답변시간, 답변상태*/ -->
			<tr>
				<td>번호</td>
				<td>문의유형</td>
				<td>제목</td>
				<td>등록일</td>
				<td>아이디</td>
				<td>답변상태</td>
			</tr>
		<c:forEach items="${data.sfdto }" var="nsfdto" varStatus="no" >
			<tr>
				<td>${nsfdto.persindex }</td>
				<td>${nsfdto.perscateKr }</td>
				<td><a href="javascript:detailGo(${nsfdto.persindex })">${nsfdto.perstitle }</a></td>
				<td>
					<fmt:formatDate value="${nsfdto.persqtime}" type="both" pattern="yyy.MM.dd"/>					
				</td>
				<td>${nsfdto.persid }</td>
				<td>${nsfdto.persstate }</td>
			</tr>
		</c:forEach>

		
		
		
			<tr>
				<td colspan="5" align="center">
				
					<c:if test="${data.snpdto.startPage > 1 }">
						<input type="button" class="btnnn btn btn-warning" dd="${data.snpdto.startPage-1 }" value="&lt" />	
					</c:if>
					
					<c:forEach begin="${data.snpdto.startPage }" end="${data.snpdto.endPage }" step="1" var="i">
						<c:choose>
							<c:when test="${i==data.snpdto.page }">
								[${i }]
							</c:when>
							<c:otherwise>
								<input type="button" class="btnnn btn btn-warning" dd="${i }" value="${i }" />
							</c:otherwise>
						</c:choose>
					</c:forEach>
					
					<c:if test="${data.snpdto.endPage < data.snpdto.total }">
						<input type="button" class="btnnn btn btn-warning" dd="${data.snpdto.endPage+1 }" value="&gt" />
					</c:if>
				
				
				
				</td>
			</tr>
			
			
			
		</table>
	</form>
</div>
</body>
</html>