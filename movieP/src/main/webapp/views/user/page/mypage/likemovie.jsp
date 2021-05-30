<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div>
	<input type="hidden" id="like" value="취소"/>
	<input type="hidden" id="userid" value="${sessionId }"/>
	
	<c:forEach items="${memdata.like }" var ="pp">
	
		<form action="" method="post" enctype="multipart/form-data" name="frm">
			
			<div class="likeouter">
				<a href="/user/movie/moviedetail?sub=info&ind=${pp.m_index }">
					<div class="likeimg">
						<c:choose>
							<c:when test="${pp.imgname!=null }">
								<img src="/moviedata/${pp.imgname }" alt="${pp.movietitle } 이미지" />
							</c:when>
							<c:otherwise>
								이미지 없음
							</c:otherwise>
						</c:choose>
					</div>
				</a>
				<a href="/user/movie/moviedetail?sub=info&ind=${pp.m_index }"><div class="liketitle">${pp.movietitle }</div></a>
				<div><button class="likeButt" onclick="likeButt(${pp.m_index })" >${pp.mlike }</button></div>
				<a href="/user/movietime/list?movietitle=${pp.movietitle }">
					<input type="button" class="changeButt" value="예매하기" />
				</a>
			</div>
		</form>
	
	</c:forEach>
</div>
