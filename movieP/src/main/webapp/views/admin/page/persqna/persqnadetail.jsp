<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1대1문의 답변할거야</title>
<style>
	* {padding: 0px; margin: 0px; }
	ul, li {text-decoration: none; list-style: none; }
	a {text-decoration: none; }
	
	/* 1대1문의 답변하기 */
	.detail_top {text-align: left; }
	
	.detail_cont {text-align: left; }
	
	.detail_pic {border-top: 1px solid black; border-bottom: 1px solid black; }
	
	.detail_answer textarea {width: 800px; height: 400px; }
	
	
	.detail_bot .sbm {width: 100px; height: 60px; line-height: 30px; display: inline-block;
						text-align: center; border: none; border-radius: 5px; background: #dbdbdb; color: black; }
	
	.detail_top{padding: 5px 0; border-bottom: 1px solid black; background: #f7f8f9;  }
	.detail_top>ul>li {text-align: left; margin: 5px 0; padding-left: 5px;   }
	.detail_top>ul>li:nth-of-type(1) {font-size: 20px; font-weight: bold;  }
	.detail_top>ul>li:nth-of-type(2) {font-size: 25px; font-weight: bold;  }
	
	.detail_cont {text-align: left; margin: 20px 0; padding-left: 5px; }
	
	.detail_bot>.sbm {width: 100px; height: 50px; line-height: 50px; background: #dbdbdb; display: inline-block;
					 text-align: center; border-radius: 10px;  }
	.detail_bot {width: 850px; margin: 20px auto; height: 200px; }
</style>
</head>


<body>
<h2>1대1문의 답변할거야</h2>
<div class="persqnanew_tb">
	<form action="/admin/persqna/persqnadetailReg" name="frm">
		<input type="hidden" name="persindex" value="${data.now.persindex }" />
		<input type="hidden" name="page" id="pageIN" value="${data.snpdto.page}" />
		
		<div class="detail_top">
			<ul>
				<li>문의번호 [${data.now.persindex }]</li>
				<li>[${data.now.perscateKr }] ${data.now.perstitle }</li>
				<li>아이디 -  ${data.now.persid }</li>				
				<li>등록일 -  <fmt:formatDate value="${data.now.persqtime}" type="both" pattern="yyy.MM.dd"/></li>
				<li>답변상태 -  ${data.now.persstate }</li>	
			</ul>
		</div>
		<div class="detail_cont">
			<p>
				${data.now.perscontBr }
			</p>
			<div class="detail_pic">
				<c:if test="${data.now.persimg != null}">
					<img src='<c:url value="../../views/user/img/persupload/${data.now.persimg }" />' alt="" />
				</c:if>
			</div>
			
			<div class="detail_answer">
				<textarea name="persacont" cols="50" rows="5" id="contG"></textarea>
			</div>
		</div>
		<div class="detail_bot">
			<input type="submit" value="등록" class="sbm"/>
			<a href="persqnanew?page=${data.npDTO.page}" class="sbm">메인으로</a>
		</div>
		
		

		
			
	</form>
</div>
</body>
</html>