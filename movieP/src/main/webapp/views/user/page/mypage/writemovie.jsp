<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div>
	<c:forEach items="${memdata.comment }" var ="pp">
		
		<input type="hidden" id="content" value="${pp.postcontent }"/>
		<input type="hidden" id="userid" value="${sessionId }"/>
		<input type="hidden" id="index" value="${pp.cate }"/>

		<div class="writeouter">
			<c:choose>
				<c:when test="${pp.imgname!=null }">
					<a href="/movie/moviedetail?sub=review&ind=${pp.cate }"><div class="writeimg"><img src="/resources/moviedata/${pp.imgname }.jpg" alt="${pp.movietitle } 이미지" /></div></a>
				</c:when>
				<c:otherwise>
					<a href="/movie/moviedetail?sub=review&ind=${pp.cate }"><div class="writeimg">이미지 없음</div></a>
				</c:otherwise>
			</c:choose>
			
			<a href="/movie/moviedetail?sub=review&ind=${pp.cate }"><div class="writetitle">${pp.movietitle } | 좋아요: ${pp.mlike }</div></a>
			
			<div class="writetitle2" id="writetnow">${pp.postcontent }</div>
			<textarea id="writeArea" rows="1" cols="40">${pp.postcontent }</textarea>
			
			<div class="writetitleouter" id="${pp.cate }">
				<div class="writetitle2">작성일 : ${pp.posttime }</div>
				<span class= "writeButtouter">
					<button class="changeButt" id="writemodifyGo" >수정</button>
					<button class="changeButt" id="writedelteGo">삭제</button>
				</span>
			</div>
		</div>
	</c:forEach>
</div>
