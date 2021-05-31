<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.model.MovieInfoDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.model.DbMapper"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<style>
#movieinfomation{
 	border: 1px solid #aaa;
 	border-radius: 20px;
 	box-shadow: 10px 10px 10px 10px gray;
 }
</style>
 <c:forEach items="${moviedataafter }" var="mm" varStatus="no">
   <table id="movieinfomation">
      <tr><td>${no.index +1}</td></tr>
      <tr>
      <td id="pos">
      <a href = "/user/movie/moviedetail?sub=info&ind=${mm.m_index}">
      <img alt ="" src= "/moviedata/${mm.movieimg}">
      </a>
      </td></tr>
      <tr><td>${mm.movietitle }</td></tr>
      <tr>
        <td>평점: ${mm.star }
         <div > <a href="javascript:likeGo(${mm.m_index})">좋아요 ${mm.mlike }</a></div>
      </td>
      </tr>
      <tr>
      	<td><a href ="/user/movietime/list?movietitle=${mm.movietitle }" /> 예매하기</a>
      	</td>
      </tr>
   </table>
 </c:forEach>
