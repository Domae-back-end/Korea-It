<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div>
	<c:forEach items="${memdata.comment }" var ="pp">
	<form action="" method="post" enctype="multipart/form-data" name="frm">
		<div class="writeouter">
			<c:choose>
				<c:when test="${pp.imgname!=null }">
					<a href="/movie/moviedetail?sub=review&ind=${pp.cate }"></a><div class="writeimg"><img src="/resources/moviedata/${pp.imgname }.jpg" alt="${pp.movietitle } 이미지" /></div>
				</c:when>
				<c:otherwise>
					<a href="/movie/moviedetail?sub=review&ind=${pp.cate }"><div class="writeimg">이미지 없음</div></a>
				</c:otherwise>
			</c:choose>
			<a href="/movie/moviedetail?sub=review&ind=${pp.cate }"><div class="writetitle">${pp.movietitle } | 좋아요: ${pp.mlike }</div></a>
			<div class="writetitle2">${pp.postcontent }</div>
			<div class="writetitleouter">
				<div class="writetitle2">작성일 : ${pp.posttime }</div>
				<div><button class="changeButt">수정</button></div>
				<div><button class="changeButt">삭제</button></div>
			</div>
		</div>
	</form> 	
	</c:forEach>
</div>
