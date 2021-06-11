<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 메인페이지</title>
<style>
.adminmainbox {width: 500px; height: 333px;  padding: 0px; background: white;  }

.table_base {width: 466px; border: none; }
.table_base tr:not(:first-child)>td:nth-of-type(1) {width: 60px; }
.table_base tr:not(:first-child) td { display: inline-block; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;}
.table_base tr>td:nth-of-type(2) {width: 100px; }
.table_base tr>td:nth-of-type(3) {width: 206px; }
.table_base tr>td:nth-of-type(4) {width: 100px; }


</style>
</head>





<div class="row mb-5">
	<div class="col-md-6 adminmainbox mx-0">
		<div class="card flex-md-row mb-4 box-shadow h-md-250">
			<div class="card-body d-flex flex-column align-items-start">
				<strong class="d-inline-block mb-2 text-primary">새 고객문의</strong>
				<table class="table table-striped table_base">
					<tr>
						<td colspan="4" align="right">
							<a href="admin/persqna/persqnanew">더보기</a>
						</td>
					</tr>
					<tr>
						<td>번호</td>
						<td>문의유형</td>
						<td>제목</td>
						<td>등록일</td>
					</tr>
				<c:forEach items="${data.persview }" var="persDTO" varStatus="no">
					<tr id="${persDTO.persindex }">
						<td>${no.index+1 }</td>
						<td>${persDTO.perscateKr }</td>
						<td>
							<a href="admin/persqna/persqnadetail?page=${data.snpdto.page}&persindex=${persDTO.persindex }">${persDTO.perstitle }</a>
						</td>
						<td>
							<fmt:formatDate value="${persDTO.persqtime}" type="both" pattern="yyy.MM.dd"/>
						</td>
					</tr>
				</c:forEach>
				</table>
			</div>
		</div>
	</div>


	<div class="col-md-6 mx-0 adminmainbox">
		<div class="card flex-md-row mb-4 box-shadow h-md-250">
			<div class="card-body d-flex flex-column align-items-start">
				<strong class="d-inline-block px-0 mb-2 text-success">최근 매출액</strong>
				<!-- 인호님파트 -->
				<%-- <table class="table table-striped table_base">
					<tr>
						<td colspan="4" align="right">
							<a href="admin/persqna/persqnanew">더보기</a>
						</td>
					</tr>
					<tr>
						<td>번호</td>
						<td>문의유형</td>
						<td>제목</td>
						<td>등록일</td>
					</tr>
				<c:forEach items="${data.persview }" var="persDTO" varStatus="no">
					<tr id="${persDTO.persindex }">
						<td>${no.index+1 }</td>
						<td>${persDTO.perscateKr }</td>
						<td>
							<a href="admin/persqna/persqnadetail?page=${data.snpdto.page}&persindex=${persDTO.persindex }">${persDTO.perstitle }</a>
						</td>
						<td>
							<fmt:formatDate value="${persDTO.persqtime}" type="both" pattern="yyy.MM.dd"/>
						</td>
					</tr>
				</c:forEach>
				</table> --%>
			</div>
		</div>
	</div>
</div>



<div class="row mb-2">
	<div class="col-md-6 mx-0  adminmainbox">
		<div class="card flex-md-row mb-4 box-shadow h-md-250">
			<div class="card-body d-flex flex-column align-items-start">
				<strong class="d-inline-block mb-2 text-primary">자주 본 FAQ</strong>
				<table class="table table-striped table_base">
					<tr>
						<td colspan="4" align="right">
							<a href="admin/pageedit/faqlist">더보기</a>
						</td>
					</tr>
					<tr>
						<td>번호</td>
						<td>분류</td>
						<td>제목</td>
						<td>조회수</td>
					</tr>
				<c:forEach items="${data.sfview }" var="faqDTO" varStatus="no">
					<tr id="${faqDTO.bqindex }">
						<td>${no.index+1 }</td>
						<td>${faqDTO.bqcate }</td>
						<td>
							<a href="admin/pageedit/faqdetail?bqindex=${faqDTO.bqindex }&page=${data.pdto.page}">${faqDTO.bqtitle }</a>
						</td>
						<td>${faqDTO.viewcnt }</td>
					</tr>
				</c:forEach>
				</table>
			</div>
		</div>
	</div>


	<div class="col-md-6  mx-0  adminmainbox">
		<div class="card flex-md-row mb-4 box-shadow h-md-250">
			<div class="card-body d-flex flex-column align-items-start">
				<strong class="d-inline-block mb-2 text-success">공지사항</strong>
				<table class="table table-striped table_base">
					<tr>
						<td colspan="4" align="right">
							<a href="admin/pageedit/noticelist">더보기</a>
						</td>
					</tr>
					<tr>
						<td>번호</td>
						<td>구분</td>
						<td>제목</td>
						<td>조회수</td>
					</tr>
				<c:forEach items="${data.notiview }" var="notiDTO" varStatus="no">
					<tr id="${notiDTO.noticeindex }">
						<td>${no.index+1 }</td>
						<td>${notiDTO.noticecateKr }</td>
						<td>
							<a href="admin/pageedit/noticedetail?page=${data.snpdto.page}&noticeindex=${notiDTO.noticeindex }">${notiDTO.noticetitle }</a>
						</td>
						<td>${notiDTO.noticeview}</td>
					</tr>
				</c:forEach>
				</table>
			</div>
		</div>
	</div>
</div>

</html>