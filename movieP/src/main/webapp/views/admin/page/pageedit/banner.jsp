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


<script type="text/javascript">

	$(document).ready(function(){
		
		
		function getKeyByValue(object, value) {
			  return Object.keys(object).find(key => object[key] === value);
			}// 키값박기.
		
		
		
		var chagesensor = document.getElementById('changeexists');	
			
		
		$(".changeBtn").click(function(){
			
			
			
			
			var wanted= $(this).val()
			//alert("사진 수정"+$(this).val()+":"+"#bancontainer 몇번쨰??    "+wanted)
			
			var xhttp= new XMLHttpRequest();
			
			
			xhttp.onreadystatechange =function(){					
				if(xhttp.readyState == 4){
					console.log("readyState==4")
					if(xhttp.status == 200){		
						
					
					var parsed= JSON.parse(xhttp.responseText)
					var cnt=0;
					var total=0;
					
					var bannerselect = document.createElement("select")
					bannerselect.setAttribute("name","movieindex")
					
					for(var rr in parsed){//var BtnType// 들어오는데이터를 돌려 
						console.log(parsed)
						//console.log( getKeyByValue(parsed,parsed[rr])  )
						
						
						if(rr=='total'){
							total=Number(parsed[rr])
							console.log(total)
						}else{
						
							console.log(total)
							option = new Option();
							option.value = Number(total--)
							option.text = parsed[rr]
							bannerselect.options.add(option);
						}
						
					}// 콘솔돌려
					
					
					var newinput = document.createElement("input");
					newinput.setAttribute("type", "file");
					newinput.setAttribute("name", "ff");
					newinput.setAttribute("value", wanted)
						
					// 출력 
					
					// 영화정보를 불러오는 ajax 필요 .
					
					/* var newinput2 = document.createElement("input");
					newinput2.setAttribute("type", "hidden");
					newinput2.setAttribute("name", "changed");
					newinput2.setAttribute("value", $(this).val())
					tobeeditted.appendChild(newinput2)없어도될듯. */
					
					// 모든 input 에 파일 선택되고 , select 도 되어 있다면 .? 조건문.
							
					chagesensor.value=1;
					
					
					
					
					
					
				console.log(wanted+ " 번 수정버튼 동작했음.")
				
				
				
				var tobeeditted = document.getElementById("bancontainer"+wanted)
				while(tobeeditted.hasChildNodes()){
					tobeeditted.removeChild(tobeeditted.firstChild);
				}// 삭제flow
				//지운뒤에 더해준다.
				
				tobeeditted.appendChild(bannerselect)
				tobeeditted.appendChild(newinput)
				
				
					
				
				}}};
				xhttp.open("POST","/bannermovieget",true);
				xhttp.setRequestHeader(	          "Content-Type",	"application/json"
				);
				var data= JSON.stringify({ "movieget":"movieget" });
				console.log("cccccc:"+data)				
				xhttp.send(data);
			
			
				
			
			
			
			
			
			
		})// 체인지버튼click 시 .. 영화정보 가져와야함,.
		
		
		
	
		
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
            //alert("변경 사항이 없습니다.");
            return false;
        }
    }
		
		
		
		
		
		
		
		
	})



</script>

<div id="bannercontainer">
<%-- <h2>${contextPath}</h2> --%>

<form name="saveform" method="post" enctype="multipart/form-data" >
<c:forEach var="i" items="${data}" >

		<div id="bancontainer${i.bannerindex }">
		<div id="banner${i.bannerindex }">${i.bannerindex }</div>
		<input type="hidden" value="${i.bannerindex }" name="still"/>
		<!-- /resources/css/${PPPData.cate}/${PPPData.service}.css -->
		<img id="img${i.bannerindex }"  src='<c:url value="/banner/${i.imgurl}"/>'  style="width:333px;height:172px"  alt="이;미지내놔" />
	 	<button class="changeBtn" value="${i.bannerindex }" type="button">수정하기</button>
		</div>
		
</c:forEach>
<input type="hidden" id="changeexists" value="0" />
<button  id="saveBtn" type="button" >저장하기</button>
</form>
</div>



</body>
</html>