<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<div class="maincont_center">
	<div class="center_top">
		<h2>MOVIE SELECTION</h2>
		<ul>
			<li><img src="/banner/ps3.jpg" alt="" style="object-fit:cover"></li>
			<li><img src="/banner/ps2.jpg" alt=""></li>
		</ul>
	</div>
	<div class="center_mid">
		<h2>COMING SOON</h2>
		<ul>
			<li><img src="/banner/ps4.jpg" alt="" /></li>
			<li>영화디테일</li>
		</ul>
	</div>
	<div class="center_bot">
		<h2>MEGABOX GUIDANCE</h2>
		<ul>
			<li>
				<a href="/user/serviceC/serviceHome">
					<img src="/banner/ic4.png" alt="" />
					<span>고객센터</span>
				</a>
			</li>
	<c:choose>
		<c:when test="${empty sessionId }">
			<li>
				<a href="../../member/login/loginForm">
					<img src="/banner/ic2.png" alt="" />
					<span>1대1 문의</span>
				</a>
			</li>
		</c:when>
		<c:otherwise>
			<li>
				<a href="/user/serviceC/servicePersonal">
					<img src="/banner/ic2.png" alt="" />
					<span>1대1 문의</span>
				</a>
			</li>
		</c:otherwise>
	</c:choose>
			<li>
				<a href="/user/serviceC/serviceQna">
					<img src="/banner/ic3.png" alt="" />
					<span>자주묻는 질문</span>
				</a>
			</li>
	<c:choose>
		<c:when test="${empty sessionId }">
			<li>
				<a href="../../member/login/loginForm">
					<img src="/banner/ic2.png" alt="" />
					<span>분실물 문의</span>
				</a>
			</li>
		</c:when>
		<c:otherwise>
			<li>
				<a href="/user/serviceC/servicePersonal">
					<img src="/banner/ic2.png" alt="" />
					<span>분실물 문의</span>
				</a>
			</li>
		</c:otherwise>
	</c:choose>
		</ul>
	</div>
</div>
