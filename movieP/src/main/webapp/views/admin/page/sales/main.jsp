<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script>


$(function() {
	
	var start = $("#starttime").val();
	var end = $("#endtime").val();
	$(".pagebtn").click(function(){ //페이지이동.
		alert("눌렀냐?"+$(this).attr("pageval"))
		$("#pageIN").val($(this).attr("pageval"))
		
		console.log($("#starttime").val()+"rr")
		console.log($("#endtime").val() )
		console.log($("#endtime").val()=="")
		if($("#starttime").val()===''&&$("#endtime").val()!=''){
			alert("기간정보를 하나 더 입력해 주세요")
		}
		else if($("#endtime").val()===''&&$("#starttime").val()!=''){// 논리연산자활용..
			alert("기간정보를 하나 더 입력해 주세요")
		}else{
		
		SLform.submit()
		}
		})
	
	
	$("#searchBtn").click(function(){
		alert("검색버튼.")		
		console.log($("#starttime").val()+"rr")
		console.log($("#endtime").val() )
		console.log($("#endtime").val()=="")
		if($("#starttime").val()===''&&$("#endtime").val()!=''){
			alert("기간정보를 하나 더 입력해 주세요")
		}
		else if($("#endtime").val()===''&&$("#starttime").val()!=''){
			alert("기간정보를 하나 더 입력해 주세요")
		}else{
		
		$("#pageIN").val(1)
		SLform.submit()
		}
		
		
		
	})
	
	
	
	
	
	
	
	
	
})


//data.salist  data.pdto  data.sadto
</script>

<body>
데이터 있냐:${not empty data.salist}  ${data.sadto.salesckind} 

<form action=""  name= "SLform">


<input type="hidden" name="page" id="pageIN" value="${data.pdto.page}" />


	<span>기간 
		<input type="date" name="starttime"  id="starttime"
		<c:if test="${not empty data.sadto.starttime}">  value="${data.sadto.starttime}"  </c:if>
		
		></input>
		
		  ~  	
		
		
		<input type="date" name="endtime" id="endtime"
		<c:if test="${not empty data.sadto.endtime}">  value="${data.sadto.endtime}" </c:if>
		></input>  </span>


	<select name="salesckind">
		<option value="" 
		 <c:if test="${data.sadto.salesckind == '' }"> selected="selected"</c:if>
		 >카테고리  </option>
		<option value="userid"
		<c:if test="${data.sadto.salesckind == 'userid' }"> selected="selected"</c:if>
		   >아이디별  </option>
		<option value="movietitle"
		<c:if test="${data.sadto.salesckind == 'movietitle' }"> selected="selected"</c:if>
		> 제목별 </option>
		<option value="sectorNo"
		<c:if test="${data.sadto.salesckind == 'sectorNo' }"> selected="selected"</c:if>
		> 관별</option>
	
	</select>
	
	<input type="text" name="salescword" value="${data.sadto.salescword}"  />
	
<input id="searchBtn" type="button" value="검색"  /> 
	<!-- <button type="button" id="searchBtn" >검색</button> -->
	<!-- 버튼으로 처리하는게 어떨까 .  -->
	
	


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
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  