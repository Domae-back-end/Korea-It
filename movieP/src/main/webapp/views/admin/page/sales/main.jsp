<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<body>
매출
데이터 출력화면

데이터 있냐:${not empty data} 

<form action="SearchReg">
	아이디 <input type="text" name="userid" />
	<input type="submit" value="검색" />
</form>

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
<c:forEach var="i"   items="${data }">
      <tr>
        <td>${i.sales_index }</td>
          <td>${i.userid }</td>
        <td>${i.ticket_index }</td>
        <td>${i.salesprice }</td>
         <td>${i.movietitle }</td>
         <td>${i.moviesector }</td>
       
         <td>${i.sales_type }</td>
          <td>${i.sales_time }</td>
      </tr>
   
</c:forEach>
    </tbody>
  </table>