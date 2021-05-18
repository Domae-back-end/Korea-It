<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.model.MovieInfoDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.model.DbMapper"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

 <c:forEach items="${moviedatabefore }" var="mm" varStatus="no">
   <table border="">
      <tr><td>${no.index +1}</td></tr>
      <tr>
      <td id="pos">
      <a href = "/user/movie/moviedetail?sub=info&ind=${mm.m_index}">
      <img alt ="" src='<c:url value= "/moviedata/${mm.movietitle }/${mm.movieimg }"/>'>
      </a>
      </td></tr>
      <tr><td>${mm.movietitle }</td></tr>
      <tr>
         <td>평점: ${mm.star }
         <input id = "tBtn" type="button" value="예매하기"></td>
      </tr>
   </table>
 </c:forEach>
