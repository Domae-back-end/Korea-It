<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<title>FAQ_Detail</title>
<script>
function deleteGo(){
	if(confirm("정말로 삭제하시겠습니까?")){
		frm.action="faqdeleteReg"
		frm.submit()
	}
}

function modifyGo(){
		frm.action="faqmodify?bqindex=${data.sfDTO.bqindex}&page=${data.npDTO.page}"
		frm.submit()
}
</script>
</head>
<body>
<h1>FAQ_Detail</h1>
<form action="/admin/pageedit/faqdetail" method="post" name="frm">
<input type="hidden" name="bqindex" value="${data.sfDTO.bqindex }">
<input type="hidden" name="page" value="${data.npDTO.page }">
	<table class="table table-striped">
		<tr>
			<td>ID</td>
			<td>카테고리</td>
			<td>조회수</td>
			<td>제목</td>
			<td>내용</td>
		</tr>
		<tr>
			<td>${data.sfDTO.bqindex }</td>
			<td>${data.sfDTO.bqcate }</td>
			<td>${data.sfDTO.viewcnt }</td>
			<td>${data.sfDTO.bqtitle }</td>
			<td>${data.sfDTO.bqcontbr }</td>
		</tr>
		<tr>
			<td colspan="5" align="right">
				<input type="button" onclick="modifyGo()" value="수정" />
				<input type="button" onclick="deleteGo()" value="삭제" />
				<a href="faqlist?bqindex=${data.sfDTO.bqindex}&page=${data.npDTO.page}">뒤로</a>
			</td>
		</tr>
	</table>
</form>
</body>
