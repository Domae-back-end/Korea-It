<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
	* {padding: 0px; margin: 0px; }
	ul, li {text-decoration: none; list-style: none; }
	a {text-decoration: none; }
	
	
	
	/* FAQ 조회하기 */
	.td1 {font-size: 16px; border-top: 1px solid gray; border-bottom: 1px solid gray; border-spacing: 0; }
	.td1 tr:nth-of-type(2)>td {background: yellow; font-weight: bold; border-bottom: 1px solid gray; }
	.td1 tr:nth-of-type(2)>td:nth-of-type(1) {width: 50px;  }
	.td1 tr:nth-of-type(2)>td:nth-of-type(2) {width: 100px;  }
	.td1 tr:nth-of-type(2)>td:nth-of-type(3) {width: 430px;  }
	.td1 tr:nth-of-type(2)>td:nth-of-type(4) {width: 120px;  }
	.td1 tr:nth-of-type(2)>td:nth-of-type(5) {width: 100px;  }
	
</style>

<title>자주찾는질문관리</title>


<script type="text/javascript">

$(function() {
	$(".pbtn").click(function(){ //페이지번호
		$("#pageIN").val($(this).attr("pagetoGo"))
		faqform.submit()
	})
})

</script>

</head>


<body>
<h2>자주찾는질문관리</h2>

<div class="faqwrap " id="faqwrap">
			<!-- 구분 시스템, 영화관, 기타 -->
				<form action="faqlist" name="faqform">
				
			<table class="table table-striped">
				 <thead>
					<td colspan="5" style="text-align: right">
						<a href="faqinsert?page=${data.pdto.page}">글쓰기</a>
					</td>
				</thead>
				<tr>
					<td>번호</td>
					<td>분류</td>
					<td>제목</td>
					<td>내용</td>
					<td>조회수</td>
				</tr>
			<c:forEach items="${data.sfList }" var="faqDTO" varStatus="no">
				<tr id="${faqDTO.bqindex }">
					<td>${no.index+1 }</td>
					<td>${faqDTO.bqcate }</td>
					<td>
					<a href="faqdetail?bqindex=${faqDTO.bqindex }&page=${data.pdto.page}">${faqDTO.bqtitle }</a></td>
					<td>${faqDTO.bqcontbr }</td>
					<td>${faqDTO.viewcnt }</td>
				</tr>
				<tr>
				<td colspan="3" id="${faqDTO.bqindex }" style="display: none;">${faqDTO.bqcont }</td> 
				</tr>
			</c:forEach>

			
			
			
			<tr>
				<td colspan="5" align="center"><c:if
						test="${data.pdto.startPage > 1}">
						<%-- <a href="?page=${data.pdto.startPage-1}"> < </a> --%>

						<input type="button" class="btn pbtn"
							pagetoGo="${data.pdto.startPage-1}" value="&lt;" />
					</c:if> <c:forEach begin="${data.pdto.startPage}"
						end="${data.pdto.endPage }" step="1" var="i">
						<c:choose>
							<c:when test="${i==data.pdto.page }">
						[${i }]
					</c:when>
							<c:otherwise>
								<input type="button" class="btn pbtn" pagetoGo="${i }" value="${i }" />
								<%-- 	<a href="?page=${i }">${i }</a>	 --%>
							</c:otherwise>
						</c:choose>

					</c:forEach> <c:if test="${data.pdto.endPage < data.pdto.total}">
						<%-- <a href="?page=${data.pdto.endPage+1}&cnt=${data.bdto.cnt}"> > </a> --%>
						<input type="button" class="btn pbtn" pagetoGo="${data.pdto.endPage+1}"
							value="&gt;" />
					</c:if></td>
			</tr>
			
			<tr>
				<td colspan="5" align="center">
				
					<select name="kind">
						<option value="bqtitle" <c:if test="${data.sfdto.kind=='bqtitle' }">selected="selected"</c:if> >제목</option>
						<option value="bqcate"<c:if test="${data.sfdto.kind=='bqcate' }">selected="selected"</c:if> >카테고리</option>
					</select>	
					<input type="text" name="searchfaq" value="${data.sfdto.searchfaq }"/>
					<input type="submit" value="검색"/>
					
				</td>
			</tr>
			
			</table>
			<input type="hidden" name="page" value="1" id="pageIN" />
		</form>
		</div>
</body>