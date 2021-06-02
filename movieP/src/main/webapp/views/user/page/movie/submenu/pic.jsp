<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
.container{
	width: 470px;
	height: 600px;
}
	.item{
		width: 470px;
		height: 600px;
		vertical-align: center;	
		object-fit: contain;
	}
	.item active{
		width: 470px;
		height: 600px;
		vertical-align: center;	
		object-fit: contain;
	}
	.item>img{
		width: 470px;
		height: 600px;
	}
	.item active>img{
		width: 470px;
		height: 600px;
	}
	.carousel-inner>.item>a>img, .carousel-inner>.item>img, .img-responsive, .thumbnail a>img, .thumbnail>img {
    display: block;
    max-width: none;
    height: 100%;
    object-fit: contain;
}
.carousel-control{
	width: auto;
}

	
</style>
<script>
<% int cnt =0;%>
</script>
<c:forEach items="${movieimage }" var="i" varStatus="no">
	<%cnt = cnt+1; %>
</c:forEach>
<style>
	#p{
		font-size: 30px;
	}
</style>

<div id="p">${moviedetail.movietitle } 영화에 대한 <%=cnt %>개의 스틸컷이 있어요!</div>
<%
	if(cnt > 0){
%>
<div class="container">
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
    <c:forEach begin="0" end="<%=cnt-1 %>" var="i" varStatus="no">
    	<c:choose>
    		<c:when test="i ==0">
    			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    		</c:when>
    		<c:otherwise>
    			 <li data-target="#myCarousel" data-slide-to="${no.index }"></li>
    		</c:otherwise>
    	</c:choose>
    </c:forEach>
    </ol>


    <!-- Wrapper for slides -->
 <div class="carousel-inner">
  <c:forEach items="${movieimage }" var="i" varStatus="no">
      <c:if test="${no.index == 0 }">
	   <div class="item active">
	       <img src="/moviedata/${i.imgname}" alt="${i.imgname }">
      </div>
      </c:if>
      <c:if test="${no.index != 0 }">
      <div class="item">
        <img src="/moviedata/${i.imgname}" alt="${i.imgname }">
      </div>
      </c:if>
  	</c:forEach>
    </div>


    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>
<%}%>