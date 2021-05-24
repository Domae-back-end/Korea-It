<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
</head>
<body>
<h2> 배너등관리 &#36;data => ${empty data}</h2>

<script type="text/javascript">

	$(document).ready(function(){
		
		$(".changeBtn").click(function(){
			alert("사진 수정"+$(this).val()+":"+"#bancontainer"+$(this).val())
			
			$("#changeexists").val("1");
			console.log($(this).val())
			var tobeeditted = document.getElementById("bancontainer"+$(this).val())
			while(tobeeditted.hasChildNodes()){
				tobeeditted.removeChild(tobeeditted.firstChild);
			}
			var newdiv =document.createElement("div");
			newdiv.innerHTML = $(this).val()+"";
			tobeeditted.appendChild(newdiv)	
			var newinput = document.createElement("input");
			newinput.setAttribute("type", "file");
			newinput.setAttribute("name", "ff");
			newinput.setAttribute("value", $(this).val())
			tobeeditted.appendChild(newinput)	
			/* var newinput2 = document.createElement("input");
			newinput2.setAttribute("type", "hidden");
			newinput2.setAttribute("name", "changed");
			newinput2.setAttribute("value", $(this).val())
			tobeeditted.appendChild(newinput2)없어도될듯. */
			
		})
		
		
		
	
		
		$("#saveBtn").click(function saveGo() {
			if(check()){
			
			if(confirm("저장하시겠습니까?")){
			saveform.action = "bannersaveReg"
			
			saveform.submit()		}
			else{
			console.log("저장 안함");
			}
			}
			})
		
		
		
		
		function check() {
        if ($("#changeexists").val() === '1') {
            return true;
        } else {
            alert("변경 사항이 없습니다.");
            return false;
        }
    }
		
		
		
		
		
		
		
		
	})



</script>

<div id="bannercontainer">
<h2>${contextPath}</h2>
<h1>ddd</h1>
<form name="saveform" method="post" enctype="multipart/form-data" >
<c:forEach var="i" items="${data}" >

		<div id="bancontainer${i.bannerindex }">
		<div id="banner${i.bannerindex }">${i.bannerindex }</div>
		<input type="hidden" value="${i.bannerindex }" name="still"/>
		<!-- /resources/css/${PPPData.cate}/${PPPData.service}.css -->
		<img id="img${i.bannerindex }"  src='<c:url value="/banner/${i.imgurl}"/>'  style="width:300px;height:180px"  alt="이;미지내놔" />
	 	<button class="changeBtn" value="${i.bannerindex }" type="button">수정하기</button>
		</div>
		
</c:forEach>
<input type="hidden" id="changeexists" value="0" />
<button  id="saveBtn" type="button" >저장하기</button>
</form>
</div>



</body>
</html>