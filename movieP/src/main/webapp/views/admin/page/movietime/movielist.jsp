<%@page import="java.util.HashMap"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
%>
<style>
.movietimelay1 {
	width: 620px;
	height: 50px;
	margin: 0 auto;
}
.movietimelay2 {
	width: 100%;
	height: 100%;
	margin: 0 auto;
}
.movietimedal{
	width: 50px;
	height: 50px;
	float: left;
	border: 1px solid #000;
	text-align: center;
	font-weight: bold;
	line-height: 50px;
}
.movietimelist{
	width: 150px;
	height: 50px;
	float: left;
	border: 1px solid #000;
}
.both{
	clear: both;
}
hr{
	border: 1px solid #000;
}
.time{
	width: 700px;
	height: 500px;
	overflow: scroll;
	border: 1px solid #000;
	margin: 0 auto;
}
.timebutton1{
	width: 50px;
	height: 40px;
	float: right;
	margin-right: 20px;
	font-size: 25px;
	font-weight: bold;
}
.both{
	clear: both;
}
.timebutton2{
	width: 70px;
	height: 40px;
	float: right;
	margin-right: 20px;
	font-weight: bold;
}
.timelay1_1{
	width: 700px;
	height: 50px;
	margin: 0 auto;
}
.timelist1{
	width: 90px;
	height: 50px;
	float: left;
	border: 1px solid #000;
}	
.timelist2{
	width: 40px;
	height: 50px;
	float: left;
	border: 1px solid #000;
}	
.timelay1{
	float: left;
	width: 100%;
	height: 100%;
}	
.timelay2{
	width: 450px;
	height: 100%;
	float: left;
}
.movietitlebtn {
	color: black;
}
.movietimedelete{
	width: 100%;
	height: 160px;
	border: 1px solid #000;
}
.movietimebox10{
	width: 100px;
	height: 80px;
	border: 1px solid #000;
	float: right;
}
</style>
<div class="movietimedelete">
	<c:if test="${param.deletetime != null }">
	
		<div class="movietimebox10"><a href="/admin/movietime/deleteReg?deletetime=${param.deletetime }&dal=${param.dal}&el=${param.el}">삭제</a></div>
		<c:forEach var="a" items="${data.deletetime }">	
			<div class="movietimebox10">${a.movietitle }</div>
		</c:forEach>
		
		<div class="both"></div>
		<c:forEach var="a" items="${data.deletetime }">	
			<div class="movietimebox10">${a.movietitle }</div>
		</c:forEach>
		
	</c:if>
</div>
<hr>
<div class="movietimelay1">
	<c:forEach var="a" begin="1" end="12">
		<div class="movietimedal"><a href="?dal=${a }">${a }월</a></div>
	</c:forEach>
</div>
<c:if test="${param.dal != null }">
	<div class="movietimelay1">
		<c:forEach var="a" begin="1" end="${data.el2 }">
			<div class="movietimedal"><a href="?dal=${param.dal }&el=${a}">${a }</a></div>
		</c:forEach>
	</div>
</c:if>
<div class="both"></div>
<hr>
<c:if test="${param.el != null }">
	<div class="movietimelay2">
		<div class="timebutton2">${param.dal }월 ${param.el }일</div>
		<div class="both"></div>
		<div class="timebutton1"><a href="?dal=${param.dal }&el=${param.el+1}">></a></div>
		<div class="timebutton1"><a href="?dal=${param.dal }&el=${param.el-1}"><</a></div>
		<div class="timebutton2">
		</div>
		<div class="both"></div>
		
		
		<div class="timelay1_1">
			<div class="timelist2">시간</div>
			<div class="timelist1">작은관1</div>
			<div class="timelist1">작은관2</div>
			<div class="timelist1">작은관3</div>
			<div class="timelist1">기존관1</div>
			<div class="timelist1">기존관2</div>
			<div class="timelist1">기존관3</div>
			<div class="timelist1">3D관</div>
			<div class="both"></div>
		</div>
		<div class="time">
		<div class="timelay1">
			<c:forEach var="hh" begin="13" end="21" step="1">
				<c:forEach var="mm" begin="0" end="50" step="10">
					<c:set var="hhmm" value="${hh*100+mm }"/>
					<div class="timelist2">${hh }:${mm }</div>
					<!-- 여기다가 넣어야함. -->
					
					<%
					boolean check;
					String[] args = {"작은관1","작은관2","작은관3","기존관1","기존관2","기존관3","3D관"};
					for(int i=0; i<=6; i++){ 
						check = true;
					%>
						<c:set var="seacno" value="<%=args[i] %>"/>
						<c:forEach var="ae" items="${data.movietimelist }">
							<c:if test="${ae.starttimeInt <= hhmm && ae.endtimeInt >= hhmm }">
								<c:if test="${seacno eq ae.sectorno }">
									<c:if test="<%=check %>">
										<c:choose>
											<c:when test="${param.deletetime != null }">
												<div class="timelist1"><a class="movietitlebtn" href="?dal=${param.dal }&el=${param.el}&deletetime=${param.deletetime},${ae.time_index}">${ae.movietitle }</a></div>
											</c:when>
											<c:otherwise>
												<div class="timelist1"><a class="movietitlebtn" href="?dal=${param.dal }&el=${param.el}&deletetime=${ae.time_index}">${ae.movietitle }</a></div>
											</c:otherwise>
										</c:choose>
										<% check = false; %>
									</c:if>
								</c:if>
							</c:if>
						</c:forEach>
						<c:if test="<%=check %>">
							<div class="timelist1"><a href="/admin/movietime/insert?time=${hhmm }&sectorno=${seacno}&dal=<%=request.getParameter("dal")%>&el=<%=request.getParameter("el")%>">시간표 등록하기</a></div>
						</c:if>
					<%} %>
						
					<div class="both"></div>
				</c:forEach>
			</c:forEach>
		</div>
			
		</div>
	</div>
</c:if>







