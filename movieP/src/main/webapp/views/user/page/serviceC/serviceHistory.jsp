<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상담내역 확인</title>
<style>
	* {padding: 0px; margin: 0px; font-size: 16px;  }
	ul, li {text-decoration: none; list-style: none; }
	a {text-decoration: none; color: black; }
	a:hover {text-decoration: none; }
	
	#sideBar {width: 170px; height: 500px; float: left; position: relative; }
	#content {width: 800px; position: relative; float: left; left: 30px;  }
	.clear {clear: both; }
	
	h2 {text-align: left; font-size: 28px; margin-bottom: 30px; }
	
	#sideBar ul li:nth-of-type(1) {height: 100px; line-height: 100px; background: #444; border: 1px solid #444; border-radius: 10px 10px 0 0; }
	#sideBar ul li:nth-of-type(1) a {font-size: 20px; height: 100px; color: white; }
	#sideBar ul li {width: 170px; height: 60px; background: #F2F4F5; line-height: 60px; display: inline-block; box-sizing: border-box; border: 1px solid #d8d9db; }
	#sideBar ul li a {width: 170px; height: 60px; display: inline-block;}
	#sideBar ul li:last-child {border-radius: 0 0 10px 10px; }
	#sideBar ul li:nth-of-type(3) {background: white; }
	
	
	
	
	.td1 {font-size: 16px; border-top: 1px solid gray;  border-spacing: 0; margin-bottom: 30px;  }
	.td1 tr:first-of-type>td {background: #f2f4f5; font-weight: bold; height: 50px;  }
	.td1 tr td {border-bottom: 1px solid #eaeaea; height: 65px; }
	.td1 tr:first-of-type>td:nth-of-type(1) {width: 50px;  }
	.td1 tr:first-of-type>td:nth-of-type(2) {width: 100px;  }
	.td1 tr:first-of-type>td:nth-of-type(3) {width: 430px; }
	.td1 tr>td:nth-of-type(3) {text-align: left; }
	.td1 tr:first-of-type>td:nth-of-type(4) {width: 120px;  }
	.td1 tr:first-of-type>td:nth-of-type(5) {width: 100px;  }
	p {margin: 5px 0;  }
	.td1 a:hover {text-decoration: underline; color: #8a8a8a; }
	
	.td1 tr:last-child td{border-bottom: none;   }
	
	/* 검색 (총갯수) */
	.search_result {text-align: left; }
	.search_result p {font-size: 14px; }
	.search_result span {font-weight: bold; }
	
	/* 페이지버튼 */
	.pagebtn {width: 32px; height: 32px; box-sizing: border-box; border-radius: 4px; border: 1px solid #dbdbdb; background: white;   }
	.pagebtn:hover {border: 1px solid black; background: white; }
	.pagebtn_sel {background: rgb(220,220,220); width: 32px; height: 32px; box-sizing: border-box; border-radius: 4px; border: none;  }
	.pagebtn_lr {background: rgb(241,240,245)}
	
	
</style>
<script>
	$(function() {
		//alert("안녕");
		$(".btnnn").click(function(){
			//alert("눌렀냐?"+$(this).attr("dd"))
			$("#pageIN").val($(this).attr("dd"))
			frm.submit()
		})
		
	})
	
	function detailGo(aa) {
		//alert("detailGo 눌렀냐?"+aa)
		frm.action = "serviceHistoryDetail"
		$("#detailId").val(aa)
		alert(aa+"번으로 이동")
		frm.submit()
	}
	
</script>
</head>

<body>
<div id="sideBar">
	<ul>
		<li><a href="serviceHome">고객센터</a></li>
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
		<c:choose>
			<c:when test="${empty data.onesfdto.persid }">
				<li><a href="../../member/login/loginForm">1대1 문의</a></li>
			</c:when>
			<c:otherwise>
				<li><a href="servicePersonal">1대1 문의</a></li>
			</c:otherwise>
		</c:choose>
		<li><a href="serviceNotice">공지사항</a></li>
	</ul>
</div>

<div id="content">
	<h2>상담내역 확인</h2>
		
	<div class="search_result">
		<p>총 <span>${data.snpdto.ttt }</span> 건이 검색되었습니다.</p>
	</div>
		
	<div>
		<form action="" name="frm">
		<input type="hidden" name="page" id="pageIN" value="${data.snpdto.page}" />
		<input type="hidden" name="persindex" id="detailId" />
		<table class="td1" >
			<tr>
				<td>번호</td>
				<td>카테고리</td>
				<td>제목</td>
				<td>등록일</td>
				<td>상태</td>
			</tr>
		<c:forEach items="${data.sfdto }" var="sfDTO" varStatus="no" >
			<tr>
				<td>${sfDTO.persindex }</td>
				<td>${sfDTO.perscateKr }</td>
				<td>
					<a href="javascript:detailGo(${sfDTO.persindex })">${sfDTO.perstitle }</a>
				</td>
				<td>					
					<fmt:formatDate value="${sfDTO.persqtime}" type="both" pattern="yyy.MM.dd"/>					
				</td>
				<td>
					<p><fmt:formatDate value="${sfDTO.persatime }" type="both" pattern="yyy.MM.dd"/></p>
					<p>${sfDTO.persstate }</p>
				</td>
			</tr>
		</c:forEach>
		
		
		
			<tr>
				<td colspan="5" align="center">
				
					<c:if test="${data.snpdto.startPage > 1 }">
						<input type="button" class="btnnn pagebtn pagebtn_lr" dd="${data.snpdto.startPage-1 }" value="&lt" />	
					</c:if>
					
					<c:forEach begin="${data.snpdto.startPage }" end="${data.snpdto.endPage }" step="1" var="i">
						<c:choose>
							<c:when test="${i==data.snpdto.page }">
								<input type="button" class="btnnn pagebtn_sel" dd="${i }" value="${i }" />
							</c:when>
							<c:otherwise>
								<input type="button" class="btnnn pagebtn" dd="${i }" value="${i }" />
							</c:otherwise>
						</c:choose>
					</c:forEach>
					
					<c:if test="${data.snpdto.endPage < data.snpdto.total }">
						<input type="button" class="btnnn pagebtn pagebtn_lr" dd="${data.snpdto.endPage+1 }" value="&gt" />
					</c:if>
				
				
				
				</td>
			</tr>
		
		
		
		
		
		
		
		
		
		</table>
		</form>
	</div>
</div>

<div class="clear"></div>
</body>
</html>











