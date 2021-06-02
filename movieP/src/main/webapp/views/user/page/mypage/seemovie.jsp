<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div>
	<input type="hidden" id="pageKind" value="seemovie"/>
	<input type="hidden" id="userid" value="${sessionId }"/>
	
	<div id="add">
	<div class="fff">
	<c:forEach items="${memdata.purchase }" var ="pp">
		<c:if test="${pp.checktime < memdata.dto.nowDate }">
			<div class="seeouter">
				<a href="/user/movie/moviedetail?sub=info&ind=${pp.m_index }">
					<div class="writeimg">
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
				<div class="seeContent">
					<a href="/user/movie/moviedetail?sub=info&ind=${pp.m_index }"><div class="seeContentitle">${pp.movietitle }</div></a>
					<div>${pp.starttime }</div>
					<div>${pp.sectorNo }</div>
					<a href="/user/movie/moviedetail?sub=info&ind=${pp.m_index }">
						<button class="changeButt" id="seewriteGo">관람평쓰기</button>
					</a>
				</div>	
			</div>
		</c:if>
	</c:forEach>
	</div>
	</div>
	
	<div id="pageRecord">
		<div id="fff">
			<c:if test="${memdata.pdto.startPage > 1}">
	    		<input type="button" class="btnnn pagebtn pagebtn_lr" onclick="pageChange(${memdata.pdto.startPage-1})" value="&lt" />
			</c:if>
	            
			<c:forEach begin="${memdata.pdto.startPage}" end="${memdata.pdto.endPage}" step="1" var="i">
				<c:choose>
					<c:when test="${i == memdata.pdto.page}">
						<input type="text" class="pagebtn_sel" value="${i }" readonly/>
					</c:when>
					<c:otherwise>
						<input type="button" class="btnnn pagebtn" onclick="pageChange(${i})" value="${i}" />
					</c:otherwise>
				</c:choose>
			</c:forEach>
	            
			<c:if test="${memdata.pdto.endPage < memdata.pdto.total}">
	    		<input type="button" class="btnnn pagebtn pagebtn_lr" onclick="pageChange(${memdata.pdto.endPage+1})" value="&gt" />
			</c:if>
		</div>
	</div>
</div>
