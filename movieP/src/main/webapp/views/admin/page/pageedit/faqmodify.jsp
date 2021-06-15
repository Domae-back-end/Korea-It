<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자찾질수정</title>
</head>
<body>
<h1>자찾질 수정</h1>
<form action="/admin/pageedit/faqmodifyReg" method="post">
<input type="hidden" name="bqindex" value="${data.sfDTO.bqindex }">
<input type="hidden" name="page" value="${data.npDTO.page }">
			질문카테고리 
			<select name="bqcate">
				<option>${data.sfDTO.bqcate }</option>
				<option value="영화/예매"> 영화/예매 </option>
				<option value="가입"> 가입  </option>
				<option value="영화관"> 영화관 </option>
				<option value="기타"> 기타   </option>
			</select>
			<br>
			질문 제목 <input type="text" name="bqtitle" value="${data.sfDTO.bqtitle }"/>
			<br>
			질문 내용 <textarea name="bqcont" rows="5" cols="30">${data.sfDTO.bqcont }</textarea>
			
<input type="submit" value="수정하기"/>
<a href="faqdetail?bqindex=${data.sfDTO.bqindex}&page=${data.npDTO.page}">뒤로</a>
</form>
</body>
</html>