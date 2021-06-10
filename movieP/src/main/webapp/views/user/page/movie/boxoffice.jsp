<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.model.MovieInfoDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.model.DbMapper"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<script src="<c:url value="/resources/my_js/jquery-3.6.0.js"/>"></script>

<c:forEach items="${moviedatabefore }" var="mm" varStatus="no">
   <table id="movieinfomation">
      <tr><td style="font-size: 25px;">${no.index +1}</td></tr>
      <tr>
      <td id="pos">
      <a href = "/user/movie/moviedetail?sub=info&ind=${mm.m_index}">
      <img alt ="" src= "/moviedata/${mm.movieimg}">
      </a>
      </td></tr>
      <tr><td>${mm.movietitle }</td></tr>
      <tr>
         <td>
         평점:
	    <div id="star" style="display:inline-block;">
			<c:forEach begin="1" end="${mm.gpa }" var="st" varStatus="no">
				<i class="fas fa-star"></i>
				</c:forEach>
			<c:forEach begin="1" end="${5-mm.gpa }" var="st">
				<i class="far fa-star"></i>
			</c:forEach>
		</div>
         
         </td>
      </tr> 
      <tr>
      	<td>
      		예매율: ${mm.res_rate }%
      	</td>
      </tr>  
      <tr>
         <td>
         	<div id="like">
         		<div id = "heart" style="display:inline-block;">♥</div>
         		<a href="javascript:likeGo(${mm.m_index})">좋아요 ${mm.mlike }</a>
         	</div>
         </td>
      <tr>

      <tr>
      <td>
      <a href ="/user/movietime/list?movietitle=${mm.movietitle }"> 예매하기</a>
      </td>
      </tr>
   </table>
 </c:forEach>
