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
	
	.qna_form_tb {text-align: left; }
	.qna_form_tb tr td:nth-of-type(1) {width: 150px; padding: 5px; background: #F2F4F5;  }
	.qna_form_tb tr td:nth-of-type(2) {width: 700px; padding: 5px; }
	.qna_form_tb select {font-size: 16px; height: 30px; width: 200px; text-align: left;  border: 1px solid #d8d9db; outline: none; }
	.qna_form_tb .title {width: 670px; font-size: 16px; height: 30px;  border: 1px solid #d8d9db; } 
	.qna_form_tb textarea {width: 670px; font-size: 16px; height: 300px; resize: vertical; border: 1px solid #d8d9db; }
	.qna_form_tb textarea:focus, .sub:focus, .title:focus, select:focus {border: 1px solid black; outline: none; }
	
	.sbm {width: 100px; height: 50px; line-height: 50px; font-size: 16px; background: #dbdbdb; color: black; 
		margin: 50px 0; text-align: center; border: none; border-radius: 5px; display: inline-block; }
	.sbm:hover {text-decoration: none; color: black;  }
</style>

<title>공지뉴스/리스트 추가</title>
</head>


<body>
<h2>공지/뉴스 게시판 추가</h2>

<div class="notice_tb">
	<!-- 구분 시스템, 영화관, 기타 -->
	
	<form action="/admin/pageedit/noticeinsertReg" method="post">
		<table class="qna_form_tb">
			<tr>
				<td>구분</td>
				<td>
					<select name="noticecate">
						<option value="system">시스템</option>
						<option value="movie">영화관</option>
						<option value="etc">기타</option>
					</select>
				</td>
			</tr>
			<tr>
				<td><label for="titleG">제목*</label></td>
				<td><input type="text" name="noticetitle" id="titleG" class="title" /></td>
			</tr>
			<tr>
				<td><label for="contG">내용*</label></td>
				<td><textarea name="noticecont" cols="30" rows="5" id="contG"></textarea></td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center; background: none; border-bottom: none; ">
					<input type="submit" value="등록" class="sbm"/>
					<a href="noticelist?page=${data}" class="sbm">메인으로</a>
				</td>
			</tr>
		</table>
			
			
			
			
			
	</form>
</div>
</body>
</html>