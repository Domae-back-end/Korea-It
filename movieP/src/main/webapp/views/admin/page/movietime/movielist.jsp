<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
.dallay {
	width: 1200px;
	height: 50px;
	margin: 10px auto;
}

.dal {
	width: 100px;
	height: 50px;
	line-height: 50px;
	font-size: 20px;
	background: gray;
	float: left;
	background: gray;
}

.dal>a {
	width: 100px;
	height: 50px;
	text-decoration: none;
	color:black;
}

.both {
	clear: both;
}

.ellay {
	margin: 0 auto;
	width: 719px;
	height: 600px;
}

.el {
	float: left;
	width: 100px;
	height: 100px;
	background: gray;
	border: 1px solid #000;
	font-size: 18px;
	font-weight: bold;
	text-align: right;
}

.el > a{
	color:black;
}

.timeservice {
	width: 461px;
	height: 100%;
	background: lime;
	margin: 20px auto;
}

.timebox1 {
	width: 50px;
	height: 50px;
	float: left;
	border: 1px solid #000;
	line-height: 50px;
}

.timebox2 {
	width: 100px;
	height: 50px;
	float: left;
	line-height: 50px;
	border: 1px solid #000;
}

.menu1 {
	background: white;
	float: right;
	width: 100px;
	line-height: 50px;
	height: 50px;
	border: 1px solid #000;
	margin-bottom: 20px;
}
</style>
<%
Calendar today = Calendar.getInstance();
boolean check = false;
if (request.getParameter("dal") != null) {
	today.set(Calendar.MONTH, Integer.parseInt(request.getParameter("dal")));
}
today.set(Calendar.DATE, 1);
if (request.getParameter("dal") != null && request.getParameter("el") != null) {
	check = true;
}
%>
<c:set var="now" value="<%=new Date()%>" />
<h2>
	<fmt:formatDate value="${now }" type="date" dateStyle="full" />
</h2>
<br>
<div class="dallay">
	<c:forEach var="a" begin="1" end="12">
		<c:choose>
			<c:when test="${now.month >= a }">
				<div class="dal">
					<a href="?dal=${a }">x ${a } 월</a>
				</div>
			</c:when>
			<c:otherwise>			
				<div class="dal">
					<a href="?dal=${a }">${a } 월</a>
				</div>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	<div class="both"></div>
</div>
<div class="ellay">
	<c:forEach var="a" begin="1"
		end="<%=today.get(Calendar.DAY_OF_WEEK)-1%>">
		<div class="el"></div>
	</c:forEach>
	<c:forEach var="a" begin="1"
		end="<%=today.getActualMaximum(Calendar.DATE)%>">
		<c:choose>
			<c:when test="${param.dal == now.month+1 }">
				<c:choose>
					<c:when test="${a == now.date }">
						<div class="el">
							<a
								href="?dal=<%=(Calendar.getInstance().get(Calendar.MONTH))+1 %>&el=${a}">[ ${a } ] 일</a>
						</div>
					</c:when>
					<c:when test="${a <= now.date }">
						<div class="el">
							<a
								href="?dal=<%=(Calendar.getInstance().get(Calendar.MONTH))+1 %>&el=${a}">x ${a } 일</a>
						</div>
					</c:when>
					<c:otherwise>
						<div class="el">
							<a
								href="?dal=<%=(Calendar.getInstance().get(Calendar.MONTH))+1 %>&el=${a}">${a }일</a>
						</div>
					</c:otherwise>
				</c:choose>
			</c:when>
			<c:otherwise>
						<div class="el">
							<a
								href="?dal=<%=(Calendar.getInstance().get(Calendar.MONTH))+1 %>&el=${a}">${a }일</a>
						</div>
			</c:otherwise>
		</c:choose>
	</c:forEach>
</div>
<div class="both"></div>
<br>
<hr>
<c:choose>
	<c:when test="<%=check%>">
		<div class="menu1">
			<a href="/admin/movietime/insert?dal=<%=request.getParameter("dal")%>&el=<%=request.getParameter("el")%>">등록하기</a>
		</div>
		<div class="menu1">
			<a href="">검색</a>
		</div>
		<div class="timeservice">
			<div class="both"></div>
			<div class="timebox1">번호</div>
			<div class="timebox2">영화 제목</div>
			<div class="timebox2">시작 시간</div>
			<div class="timebox2">종료 시간</div>
			<div class="timebox2">날짜</div>
			<div class="both"></div>
			<c:forEach var="a" items="${data }" varStatus="i">
				<div class="timebox1">${i.index }</div>
				<div class="timebox2"><a href="/admin/movietime/detail?movietitle=${a.movietitle }">${a.movietitle }</a></div>
				<div class="timebox2">
					<fmt:formatDate value="${a.starttime }" type="both"
						pattern="hh:mm:ss" />
				</div>
				<div class="timebox2">
					<fmt:formatDate value="${a.endtime }" type="both"
						pattern="hh:mm:ss" />
				</div>
				<div class="timebox2">
					<fmt:formatDate value="${a.reg_date }" type="both"
						pattern="yyyy-MM-dd" />
				</div>
				<div class="both"></div>
			</c:forEach>
		</div>
	</c:when>
	<c:otherwise>
		<div class="timeservice">해당 일정이 존재하지 않습니다.</div>
	</c:otherwise>
</c:choose>




