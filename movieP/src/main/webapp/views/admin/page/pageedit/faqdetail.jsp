<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ_Detail</title>
<script>
function deleteGo(){
	if(confirm("정말로 삭제하시겠습니까?")){
		frm.action="/admin/pageedit/faqdeleteReg"
		frm.submit()
	}
}

function modifyGo(){
		frm.action="faqmodify"
		frm.submit()
}
</script>
</head>
<body>
<h1>FAQ_Detail</h1>
<form action="/admin/pageedit/faqdetailReg" method="post" name="frm">
<input type="hidden" name="bqindex" value="${data.bqindex }">
<input type="hidden" name="page" value="${pdto.page }">
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
			<td>${data.bqcontbr }</td>
		</tr>
		<tr>
			<td colspan="4" align="right">
				<a href="faqmodify?bqindex=${data.bqindex }">수정</a>
				<input type="button" onclick="deleteGo()" value="삭제" />
				<a href="faqlist?bqindex=${data.bqindex}&page=${param.page}">뒤로</a>
			</td>
		</tr>
	</table>
</form>
</body>
</html>