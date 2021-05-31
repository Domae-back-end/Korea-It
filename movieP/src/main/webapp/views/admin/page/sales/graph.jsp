<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<script>

$(document).ready(function(){
	
	
	
	var ssggbutton= document.getElementById("graphdateGoBtn") 
		let ssggSyear= document.getElementById("ssggstartyear");
		let ssggSmonth= document.getElementById("ssggstartmonth");	
		let ssggEyear= document.getElementById("ssggendyear");
		let ssggEmonth= document.getElementById("ssggendmonth");
		
	var myChart 	
		
		
	ssggbutton.addEventListener("click",function(){
		
		
			
		
	
		
			
			// 월값, 금액정보 배열 
			var coldata = new Array();
			var moneydata = new Array();
			
			
			var xhttp= new XMLHttpRequest();
			startyear= ssggSyear.value
			startmonth= ssggSmonth.value
			endyear= ssggEyear.value			
			endmonth=ssggEmonth.value
			
			
			if(startyear==='연'||startmonth==='월'||endyear==='연'||endmonth==='월'){
				alert("박스를 모두 선택하세요!");				
				
				
				
				
				
			}else{
			
			
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
					// 만약 parsed 가 2개 이상이면..
					for(var rr in parsed){
						console.log(rr)
						coldata.push(rr)
						console.log("대답:"+parsed[rr])
						moneydata.push(parsed[rr])
						if(rr==='answer'){
							coldata.pop()
							moneydata.pop()
						}
						
					}// 출력 
					

					// 우선 컨텍스트를 가져옵니다. 
					
					var cnvs= document.getElementById("myChart")
					var ctx = document.getElementById("myChart").getContext('2d');
					ctx.clearRect(0, 0, cnvs.width, cnvs.height);
					ctx.beginPath();
					/*
					- Chart를 생성하면서, 
					- ctx를 첫번째 argument로 넘겨주고, 
					- 두번째 argument로 그림을 그릴때 필요한 요소들을 모두 넘겨줍니다. 
					*/
					if(myChart!=null){
					myChart.destroy();
					}
					myChart  = new Chart(ctx, {
					    type: 'bar',
					    data: {
					       labels: coldata,//배열
					        datasets: [{
					            label: '매출액 현황',
					            data: moneydata,
					            backgroundColor: [
					                'rgba(255, 99, 132, 0.2)',
					                'rgba(54, 162, 235, 0.2)',
					                'rgba(255, 206, 86, 0.2)',
					                'rgba(75, 192, 192, 0.2)',
					                'rgba(54, 162, 235, 0.2)',
					                'rgba(255, 206, 86, 0.2)',
					                'rgba(75, 192, 192, 0.2)',
					                'rgba(153, 102, 255, 0.2)',
					                'rgba(255, 159, 64, 0.2)'
					            ],
					            borderColor: [
					                'rgba(255,99,132,1)',
					                'rgba(54, 162, 235, 1)',
					                'rgba(255, 206, 86, 1)',
					                'rgba(255,99,132,1)',
					                'rgba(54, 162, 235, 1)',
					                'rgba(255, 206, 86, 1)',
					                'rgba(75, 192, 192, 1)',
					                'rgba(153, 102, 255, 1)',
					                'rgba(255, 159, 64, 1)'
					            ],
					            borderWidth: 1
					        }]
					    },
					    options: {
					        maintainAspectRatio: true, // default value. false일 경우 포함된 div의 크기에 맞춰서 그려짐.
					        scales: {
					            yAxes: [{
					                ticks: {
					                    beginAtZero:true
					                }
					            }]
					        }
					    }
					});// ajax 결과잘 온 경우 행동 끗.

					
					
					
					
					
					
					
						

				}
				}};
				//
				xhttp.open("POST","/salesGraphSltView.do",true);
				xhttp.setRequestHeader(
				          "Content-Type",
				          //"application/x-www-form-urlencoded"슈레기
				 		"application/json"//이게 개꿀.       
				);
				var data= JSON.stringify({"startyear":startyear,"startmonth":startmonth,
					"endyear":endyear, "endmonth":endmonth });
				console.log("cccccc:"+data)
				
				xhttp.send(data);//sfy해서 서버에보냄	
				}})
	
	
	
	
		
	
	
	
	
	
	
	
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
<c:forEach var="yyyy" begin="0" end="22" step="1" >
<option>${2021-yyyy}</option>
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
<c:forEach var="yyyy" begin="0" end="22" step="1" >
<option>${2021-yyyy}</option>
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
<button id="graphdateGoBtn2"  type="button">관별로보기</button> 
<button id="graphdateGoBtn3"  type="button">통합보기</button> 
<hr />




<div style="width:800px">
    <canvas id="myChart"></canvas>
</div>




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