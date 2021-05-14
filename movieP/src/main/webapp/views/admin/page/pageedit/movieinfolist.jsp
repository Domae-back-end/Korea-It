<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>
영화정보관리리스트</h2>

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
  <tr>
        <td colspan="5"> 
        <a href="movieinfoinsert">글쓰기</a>
        
        </td>
       
      </tr>
    </tbody>
  </table>


</body>
</html>