<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ_Detail</title>
</head>
<body>
<h1>FAQ_Detail</h1>
<form action="/admin/pageedit/faqdetailReg" method="post">
<input type="hidden" name="bqindex" value="${data.bqindex }">
<input type="hidden" name="page" value="${data.bqindex }">
	<table class="table table-striped">
		<tr>
			<td>카테고리</td>
			<td>조회수</td>
			<td>제목</td>
			<td>내용</td>
		</tr>
		<tr>
			<td>${data.bqcate }</td>
			<td>${data.viewcnt }</td>
			<td>${data.bqtitle }</td>
			<td>${data.bqcont }</td>
		</tr>
		<tr>
			<td colspan="4" align="right">
				<a href="faqmodify?bqindex=${data.bqindex}">수정</a>
				<a href="faqdeleteReg?bqindex=${data.bqindex}">삭제</a>
			</td>
		</tr>
	</table>
</form>
</body>
</html>