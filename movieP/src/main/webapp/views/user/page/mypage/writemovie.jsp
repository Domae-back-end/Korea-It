<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div>
	<input type="hidden" id="userid" value="${sessionId }"/>
	
	<c:forEach items="${memdata.comment }" var ="pp" varStatus="no">
		
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
			
			<div class="writetnow">${pp.postcontent }</div>
			<textarea class="writeArea" rows="1" cols="40">${pp.postcontent }</textarea>
			
			<div class="writetitleouter">
				<div class="writetitle2">작성일 : ${pp.posttime }</div>
				
				<span class= "writeButtouter">
					<button class="changeButt" onclick="writemodifyGo(${pp.cate },${no.index })" >수정</button>
					<button class="changeButt" onclick="writedelteGo(${pp.cate },${no.index })">삭제</button>
				</span>
			</div>
		</div>
	</c:forEach>
</div>
