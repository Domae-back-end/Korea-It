<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<body>
매출
데이터 출력화면

${data} 

	  <table class="table table-striped">
    <thead>
      <tr>
        <th>체크박스</th>
        <th>대분류</th>
            <th>소분류</th>
        <th>상품명/영화명</th>
            <th>액수</th>
                <th>수량</th>
      </tr>
    </thead>
    <tbody>
<c:forEach var="i"   begin="0" end="10">
      <tr>
        <td>${i }체크박스</td>
        <td>${i }대분류</td>
        <td>${i }소분류</td>
         <td>${i }상품/영화명</td>
         
        <td>${i }액수</td>
         <td>${i }수량</td>
      </tr>
   
</c:forEach>
    </tbody>
  </table>