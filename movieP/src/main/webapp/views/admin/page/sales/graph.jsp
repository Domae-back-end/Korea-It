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
	
	
	var getbuttons= document.getElementsByClassName('Btn');
	var sectorNo= document.getElementById("sectorNo");
	var ssggbutton= document.getElementById("graphdateGoBtn") 
		let ssggSyear= document.getElementById("ssggstartyear");
		let ssggSmonth= document.getElementById("ssggstartmonth");	
		let ssggEyear= document.getElementById("ssggendyear");
		let ssggEmonth= document.getElementById("ssggendmonth");
		
	var myChart 	
		
	
	
	function graphFunction(){			
			var BtnType= this.value;			
			
			// 월값, 금액정보 배열 
			var coldata = new Array();
			var moneydata = new Array();						
			var xhttp= new XMLHttpRequest();
			startyear= ssggSyear.value
			startmonth= ssggSmonth.value
			endyear= ssggEyear.value			
			endmonth=ssggEmonth.value			
			
			console.log(sectorNo.value +"::버튼 타입 :: " + BtnType)
			
			
			
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
					//console.log(parsed+",,,"+parsed.length)
					
					//var iterator = parsed.keys();
					//for(var keys of iterator){
					//	console.log(keys)
					//}
					
					console.log(parsed.message2)
					var cnt=0;
					for(var rr in parsed){
					
						coldata.push(rr)
						cnt++;
						moneydata.push(parsed[rr])
						if(rr==='answer'){
							coldata.pop()
							moneydata.pop()
						}
						
					}// 출력 
					
					
					console.log(cnt+"들어온 토탈 머니데이터"+moneydata.length)
					

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
					            backgroundColor: 
					            	
					            	[
					                'rgba(255, 99, 132, 0.2)',
					                'rgba(54, 162, 235, 0.2)',
					                'rgba(255, 206, 86, 0.2)',
					                'rgba(75, 192, 192, 0.2)',
					                'rgba(54, 162, 235, 0.2)',
					                'rgba(255, 206, 86, 0.2)',
					                'rgba(75, 192, 192, 0.2)',
					                'rgba(153, 102, 255, 0.2)',
					                'rgba(255, 159, 64, 0.2)'
					            ]
					        
					        ,
					            borderColor:
					            	
					            	[
					                'rgba(255,99,132,1)',
					                'rgba(54, 162, 235, 1)',
					                'rgba(255, 206, 86, 1)',
					                'rgba(255,99,132,1)',
					                'rgba(54, 162, 235, 1)',
					                'rgba(255, 206, 86, 1)',
					                'rgba(75, 192, 192, 1)',
					                'rgba(153, 102, 255, 1)',
					                'rgba(255, 159, 64, 1)'
					            ]
					        
					        
					        ,
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
				xhttp.open("POST","/salesGraphSltView",true);
				xhttp.setRequestHeader(	          "Content-Type",		 		"application/json"
				);
				var data= JSON.stringify({ "BtnType":BtnType, "sectorNo":sectorNo.value ,"startyear":startyear,"startmonth":startmonth,
					"endyear":endyear, "endmonth":endmonth });
				console.log("cccccc:"+data)				
				xhttp.send(data);//sfy해서 서버에보냄	
				}}
	
	
	
	
		
				//이벤트 리스너 설정 
				for(var i = 0; i< getbuttons.length; i++){
					getbuttons[i].addEventListener("click",graphFunction);
				}
				
				
	
	
	
	
	
})


	
	





</script>





</head>
<body>

<h1  id="saleswarning"> **${nowday}(전일) 까지의 정보만 표현됩니다 **</h1>

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
<button id="graphdateGoBtn" class="Btn" value="1"  type="button">달별로조회</button> 

<select id="sectorNo">
<option>관 전체</option><option>작은관</option><option>기존관</option><option>3D관</option><option>작은관1</option><option>작은관2</option><option>작은관3</option><option>기존관1</option><option>기존관2</option><option>기존관3</option>
<!-- set   -->
</select>

<button id="graphdateGoBtn" class="Btn" value="2"  type="button">관 선택조회하기</button> 
<button id="graphdateGoBtn" class="Btn" value="3"  type="button">통합보기</button> 

<!-- 
<button id="graphdateGoBtn2"  type="button">관별로보기</button> 
<button id="graphdateGoBtn3"  type="button">통합보기</button>  -->
<hr />




<div style="width:800px">
    <canvas id="myChart"></canvas>
</div>




</form>







<div id="salesGraphWrapper" >


	  <table class="table table-striped">
    <thead>
      <tr>
        <th>시간</th>
        <th>관 종류</th>
        <th>상품명/영화명</th>
        <th>순매출액</th>
        <th>매출액</th>
        <th>환불액</th>

      </tr>
    </thead>
    <tbody id="salegraphtablebody">
    
    
<c:forEach var="i"   items="${data.salist }">
      <tr>
        <td>${i.sales_index }</td>
          <td>${i.userid }</td>
        <td>${i.ticket_index }</td>
        <td>${i.salesprice }</td>

         <td>${i.sectorNo }</td>       
         <td>${i.sales_type }</td>
          <td>
          	<fmt:formatDate value="${i.sales_time }" type="both"
							pattern="yyy년MM월dd일  HH:mm:ss" />
          
          </td>
      </tr>
</c:forEach>

	<tr>
	<td colspan="8" align="center">
					
						<c:if test="${data.pdto.startPage > 1 }">
							<input type="button" class="pagebtn btn btn-warning" pageval="${data.pdto.startPage-1 }" value="&lt" />	
						</c:if>
						
						<c:forEach begin="${data.pdto.startPage }" end="${data.pdto.endPage }" step="1" var="i">
							<c:choose>
								<c:when test="${i==data.pdto.page }">
									<span class="btn btn-success">${i }</span>
								</c:when>
								<c:otherwise>
									<input type="button" class="pagebtn btn btn-warning" pageval="${i }" value="${i }" />
								</c:otherwise>
							</c:choose>
						</c:forEach>
						
						<c:if test="${data.pdto.endPage < data.pdto.total }">
							<input type="button" class="pagebtn btn btn-warning" pageval="${data.pdto.endPage+1 }" value="&gt" />
						</c:if>
					
					
	
	
	
	
	</tr>


    </tbody>    
   
    
    
    
  </table>
  



<%-- <c:if test="${not empty data}">
<c:forEach  items="${data}"  var= "i">
<div> ${i.movietitle } </div>
<div> ${i.salesprice } </div>
<div> ${i.sales_time } </div>
<hr /> 
</c:forEach>

</c:if> --%>
</div>

</body>
</html>