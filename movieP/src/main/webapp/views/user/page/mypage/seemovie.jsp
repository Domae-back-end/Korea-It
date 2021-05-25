<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div>
	<c:forEach items="${memdata.purchase }" var ="pp">
	<form action="" method="post" enctype="multipart/form-data" name="frm">
		<div class="seeouter">
			<%-- <c:choose>
				<c:when test="${pp.imgname!=null }">
					<a href="moviedetail?sub=info&ind=${pp.m_index }"></a><div class="writeimg"><img src="/resources/moviedata/${pp.imgname }.jpg" alt="${pp.movietitle } 이미지" /></div>
				</c:when>
				<c:otherwise>
					<a href="moviedetail?sub=info&ind=${pp.m_index }"><div class="writeimg">이미지 없음</div></a>
				</c:otherwise>
			</c:choose> 
			<a href="moviedetail?sub=info&ind=${pp.m_index }"></a> --%>
			<div class="writetitle">${pp.movietitle }</div>
		</div>
	</form> 	
	</c:forEach>
</div>
