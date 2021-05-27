<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div>
	<input type="hidden" id="like" value="취소"/>
	<input type="hidden" id="userid" value="${sessionId }"/>
	
	<c:forEach items="${memdata.like }" var ="pp">
	
		<form action="" method="post" enctype="multipart/form-data" name="frm">
			
			<div class="likeouter">
				<c:choose>
					<c:when test="${pp.imgname!=null }">
						<a href="/movie/moviedetail?sub=info&ind=${pp.cate }"><div class="likeimg"><img src="/resources/moviedata/${pp.imgname }.jpg" alt="${pp.movietitle } 이미지" /></div></a>
					</c:when>
					<c:otherwise>
						<a href="/movie/moviedetail?sub=info&ind=${pp.cate }">이미지 없음</a>
					</c:otherwise>
				</c:choose>
				<a href="/movie/moviedetail?sub=info&ind=${pp.cate }"><div>${pp.movietitle }</div></a>
				<div><button class="likeButt" onclick="likeButt(${pp.cate })" >${pp.mlike }</button></div>
				<div><button class="changeButt" id="ticketGo">예매하기</button></div>
			</div>
		</form>
	
	</c:forEach>
</div>
