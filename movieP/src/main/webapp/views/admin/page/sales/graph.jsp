<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

값이 있는가?ㅣ: ${!empty data }

<form action="graphView" >
시작날짜<input type="date" name="startdate" />
시작날짜<input type="date" name="enddate" />

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