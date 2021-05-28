<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div>
	<c:forEach items="${memdata.purchase }" var ="pp">
		<form action="" method="post" enctype="multipart/form-data" name="frm">
			<div class="seeouter">
				<c:choose>
					<c:when test="${pp.imgname!=null }">
						<a href="/movie/moviedetail?sub=info&ind=${pp.m_index }"><div class="writeimg"><img src="/moviedata/${pp.imgname }" alt="${pp.movietitle } 이미지" /></div></a>
					</c:when>
					<c:otherwise>
						<a href="/movie/moviedetail?sub=info&ind=${pp.m_index }"><div class="writeimg">이미지 없음</div></a>
					</c:otherwise>
				</c:choose> 
				<a href="/movie/moviedetail?sub=info&ind=${pp.m_index }"><div class="writetitle">${pp.movietitle }</div></a>
				<div>상영시간</div>
				<a href="/movie/moviedetail?sub=review&ind=${pp.m_index }">
					<button class="changeButt" id="seewriteGo">괸람평쓰기</button>
				</a>
			</div>
		</form> 	
	</c:forEach>	
</div>
