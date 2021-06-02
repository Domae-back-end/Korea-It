<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1대1 문의</title>
<script src="../../../../my_js/jquery-3.6.0.js"></script>

<style>
	* {padding: 0px; margin: 0px; font-size: 16px;  }
	ul, li {text-decoration: none; list-style: none; }
	a {text-decoration: none; color: black; }
	a:hover {text-decoration: none; color: black; }
	
	#sideBar {width: 170px; height: 500px; float: left; position: relative; }
	#content {width: 800px; position: relative; float: left; left: 30px;  }
	.clear {clear: both; }
	
	h2 {text-align: left; font-size: 28px; margin-bottom: 30px; }
	
	#sideBar ul li:nth-of-type(1) {height: 100px; line-height: 100px; background: #444; border: 1px solid #444; border-radius: 10px 10px 0 0; }
	#sideBar ul li:nth-of-type(1) a {font-size: 20px; height: 100px; color: white; }
	#sideBar ul li {width: 170px; height: 60px; background: #F2F4F5; line-height: 60px; display: inline-block; box-sizing: border-box; border: 1px solid #d8d9db; }
	#sideBar ul li a {width: 170px; height: 60px; display: inline-block;}
	#sideBar ul li:last-child {border-radius: 0 0 10px 10px; }
	#sideBar ul li:nth-of-type(5) {background: white; }
	
	.must_cont {text-align: right; color: red; font-weight: bold; margin-bottom: 10px; }
	.must_star {color: red; font-weight: bold; }
	
	.subtitle { margin-bottom: 30px; text-align: left; }
	.qna_form table {width: 800px; box-sizing: border-box; }
	.qna_form tr {height: 50px; }
	.qna_form tr>td {padding: 10px; }
	.qna_form tr>td:nth-of-type(1) {background: #F2F4F5; width: 150px; text-align: left; border-top: 1px solid black; font-weight: bold;  }
	.qna_form tr>td:nth-of-type(1) label {cursor: pointer;  }
	.qna_form tr>td:nth-of-type(2) {width: 650px;text-align: left; border-top: 1px solid black; }
	
	.qna_form select {font-size: 16px; height: 30px; width: 200px; text-align: left;  border: 1px solid #d8d9db; outline: none; }
	.qna_form .sub {font-size: 16px; height: 30px; width: 200px; }
	.qna_form .title {width: 620px; font-size: 16px; height: 30px;  border: 1px solid #d8d9db; } 
	.qna_form textarea {width: 620px; font-size: 16px; height: 300px; resize: vertical; border: 1px solid #d8d9db; }
	.qna_form textarea:focus, .sub:focus, .title:focus, select:focus {border: 1px solid black; outline: none; }
	
	.qna_form_tb td {border-bottom: 1px solid #d8d9db; }
	
	.upload_box p {display: inline-block; margin-bottom: 10px; }
	.upload_box input[type="file"] { font-size: 16px; width: 1px; height: 1px; margin: -1px; overflow: hidden;}
	.upload_box .upfile_class {padding: 5px 10px; font-size: 16px; background-color: #666; margin-left: 10px; 
							cursor: pointer; border-radius: 5px; color: white; font-weight: bold;}
	.upload_box .upload_name { display: inline-block; padding: 5px 10px; border-radius: 5px; width: 250px;  }
	
	.sbm {width: 100px; height: 50px; font-size: 16px; background: #dbdbdb; margin: 50px 0; text-align: center; border: none; border-radius: 5px; }

</style>

<script>
	$(document).ready(function() {
		
		var fileTarget = $('.upload_box .upload_hidden');

		fileTarget.on('change', function() {
			if (window.FileReader) {
				var filename = $(this)[0].files[0].name;
				
			} else {
				var filename = $(this).val().split('/').pop().split('\\').pop();
			}

			$(this).siblings('.upload_name').val(filename);
		});
	});
	
	
	function emptychk() {
		if (document.getElementById("titleG").value == "") {
			alert("제목을 입력해주세요");
			return false;
		}else if(document.getElementById("contG").value == "") {
			alert("내용을 입력해주세요");
			return false;
		}else {
			document.fff.submit();
		}
	}
	
	function checkfile(input, inputV) {
		var fileLen = inputV.length; 
		var fileLas = inputV.lastIndexOf(".");
		var fileExt = inputV.substring(fileLas+1, fileLen).toLowerCase();
		
		if (fileExt != "jpg" && fileExt != "png" && fileExt != "jpeg") {
			alert("확장자를 확인하세요!");
			
			$('.upload_name').val('파일선택')
	        input.value = null;
		}
		
		if (input.files && input.files[0].size > (5 * 1024 * 1024)) {
	        alert("파일 사이즈가 5mb 를 넘습니다.");
	        
	        $('.upload_name').val('파일선택')
	        input.value = null;
	    }
		
	}
	
</script>
</head>

<body>
<div id="sideBar">
	<ul>
		<li><a href="serviceHome">고객센터</a></li>
		<li><a href="serviceHome">고객센터 홈</a></li>
		<c:choose>
			<c:when test="${empty data.onesfdto.persid }">
				<li><a href="../../member/login/loginForm">상담내역 확인</a></li>
			</c:when>
			<c:otherwise>
				<li><a href="serviceHistory">상담내역 확인</a></li>
			</c:otherwise>
		</c:choose>
		<li><a href="serviceQna">자주 묻는 질문</a></li>
		<c:choose>
			<c:when test="${empty data.onesfdto.persid }">
				<li><a href="../../member/login/loginForm">1대1 문의</a></li>
			</c:when>
			<c:otherwise>
				<li><a href="servicePersonal">1대1 문의</a></li>
			</c:otherwise>
		</c:choose>
		<li><a href="serviceNotice">공지사항</a></li>
	</ul>
</div>

<div id="content">
	<h2>1대1 문의</h2>
	
	<div class="subtitle">
		<p>- 문의하시기 전 자주묻는 질문을 확인하시면 궁금증을 더욱 빠르게 해결하실 수 있습니다.</p>
	</div>
	
	<div class="qna_form">
		<form action="/user/serviceC/qnainsertReg" method="post" enctype="multipart/form-data" name="fff"> 
		
			<div class="must_cont">* 필수</div>
			<table class="qna_form_tb">
				<tr>
					<td>문의유형 <span class="must_star">*</span></td>
					<td>
						<select name="perscate">
							<option value="basic">일반문의</option>
							<option value="movinfo">영화정보</option>
							<option value="member">회원</option>
							<option value="ticket">예매</option>
							<option value="lost">분실물</option>
							<option value="suggest">제안/건의</option>
						</select>
					</td>
				</tr>
				<tr>
					<td><label for="titleG">제목 <span class="must_star">*</span></label></td>
					<td><input type="text" name="perstitle" id="titleG" class="title" /></td>
				</tr>
				<tr>
					<td><label for="contG">내용 <span class="must_star">*</span></label></td>
					<td><textarea name="perscont" cols="30" rows="5" id="contG"></textarea></td>
				</tr>
				<tr>
					<td>사진첨부</td>
					
					<td>
						<div class="upload_box">
							<p>* JPG, JPEG, PNG 형식의 5M 이하의 파일만 첨부 가능합니다.</p>
							<label for="upfileG" class="upfile_class">파일선택</label>
							<input type="file" name="file" id="upfileG" class="upload_hidden" onchange="checkfile(this, this.value)"/>
							<input class="upload_name" value="파일선택" disabled="disabled">
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center; background: none; border-bottom: none; ">
						<input type="button" value="등록" class="sbm" onclick="emptychk()"/>
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>

<div class="clear"></div>
</body>
</html>


















