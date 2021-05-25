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
	
	/* 1대1문의 답변하기 */
	.detail_top {text-align: left; }
	
	.detail_cont {text-align: left; }
	
	.detail_pic {}
	
	.detail_answer { }
	
	.detail_bot {}
	
	
	
	
	.detail_top{padding: 5px 0; border-bottom: 1px solid black; background: lime;  }
	.detail_top>ul>li {text-align: left; margin: 5px 0;   }
	.detail_top>ul>li:nth-of-type(1) {font-size: 20px; font-weight: bold;  }
	
	.detail_cont {text-align: left; margin: 20px 0; background: fuchsia;   }

	.detail_bot  {text-align: left; background: teal;  }
	.detail_bot tr td:nth-of-type(1) {width: 150px; background: blue; padding: 10px 20px;  }
	.detail_bot tr td:nth-of-type(2) {width: 650px; background: red; }
	.detail_bot>table a {width: 650px; height: 40px; line-height: 40px;  display: inline-block; background: yellow; }
	
	.detail_bot>a {width: 100px; height: 50px; line-height: 50px;  background: orange; display: inline-block; text-align: center; border-radius: 10px;  }
	.detail_bot {width: 100px; margin: 20px auto; }
</style>
</head>


<body>
<h2>1대1문의 그동안 답변내역</h2>
<div class="persqnanew_tb">
	<form action="/admin/persqna/persqnadetailReg" name="frm">
		<input type="hidden" name="persindex" value="${data.now.persindex }" />
		<input type="hidden" name="page" id="pageIN" value="${data.snpdto.page}" />
		
		<div class="detail_top">
			<ul>
				<li>문의번호 [${data.now.persindex }]</li>
				<li>[${data.now.perscateKr }] ${data.now.perstitle }</li>
				<li>아이디 ${data.now.persid }</li>				
				<li>등록일 <fmt:formatDate value="${data.now.persqtime}" type="both" pattern="yyy.MM.dd"/></li>
				<li>답변상태 ${data.now.persstate }</li>	
			</ul>
		</div>
		<div class="detail_cont">
			<p>
				${data.now.perscontBr }
			</p>
			<div class="detail_pic"> <!-- 사진 불러오기(미완) -->
				${data.now.persimg }
			</div>
			
			<div class="detail_answer"> <!-- 사진 불러오기(미완) -->
				<p>
					${data.now.persacont }
				</p>
			</div>
		</div>
		<div class="detail_bot">
			<a href="persqnahistory?page=${data.npDTO.page}">메인으로</a>
		</div>
		
		

		
			
	</form>
</div>
</body>
</html>