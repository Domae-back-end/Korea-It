<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

	.adminmainbox{
		width:260px;
		height: 300px;
		border: 1px solid #333;
		//padding: 0px;
	}


</style>


</head>





      <div class="row mb-5">
        
        
        <div class="col-md-6 adminmainbox mx-0">
          <div class="card flex-md-row mb-4 box-shadow h-md-250">
            <div class="card-body d-flex flex-column align-items-start">
              <strong class="d-inline-block mb-2 text-primary">새 고객문의</strong>
              <h3 class="mb-0">
                <a class="text-dark" href="#">새로운 고객문의</a>
              </h3>
           
           <!--    <div class="mb-1 text-muted">Nov 12</div>
              <p class="card-text mb-auto">This is a wider card with supporting text below as a natural lead-in to additional content.</p>
              <a href="#">Continue reading</a> -->
            </div>
              </div>
        </div>
       
       
        <div class="col-md-6 mx-0 adminmainbox">
          <div class="card flex-md-row mb-4 box-shadow h-md-250">
            <div class="card-body d-flex flex-column align-items-start">
              <strong class="d-inline-block px-0 mb-2 text-success">최근 매출액</strong>
              <h3 class="mb-0">
                <a class="text-dark" href="#">Post title</a>
                <h4> ${   adminmainpage_sales  }</h4>
              </h3>
             <!--  <div class="mb-1 text-muted">Nov 11</div>
              <p class="card-text mb-auto">This is a wider card with supporting text below as a natural lead-in to additional content.</p>
              <a href="#">Continue reading</a>
            </div> -->
             </div>
        </div>
      </div>
    </div>
	 <div class="row mb-2">
       
       
       
        <div class="col-md-6 mx-0  adminmainbox">
          <div class="card flex-md-row mb-4 box-shadow h-md-250">
            <div class="card-body d-flex flex-column align-items-start">
              <strong class="d-inline-block mb-2 text-primary">자주 본 FAQ</strong>
              <h3 class="mb-0">
                <a class="text-dark" href="#">view젤높은거</a>
              </h3>
              <table class="table table-striped">
              <thead>
	              <td colspan="4" align="right">
	                <a href="admin/pageedit/faqlist">더보기</a>
	              </td>
              </thead>
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
					<td style="border: 1px solid;">
					<a href="admin/pageedit/faqdetail?bqindex=${faqDTO.bqindex }&page=${data.pdto.page}">${faqDTO.bqtitle }</a></td>
					<td>${faqDTO.viewcnt }</td>
				</tr>
				<tr>
				<td colspan="3" id="${faqDTO.bqindex }" style="display: none;">${faqDTO.bqcont }</td> 
				</tr>
			</c:forEach>
			</table>
           <!--    <div class="mb-1 text-muted">Nov 12</div>
              <p class="card-text mb-auto">This is a wider card with supporting text below as a natural lead-in to additional content.</p>
              <a href="#">Continue reading</a> -->
            </div>
              </div>
        </div>
       
       
        <div class="col-md-6  mx-0  adminmainbox">
          <div class="card flex-md-row mb-4 box-shadow h-md-250">
            <div class="card-body d-flex flex-column align-items-start">
              <strong class="d-inline-block mb-2 text-success">공지사항</strong>
              <h3 class="mb-0">
                <a class="text-dark" href="#">Post title</a>
              </h3>
             <!--  <div class="mb-1 text-muted">Nov 11</div>
              <p class="card-text mb-auto">This is a wider card with supporting text below as a natural lead-in to additional content.</p>
              <a href="#">Continue reading</a>
            </div> -->
             </div>
        </div>
      </div>
    </div>

</html>