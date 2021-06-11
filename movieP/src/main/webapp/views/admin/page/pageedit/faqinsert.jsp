<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자찾질글쓰기</title>
</head>
<body>
<h1>자찾질 글쓰기</h1>
<form action="/admin/pageedit/faqinsertReg" method="post">
<input type="hidden" name="page" value="${data.npDTO.page }">
			질문카테고리 
			<select name="bqcate">
				<option value="영화/예매"> 영화/예매    </option>
				<option value="가입"> 가입  </option>
				<option value="영화관"> 영화관    </option>
				<option value="기타"> 기타   </option>
			</select>
			<br>
			질문 제목 <input type="text" name="bqtitle" />
			<br>
			질문 내용 <textarea name="bqcont" rows="5" cols="30"></textarea>
			
<input type="submit" value="등록하기"/>
<a href="faqlist?page=${data.npDTO.page}">뒤로</a>
</form>



</body>
</html>