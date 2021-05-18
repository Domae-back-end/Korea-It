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
        <th>영화제목</th>
        <th>감독명</th>
            <th>개봉일</th>
        <th>배우</th>
            <th>카테고리</th>
                <th>포스터</th>
      </tr>
    </thead>
    <tbody>
<c:forEach var="i" items="${data.movielist }" >
      <tr>
        <%-- <td>${i }체크박스</td> --%>
        <td><a href="midetail?mid=${i.m_index}">${i.movietitle }</a></td>
        <td>${i.mdir }&nbsp; </td>
         <td>${i.mdate }</td>
         
        <td>${i.mactrs }</td>
         <td>${i.mcate }</td>
         <td><img src='<c:url value="/${i.posterUrl }"/>' alt="안보여" style="width: 40px;height:60px;" /></td>
         
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