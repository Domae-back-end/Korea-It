<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<script type="text/javascript">

$(function() {
	$(".pbtn").click(function(){ //페이지번호
		$("#pageIN").val($(this).attr("pagetoGo"))
		faqform.submit()
	})
})

</script>
<body>
<div id="sideBar">
	<ul>
		<li><a href="serviceHome">고객센터</a></li>
		<li><a href="serviceHome">고객센터 홈</a></li>
		<c:choose>
			<c:when test="${empty data.onesfdto.persid }">
				<li><a href="../../member/login/loginForm">상담내역 확인</a></li>
			</c:when>
			<c:otherwise>
				<li><a href="serviceHistory">상담내역 확인</a></li>
			</c:otherwise>
		</c:choose>
		<li><a href="serviceQna">자주 묻는 질문</a></li>
		<c:choose>
			<c:when test="${empty data.onesfdto.persid }">
				<li><a href="../../member/login/loginForm">1대1 문의</a></li>
			</c:when>
			<c:otherwise>
				<li><a href="servicePersonal">1대1 문의</a></li>
			</c:otherwise>
		</c:choose>
		<li><a href="serviceNotice">공지사항</a></li>
	</ul>
</div>


<div id="content">
<!-- 
	<h2>자주묻는질문</h2>
	
	<div class="qna1">
	<form action="">
			<label for="name">자주 묻는 질문</label>
			<input type="text" id="name" class="inputText" >
			<input type="submit" value="검색" class="inputButton">
		</form>
	</div>
	
	<div class="qna2">
		<div class="qna2_top">
			<ul>
				<li>
					<button type="button">전체</button>
				</li>
				<li>
					<button type="button" >영화/예매</button>
				</li>
				<li>
					<button type="button" >가입</button>
				</li>
				<li>
					<button type="button" >영화관</button>
				</li>
				<li>
					<button type="button" >기타</button>
				</li>
			</ul>
		</div>
		
		<div class="qna2_body">
			<div class="tot">
				총 10건이 검색되었습니다.
			</div>-->
			<form action="serviceQna" name="faqform">
			<table class="table table-striped">
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
					<a href="serviceDetail?bqindex=${faqDTO.bqindex }&page=${data.pdto.page}">${faqDTO.bqtitle }</a></td>
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
		</div><!-- qna2_body -->

<div class="clear"></div>
</body>












