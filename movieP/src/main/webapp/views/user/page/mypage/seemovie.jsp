<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div>
	<c:forEach items="${memdata.purchase }" var ="pp">
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
				<a href="/user/movie/moviedetail?sub=info&ind=${pp.m_index }"><div class="writetitle">${pp.movietitle }</div></a>
				<div>상영시간</div>
				<a href="/user/movie/moviedetail?sub=info&ind=${pp.m_index }">
					<button class="changeButt" id="seewriteGo">괸람평쓰기</button>
				</a>
			</div>
	</c:forEach>
	<div id="pageRecord">
		<div class="fff">
			<c:if test="${memdata.pdto.startPage > 1}">
	    		<input type="button" class="btnnn pagebtn pagebtn_lr" onclick="purchasepageChange(${memdata.pdto.startPage-1})" value="&lt" />
			</c:if>
	            
			<c:forEach begin="${memdata.pdto.startPage}" end="${memdata.pdto.endPage}" step="1" var="i">
				<c:choose>
					<c:when test="${i == memdata.pdto.page}">
						<input type="text" class="pagebtn_sel" value="${i }" readonly/>
					</c:when>
					<c:otherwise>
						<input type="button" class="btnnn pagebtn" onclick="purchasepageChange(${i})" value="${i}" />
					</c:otherwise>
				</c:choose>
			</c:forEach>
	            
			<c:if test="${memdata.pdto.endPage < memdata.pdto.total}">
	    		<input type="button" class="btnnn pagebtn pagebtn_lr" onclick="purchasepageChange(${memdata.pdto.endPage+1})" value="&gt" />
			</c:if>
		</div>
	</div>
</div>
