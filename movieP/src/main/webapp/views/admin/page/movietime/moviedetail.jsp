<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	.moviedetail{
		width: 1000px;
		height: 100%;
		margin: 0 auto;
	}
	.movieImg{
		float: left;
		width: 150px;
		height: 300px;
	}
	.movieImg > img{
		width: 200px;
		height: 300px;
	}
	.movietitle{
		width: 200px;
		height: 50px;
		font-size: 25px;
		margin-left: 200px;
		font-weight: bold;
		text-align: center;
	}
	.mplot{
		width: 400px;
		height: 100px;
		font-size: 20px;
		margin-left: 200px;
		font-weight: bold;
		text-align: center;
	}
	.star{
		width: 200px;
		height: 50px;
		font-size: 25px;
		margin-left: 200px;
		font-weight: bold;
		text-align: center;
	}
	.both{
		clear: both;
	}
	.removemenu{
		float: right;
		width: 150px;
		height: 50px;
		background: black;
		line-height: 50px;
		color: white;
		font-weight: bold;
	}
</style>
<div class="moviedetail">
	<div class="movieImg"><img src="/img/${data.info.movieimg }" alt="이미지 파일 없음."></div>
	<div class="movietitle">${data.info.movietitle }</div>
	<div class="mplot">${data.info.mplot }</div>
	<div class="star">${data.info.star }</div>
	<div class="both"></div>
</div>
<div class="both"></div>
<div class="removemenu">수정하기</div>
<div class="removemenu">삭제하기</div>
<div class="both"></div>
<hr>








