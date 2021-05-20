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
					console.log("서버랑 통신잘댐.")				
					//받아오면 뭔일할래?
					
					
					
					
					}									
				}};
				
				xhttp.open("POST","/ajaxtest.do",true);
				xhttp.setRequestHeader(
				          "Content-Type",
				          //"application/x-www-form-urlencoded"
				 		"application/json"       
				);
				var data= JSON.stringify({"startdate":startdate,"enddate":enddate });
				console.log(data)
				
				xhttp.send(data);	
				
				
			
			
			
			
		
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