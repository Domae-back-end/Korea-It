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
				<td colspan="2" style="text-align: center;">
					<input type="submit" value="등록" class="sbm"/>
					<a href="noticelist?page=${data.snpdto.page }">뒤로가기</a>
				</td>
			</tr>
		</table>
			
			
			
			
			
	</form>
</div>
</body>
</html>