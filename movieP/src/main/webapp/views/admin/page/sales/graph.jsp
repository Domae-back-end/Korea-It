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
		let ssggSyear= document.getElementById("ssggstartyear");
		let ssggSmonth= document.getElementById("ssggstartmonth");	
		let ssggEyear= document.getElementById("ssggendyear");
		let ssggEmonth= document.getElementById("ssggendmonth");
	ssggbutton.addEventListener("click",function(){
		
	
			alert("버튼 눌름. ajax 가동.")
			
			var xhttp= new XMLHttpRequest();
			startyear= ssggSyear.value
			startmonth= ssggSmonth.value
			endyear= ssggEyear.value			
			endmonth=ssggEmonth.value
			
			console.log(ssggSyear+","+ssggSmonth+"~"+ssggEyear+","+ssggEmonth)			
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
				var data= JSON.stringify({"startyear":startyear,"startmonth":startmonth,
					"endyear":endyear, "endmonth":endmonth });
				console.log(data)
				
				xhttp.send(data);//sfy해서 서버에보냄	
				})
	
	
	
	
		
	
	
	
	
	
	
	
})


	
	





</script>





</head>
<body>

값이 있는가?ㅣ: ${!empty data }

<form action="graphView" >
<!-- let ssggSyear= document.getElementById("ssggstartyear");
		let ssggSmonth= document.getElementById("ssggstartmonth");	
		let ssggEyear= document.getElementById("ssggendyear");
		let ssggEmonth= document.getElementById("ssggendmonth"); -->
시작년월
<select id="ssggstartyear">
<option>연</option>
<c:forEach var="yyyy" begin="2010" end="2021" step="1" >
<option>${yyyy}</option>
</c:forEach>


</select>년
<select id="ssggstartmonth">
<option>월</option>
<c:forEach var="MM" begin="1" end="12" step="1" >
<option>${MM}</option>
</c:forEach>
</select>월
<br>
종료연월
<select id="ssggendyear">
<option>연</option>
<c:forEach var="yyyy" begin="2010" end="2021" step="1" >
<option>${yyyy}</option>
</c:forEach>
</select>년
<select id="ssggendmonth">
<option>월</option>
<c:forEach var="MM" begin="1" end="12" step="1" >
<option>${MM}</option>
</c:forEach>
</select>월



<br>
<button id="graphdateGoBtn"  type="button">조회하기</button>

</form>
<div id="salesGraphWrapper" >
<c:if test="${not empty data}">
<c:forEach  items="${data}"  var= "i">
<div> ${i.movietitle } </div>
<div> ${i.salesprice } </div>
<div> ${i.sales_time } </div>
<hr /> 
</c:forEach>

</c:if>

</div>

</body>
</html>