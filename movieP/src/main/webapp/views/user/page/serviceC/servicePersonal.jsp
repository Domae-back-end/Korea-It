<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1대1 문의</title>
<script src="../../../../my_js/jquery-3.6.0.js"></script>

<style>
	* {padding: 0px; margin: 0px; }
	ul, li {text-decoration: none; list-style: none; }
	a {text-decoration: none; }
	
	#sideBar {width: 170px; height: 500px; background: yellow; float: left; position: relative;  }
	#content {width: 800px; background: aqua; position: relative; float: left; left: 30px; text-align: left;  }
	.clear {clear: both; }
	
	h2 {text-align: left; font-size: 30px; margin-bottom: 20px; }
	
	#sideBar ul li {width: 170px; height: 60px; background: red; margin-bottom: 5px; line-height: 60px; display: inline-block; }
	#sideBar ul li a {font-size: 18px; width: 170px; height: 60px; display: inline-block;}
	
	.qna_form table {width: 800px; box-sizing: border-box; }
	.qna_form tr {height: 50px; }
	.qna_form tr>td {padding: 10px; }
	.qna_form tr>td:nth-of-type(1) {font-size: 18px; background: blue; width: 150px; }
	.qna_form tr>td:nth-of-type(1) label {cursor: pointer;  }
	.qna_form tr>td:nth-of-type(2) {font-size: 16px; background: teal; width: 650px; }
	
	.qna_form select {font-size: 16px; height: 30px; width: 200px; }
	.qna_form .sub {font-size: 16px; height: 30px; width: 200px; }
	.qna_form .title {width: 620px; font-size: 16px; height: 30px} 
	.qna_form textarea {width: 620px; font-size: 16px; height: 300px; resize: vertical; }
	
	.upload_box p {display: inline-block; margin-bottom: 10px; }
	.upload_box input[type="file"] { font-size: 16px; width: 1px; height: 1px; margin: -1px; overflow: hidden;}
	.upload_box .upfile_class {padding: 5px 10px; font-size: 16px; background-color: lime; margin-left: 10px; 
							cursor: pointer; border-radius: 5px; }
	.upload_box .upload_name { display: inline-block; padding: 5px 10px; border-radius: 5px; background: yellow; width: 250px;  }
	
	.sbm {width: 100px; height: 40px; font-size: 16px; background: yellow; margin: 20px 0; }

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
</script>
</head>

<body>
<div id="sideBar">
	<ul>
		<li><a href="serviceMain">고객센터 홈</a></li>
		<li><a href="serviceHistory">상담내역 확인</a></li>
		<li><a href="#">자주 묻는 질문</a></li>
		<li><a href="#">1대1 문의</a></li>
		<li><a href="#">공지사항</a></li>
	</ul>
</div>

<div id="content">
	<h2>1대1 문의</h2>
	
	<div class="qna_form">
		<form action="" method="post" enctype="multipart/form-data">
			<table>
				<tr>
					<td>문의유형*</td>
					<td>
						<select name="kind">
							<option value="nor">일반문의</option>
							<option value="movInfo">영화정보</option>
							<option value="member">회원</option>
							<option value="ticket">예매</option>
							<option value="lost">분실물</option>
							<option value="sugges">제안/건의</option>
						</select>
					</td>
				</tr>
				<tr>
					<td><label for="titleG">제목*</label></td>
					<td><input type="text" name="title" id="titleG" class="title" /></td>
				</tr>
				<tr>
					<td><label for="contG">내용*</label></td>
					<td><textarea name="cont" cols="30" rows="5" id="contG"></textarea></td>
				</tr>
				<tr>
					<td>사진첨부</td>
					
					<td>
						<div class="upload_box">
							<p>* JPEG, PNG 형식의 5M 이하의 파일만 첨부 가능합니다.</p>
							<label for="upfileG" class="upfile_class">파일선택</label>
							<input type="file" name="upfile" id="upfileG" class="upload_hidden" />
							<input class="upload_name" value="파일선택" disabled="disabled">
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center;">
						<input type="submit" value="등록" class="sbm"/>
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>

<div class="clear"></div>
</body>
</html>


















