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
	.clear {clear: both; }
	
	.notice_modi {background: yellow; }
	
</style>

<title>asdf</title>
</head>

<script>
	
	
	
	
	
</script>

<body>
<h2>수정페이지</h2>

<div class="notice_tb">
	<div class="notice_modi">
		<form action="noticemodifyReg"><!-- 여기서 reg? -->
		<input type="hidden" name="noticeindex" value="${data.now.noticeindex }" />
		<input type="hidden" name="page" value="${data.npDTO.page }" />
			<table>
				<tr>
					<td>구분</td>
					<td>
						<select name="noticecate">
							<option value="system" <c:if test="${data.now.noticecate == 'system' }"> selected="selected"</c:if>>시스템</option>
							<option value="movie" <c:if test="${data.now.noticecate == 'movie' }"> selected="selected"</c:if>>영화관</option>
							<option value="etc" <c:if test="${data.now.noticecate == 'etc' }"> selected="selected"</c:if>>기타</option>
						</select>
					</td>
				</tr>
				<tr>
					<td><label for="titleG">제목*</label></td>
					<td><input type="text" name="noticetitle" id="titleG" class="title" value="${data.now.noticetitle }"/></td>
				</tr>
				<tr>
					<td><label for="contG">내용*</label></td>
					<td><textarea name="noticecont" cols="30" rows="5" id="contG">${data.now.noticecont }</textarea></td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center;">
						<input type="submit" value="수정" class="sbm"/>
						<a href="noticelist?page=${data.npDTO.page }">메인으로</a><!-- ${data} -->
					</td>
				</tr>
			</table>
		</form>
	</div>
</div> 
<div class="clear"></div>

		
</body>
</html>