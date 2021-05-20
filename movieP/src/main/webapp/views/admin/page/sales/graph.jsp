<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<script>

$(document).ready(function(){
	
	
	
	var ssggbutton= document.getElementById("graphdateGoBtn") 
		let ssggSdate= document.getElementById("ssggstartdate");
		let ssggEdate= document.getElementById("ssggenddate");
	
	ssggbutton.addEventListener("click",function(){
		
	
			alert("버튼 눌름. ajax 가동.")
			
			var xhttp= new XMLHttpRequest();
			startdate= ssggSdate.value
			enddate= ssggEdate.value			
			console.log(startdate+"~"+enddate)			
			xhttp.onreadystatechange =function(){					
				if(xhttp.readyState == 4){
					console.log("readyState==4")
					if(xhttp.status == 200){
					console.log("서버랑 통신잘댐."+xhttp.responseText)
					var parsed= JSON.parse(xhttp.responseText)
					console.log(parsed)
					console.log(parsed.message2)
					//받아오면 뭔일할래?
					
					
					
					
					}									
				}};
				
				xhttp.open("POST","/salesGraphSltView.do",true);
				xhttp.setRequestHeader(
				          "Content-Type",
				          //"application/x-www-form-urlencoded"슈레기
				 		"application/json"//이게 개꿀.       
				);
				var data= JSON.stringify({"startdate":startdate,"enddate":enddate });
				console.log(data)
				
				xhttp.send(data);//sfy해서 서버에보냄	
				})
	
	
	
	
		
	
	
	
	
	
	
	
})


	
	





</script>





</head>
<body>

값이 있는가?ㅣ: ${!empty data }

<form action="graphView" >
시작날짜<input type="date" name="startdate" id="ssggstartdate" />
시작날짜<input type="date" name="enddate" id="ssggenddate" />

<button id="graphdateGoBtn"  type="button">조회하기</button>

</form>
<div id="salesGraphWrapper" >
<c:forEach  items="${data}"  var= "i">

<div> ${i.movietitle } </div>
<div> ${i.salesprice } </div>
<div> ${i.sales_time } </div>
<hr /> 



</c:forEach>
</div>

</body>
</html>