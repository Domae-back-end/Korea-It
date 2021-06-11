<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<div class="modal fade" data-backdrop="static" data-keyboard="false" id='inforpurchase1'>
	<div class="modal-dialog">
   		<div class="modal-content"></div>
	</div>
</div>
<div>
	<h3>예매내역</h3>
	<input type="hidden" name="userid" id="userid" value="${sessionId }" />
	<div class="purchouter">
		<span class="purchPosition">
		<input type="radio" name="moivepur" id="now" value="now" checked="checked" />예매내역
		<input type="radio" name="moivepur" id="past" value="past"/>지난내역
		<select id="moiverecord" name="moiverecord" disabled="disabled" ></select>
		</span>
		<input type="button" class="changeButt"  id="moiveButt" value="조회" disabled="disabled"  />
	</div>
	<div class="cimeminfor" id="recordpurchase">
		<div id="aaa">
		<div class="fff">
			<c:forEach items="${memdata.purchase }" var ="pp" > 
				<div class = "purchaseMainouter">
					<a href="/user/movie/moviedetail?sub=info&ind=${pp.m_index }">
						<div class="purchaseimg">
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
					<div class="puinfor" id="puinfor">
						<div>
							예매번호 : <span class="saleslink">${pp.saleslink }</span>
						</div>
						<div>
							영화명 : ${pp.movietitle }
						</div>
						<div>
							<div class="purchasespace">상영관 : ${pp.sectorNo }</div>
						<span>
							관람인원 : 
							<c:if test="${pp.A != 0 }">성인${pp.A }명</c:if>
							<c:if test="${pp.T != 0 }">청소년${pp.T }명</c:if>
							<c:if test="${pp.C != 0 }">어린이${pp.C }명</c:if>
						</span>
						</div>
						<div>
							<div class="purchasespace">관람일시 : ${pp.starttime }</div>
						<span>
							관람좌석 : ${pp.seatNo }
						</span>
						</div>
						<div class="purchasespace">
							결제일시 : ${pp.sales_time2 }
						</div>
						<div class="purchasespaceButt">
						<button class="changeButt qwer" dd="${pp.salesprice}" cc="${pp.sales_time3.replace(' ',',') }" tt="${pp.sales_type }" >결제정보</button>
						<c:if test="${pp.checktime > memdata.dto.nowDate }">
							<button class="changeButt" onclick="ticketCancel(${pp.saleslink })">예매취소</button>		
						</c:if>
						</div>
					</div>
				</div>
 
			</c:forEach>
		</div> 
		</div>
		
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
	
	<h3>예매 취소내역</h3> 
	<p class="ppSmall"><small>(상영일 기준 7일간 취소내역을 확인하실 수 있습니다.)</small></p>
	
	<div class="cimeminfor" id="recordCpurchase">
		<div id="titleinner">
			<div class="puchaseinner">취소일시</div>
			<div class="puchaseinner">영화제목</div>
			<div class="puchaseinner">상영일시</div>
			<div class="puchaseinner">취소금액</div>
		</div>
		<div id="CP">
		<div class="CCC"> 
		<c:forEach items="${memdata.cancel }" var ="pp">
				<div>
					<div class="puchaseinner">${pp.sales_time }</div>
					<div class="puchaseinner">${pp.movietitle }</div>
					<div class="puchaseinner">${pp.starttime }</div>
					<div class="puchaseinner">${pp.salesprice }</div>
				</div>
		</c:forEach>
		</div>
		</div>
		
		<div class="pageCP" id="pageCRecord">
			<div class="CCC">
				<c:if test="${memdata.cpdto.cstartPage > 1}">
					<input type="button" class="btnnn pagebtn pagebtn_lr" onclick="purchasCancelepageChange(${memdata.cpdto.cstartPage-1})" value="&lt" />
				</c:if>
					            
				<c:forEach begin="${memdata.cpdto.cstartPage}" end="${memdata.cpdto.cendPage}" step="1" var="i">
					<c:choose>
						<c:when test="${i == memdata.cpdto.cpage}">
							<input type="text" class="pagebtn_sel" value="${i }" readonly/>
						</c:when>
						<c:otherwise>
							<input type="button" class="btnnn pagebtn" onclick="purchasCancelepageChange(${i})" value="${i}" />
						</c:otherwise>
					</c:choose>
				</c:forEach>
					            
				<c:if test="${memdata.cpdto.cendPage < memdata.cpdto.ctotal}">
					<input type="button" class="btnnn pagebtn pagebtn_lr" onclick="purchasCancelepageChange(${memdata.cpdto.cendPage+1})" value="&gt" />
				</c:if>
			</div>
		</div>
	</div>
		
	
</div>