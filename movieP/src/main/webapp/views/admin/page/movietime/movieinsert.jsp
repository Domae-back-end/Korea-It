<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
	.timelay1_1{
		width: 100%;
		height: 300px;
		border: 1px solid #000;
	}
	.timelay1{
		width: 100%;
		height: 500px;
		border: 1px solid #000;
		overflow: scroll;
	}
	.timebox1{
		float: left;
		width: 100px;
		height: 100px;
		border: 1px solid #000;
	}
	.timebox1 > img{
		width: 100px;
		height: 100px;
	}
	.both{
		clear: both;
	}
	.timebox2{
		width: 100px; 
		height: 50px;
		float: left;
		margin-left: 30px;
	}
	.timebox3{
		width: 150px; 
		height: 50px;
		float: left;
	}
	timebox3 > input{
		width: 150px;
		height: 50px;
	}
	hr{
		border: 1px solid #000;
	}
	.timebox3_1{
	width: 150px;
	height: 25px;
	}
	.timebox4{
		width: 300px; 
		height: 50px;
		float: left;
		border: 1px solid #000;
	}
	.timebutton1{
		width: 150px;
		height: 50px;
		border: 1px solid #000;
		color: blue;
	}
	.timebox3 > input[type="submit"] {
		width: 150px;
		height: 50px;
		border: 1px solid #000;
		color: blue;
	}
</style>
<form action="/admin/movietime/insertReg">
	<input type="hidden" name="dal" value="${param.dal }">
	<input type="hidden" name="el" value="${param.el }">
	<input type="hidden" name="sectorno" value="${param.sectorno }">
		<div class="timelay1_1">
		<div class="timebox3">
			
		</div>
		<div class="timebox3">
			요일
		</div>
		<div class="timebox3">
			날짜
		</div>
		<div class="both"></div>
		<div class="timebox3">
			멀티 시간표 설정
		</div>
		<div class="timebox3">
			<div class="timebox3_1">
				일 월 화 수 목 금 토
			</div>
			<div class="timebox3_1">
				<input type="checkbox" name="dayto" value="1"/>
				<input type="checkbox" name="dayto" value="2"/>
				<input type="checkbox" name="dayto" value="3"/>
				<input type="checkbox" name="dayto" value="4"/>
				<input type="checkbox" name="dayto" value="5"/>
				<input type="checkbox" name="dayto" value="6"/>
				<input type="checkbox" name="dayto" value="7"/>
			</div>
		</div>
		<div class="timebox3">
			<input type="date" name="endReg_date" />
		</div>
		<div class="timebox2">
			${param.sectorno }
		</div>
		<div class="timebox3">
			<c:if test="${param.movietitle != null }">
				<input type="hidden" name="movietitle" value="${param.movietitle }" />
				<input type="hidden" name="time" value="${param.time }" />
				<input type="hidden" name="check" value="true" />
				<input type="submit" value="멀티 시간표 설정" />
			</c:if>
		</div>
		<div class="both"></div>
		<div class="timebox3">
		</div>
		<div class="timebox3">
		</div>
		<div class="timebox3">
			선택 ->
		</div>
		<div class="timebox4">
			${param.dal }월 ${param.el }일 ${param.sectorno } ${param.movietitle }
		</div>
		<div class="both"></div>
		<hr>
		<div class="timebox3">
			싱글 시간표 설정
		</div>
		<div class="timebox3"></div>
		<div class="timebox3">
			${param.dal }월 ${param.el }일
		</div>
		<div class="timebox2">
			${param.sectorno }
		</div>
		<div class="timebox3">
			<c:if test="${param.movietitle != null }">
				<a class="timebutton1" href="insertReg?dal=${param.dal }&el=${param.el }&check=false&sectorno=${param.sectorno }&movietitle=${param.movietitle }&time=${param.time }">싱글 시간표 설정</a>
			</c:if>
		</div>
		<div class="both"></div>
		<div class="timebox3">
		</div>
		<div class="timebox3">
		</div>
		<div class="timebox3">
			선택 ->
		</div>
		<div class="timebox4">
			${param.dal }월 ${param.el }일 ${param.sectorno } ${param.movietitle }
		</div>
	</div>
	<div class="both"></div>
	
	<div class="timebox1">선택</div>
	<div class="timebox1">영화 포스터</div>
	<div class="timebox1">영화 제목</div>
	<div class="timebox1">영화 시간</div>
	<div class="timebox1">영화 감독</div>
	<div class="timebox1">영화 장르</div>
	<div class="timebox1">영화 별점</div>
	<div class="both"></div>
		
	<div class="timelay1">
		<c:forEach var="a" items="${data.movielist }">
			<div class="timebox1"><a href="?time=${param.time }&sectorno=${param.sectorno }&dal=${param.dal }&el=${param.el }&movietitle=${a.movietitle }">▶</a></div>
			<div class="timebox1"><img src="/moviedata/${a.movieimg }" alt="준비된 사진이 없음." /></div>
			<div class="timebox1">${a.movietitle }</div>
			<div class="timebox1">${a.mplaytime }</div>
			<div class="timebox1">${a.mdir }</div>
			<div class="timebox1">${a.mcate }</div>
			<div class="timebox1">${a.star }</div>
			<div class="both"></div>
		</c:forEach>
	</div>
</form>