<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<style>
	* {padding: 0px; margin: 0px; font-size: 16px;  }
	ul, li {text-decoration: none; list-style: none; }
	a {text-decoration: none; color: black; }
	a:hover {text-decoration: none; color: black; }
	
	#sideBar {width: 170px; height: 500px; float: left; position: relative; }
	#content {width: 800px; position: relative; float: left; left: 30px;  }
	.clear {clear: both; }
	
	h2 {text-align: left; font-size: 28px; margin-bottom: 30px; }
	
	#sideBar ul li:nth-of-type(1) {height: 100px; line-height: 100px; background: #444; border: 1px solid #444; border-radius: 10px 10px 0 0; }
	#sideBar ul li:nth-of-type(1) a {font-size: 20px; height: 100px; color: white; }
	#sideBar ul li {width: 170px; height: 60px; background: #F2F4F5; line-height: 60px; display: inline-block; box-sizing: border-box; border: 1px solid #d8d9db; }
	#sideBar ul li a {width: 170px; height: 60px; display: inline-block;}
	#sideBar ul li:last-child {border-radius: 0 0 10px 10px; }
	#sideBar ul li:nth-of-type(6) {background: white; }
	
	
	
	/* 공지테이블 */
	.td1 {font-size: 16px; border-top: 1px solid gray;  border-spacing: 0; margin-bottom: 30px;  }
	.td1 tr:first-of-type>td {background: #f2f4f5; font-weight: bold; height: 50px;  }
	.td1 tr td {border-bottom: 1px solid #eaeaea; height: 40px; }
	.td1 tr:first-of-type>td:nth-of-type(1) {width: 50px;  }
	.td1 tr:first-of-type>td:nth-of-type(2) {width: 100px;  }
	.td1 tr:first-of-type>td:nth-of-type(3) {width: 430px; }
	.td1 tr>td:nth-of-type(3) {text-align: left; }
	.td1 tr:first-of-type>td:nth-of-type(4) {width: 120px;  }
	.td1 tr:first-of-type>td:nth-of-type(5) {width: 100px;  }
	.td1 tr>td span {width: 425px; display: inline-block; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; height: 20px; }
	.td1 tr>td span:hover {font-weight: bold; color: #444; text-decoration: underline;}
	
	p {margin: 5px 0;  }
	.td1 a:hover {text-decoration: underline; color: #8a8a8a; }
	.td1 tr:last-child td{border-bottom: none; height: 150px;   }

	/* 카테고리 */
	.notice_cate {width: 800px; height: 40px; text-align: left; margin-bottom: 20px; border-bottom: 1px solid #d8d9db; }
	.notice_cate ul li {float: left; margin-left: -1px; }
	.notice_cate a {width: 120px; height: 40px; display: inline-block; line-height: 40px; text-align: center;
					border: 1px solid #d8d9db; box-sizing: border-box;}
	.notice_cate_sel {background: #d8d9db; font-weight: bold; }
	
	
	/* 검색 search */
	.search {width: 500px; height: 40px;  margin-left: 300px; position: relative;}
	.search>.search_reset {width: 60px; height: 38px; display: inline-block; position: absolute; left: 90px; line-height: 38px; border-radius: 5px; 
							border: 1px solid #d8d9db;  }
	.search>select {font-size: 16px; width: 80px; height: 38px; text-align: left;  border: 1px solid #d8d9db; outline: none; margin-left: 130px; border-radius: 5px;  }
	.search>.inputText {font-size: 16px; width: 200px; height: 38px; border: 1px solid #d8d9db; outline: none; padding: 5px; margin-left: 10px; 
						border-radius: 5px 0 0 5px;   }
	.search>.inputButton {font-size: 16px; width: 40px; height: 38px; background-image: url("../../views/user/img/service/search.png"); border: 1px solid #d8d9db;
							position: absolute; left: 460px;  border-left: none; border-radius: 0 5px 5px 0;   }
	
	/* 검색 (총갯수) */
	.search_result {text-align: left; }
	.search_result p {font-size: 14px; }
	.search_result span {font-weight: bold; }
	
	/* 페이지버튼 */
	.pagebtn {width: 32px; height: 32px; box-sizing: border-box; border-radius: 4px; border: 1px solid #dbdbdb; background: white;   }
	.pagebtn:hover {border: 1px solid black; background: white; }
	.pagebtn_sel {background: rgb(220,220,220); width: 32px; height: 32px; box-sizing: border-box; border-radius: 4px; border: none; text-align: center; }
	.pagebtn_lr {background: rgb(241,240,245)}
	
</style>
<script>
	$(function() {
		//alert("안녕");
		$(".btnnn").click(function() {
			//alert("눌렀냐?"+$(this).attr("dd"))
			$("#pageIN").val($(this).attr("dd"))
			frm.submit()
		})

		$(".smtGo").click(function() {
			$("#pageIN").val("1")
			frm.submit()
		})
	})

	function detailGo(aa) {
		//alert("detailGo 눌렀냐?"+aa)
		frm.action = "serviceNoticeDetail"
		$("#detailId").val(aa)
		alert(aa + "번으로 이동")
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
	<h2>공지사항</h2>
	<form action="" name="frm">
		<input type="hidden" name="page" id="pageIN" value="${data.snpdto.page}" />
		<input type="hidden" name="noticeindex" id="detailId" />
		
		
		
		
		<div class="notice_cate">
			<ul>
				<li><a href="serviceNotice" class="
					<c:if test="${empty data.onesfdto.noticecate }">notice_cate_sel</c:if>
				">전체</a></li>
				<li><a href="?noticecate=system" class="
					<c:if test="${data.onesfdto.noticecate =='system' }">notice_cate_sel</c:if>
				">시스템</a></li>
				<li><a href="?noticecate=movie" class="
					<c:if test="${data.onesfdto.noticecate =='movie' }">notice_cate_sel</c:if>
				">영화관</a></li>
				<li><a href="?noticecate=etc" class="
					<c:if test="${data.onesfdto.noticecate =='etc' }">notice_cate_sel</c:if>
				">기타</a></li>
			</ul>
		</div>
		
		<div class="search">
		<a href="serviceNotice" class="search_reset">초기화</a>
			<select name="kind2" >
				<option value="noticetitle" <c:if test="${data.onesfdto.kind2 == 'noticetitle' }"> selected="selected"</c:if>>제목</option>
				<option value="noticecont" <c:if test="${data.onesfdto.kind2 == 'noticecont' }"> selected="selected"</c:if>>내용</option>
			</select>
			<input type="text" name="schkey" value="${data.onesfdto.schkey }" class="inputText"/> <!-- 요놈이문제 -->
			<input type="submit" value="" class="smtGo inputButton" />
		</div>
		
		
		
		<div class="search_result">
			<p>총 <span>${data.snpdto.ttt }</span>건이 검색되었습니다.</p>
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
			<c:forEach items="${data.sfdto }" var="sfDTO" varStatus="no" >
				<tr>
					<td>${sfDTO.noticeindex }</td>
					<td>${sfDTO.noticecateKr }</td>
					<td class="shotcut">
						<a href="javascript:detailGo(${sfDTO.noticeindex })"><span>${sfDTO.noticetitle }</span></a>
					</td>
					<td>					
						<fmt:formatDate value="${sfDTO.noticetime}" type="both" pattern="yyy.MM.dd"/>					
					</td>
					<td>${sfDTO.noticeview }</td>
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
									<input type="text" class="pagebtn_sel" dd="${i }" value="${i }" readonly/>
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
		</div>
	</form>
</div>

<div class="clear"></div>
</body>
</html>