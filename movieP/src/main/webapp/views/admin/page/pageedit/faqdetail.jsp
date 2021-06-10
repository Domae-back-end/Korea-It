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
		frm.action="faqmodify"
		frm.submit()
}
</script>
</head>
<body>
<h1>FAQ_Detail</h1>
<form action="/admin/pageedit/faqdetail" method="post" name="frm">
<input type="hidden" name="bqindex" value="${data.bqindex }">
<input type="hidden" name="pageIN" value="${pdto.page }">
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
				<input type="button" onclick="modifyGo()" value="수정" />
				<input type="button" onclick="deleteGo()" value="삭제" />
				<a href="faqlist?bqindex=${data.bqindex}&pageIN=${param.page}">뒤로</a>
			</td>
		</tr>
	</table>
</form>
</body>
