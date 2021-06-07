<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script>


$(function() {
	$(".pagebtn").click(function(){ //페이지번호
		alert("눌렀냐?"+$(this).attr("pageval"))
		$("#pageIN").val($(this).attr("pageval"))
		SLform.submit()
	})
	
})



</script>

<body>
매출
데이터 출력화면

데이터 있냐:${not empty data.salist}  ${data.sadto.salesckind} 

<form action=""  name= "SLform">


<input type="hidden" name="page" id="pageIN" value="${data.pdto.page}" />
	<select name="salesckind">
		<option value=""   >전체  </option>
		<option value="userid"   >아이디별  </option>
		<option value="movietitle"> 제목별 </option>
		<option value="sectorNo"> 관별</option>
	
	</select>
	
	<input type="text" name="salescword" />
	
	
	
	
	<input type="submit" value="검색" />


	  <table class="table table-striped">
    <thead>
      <tr>
        <th>매출번호</th>
        <th>고객id</th>
        <th>예매고유번호</th>
            <th>매출액</th>
            
        <th>상품명/영화명</th>
         <th>사용관정보</th>
         
                <th>거래유형</th>
                <th>시간</th>
      </tr>
    </thead>
    <tbody>
<c:forEach var="i"   items="${data.salist }">
      <tr>
        <td>${i.sales_index }</td>
          <td>${i.userid }</td>
        <td>${i.ticket_index }</td>
        <td>${i.salesprice }</td>
         <td>${i.movietitle }</td>
         <td>${i.sectorNo }</td>       
         <td>${i.sales_type }</td>
          <td>
          	<fmt:formatDate value="${i.sales_time }" type="both"
							pattern="yyy년MM월dd일  HH:mm:ss" />
          
          </td>
      </tr>
</c:forEach>

	<tr>
	<td colspan="8" align="center">
					
						<c:if test="${data.pdto.startPage > 1 }">
							<input type="button" class="pagebtn btn btn-warning" pageval="${data.pdto.startPage-1 }" value="&lt" />	
						</c:if>
						
						<c:forEach begin="${data.pdto.startPage }" end="${data.pdto.endPage }" step="1" var="i">
							<c:choose>
								<c:when test="${i==data.pdto.page }">
									<span class="btn btn-success">${i }</span>
								</c:when>
								<c:otherwise>
									<input type="button" class="pagebtn btn btn-warning" pageval="${i }" value="${i }" />
								</c:otherwise>
							</c:choose>
						</c:forEach>
						
						<c:if test="${data.pdto.endPage < data.pdto.total }">
							<input type="button" class="pagebtn btn btn-warning" pageval="${data.pdto.endPage+1 }" value="&gt" />
						</c:if>
					
					
	
	
	
	
	</tr>


    </tbody>    
   
    
    
    
  </table></form>
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  