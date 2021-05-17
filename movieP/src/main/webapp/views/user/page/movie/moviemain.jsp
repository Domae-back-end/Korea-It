<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>movie main</title>
<% int cnt =0; %>
<c:forEach items="${moviedata }">
	<% cnt = cnt+1; %>
</c:forEach>
<script src="<c:url value="/my_js/jquery-3.6.0.js"/>"></script>
<script>

$(function(){
	
	$(".btn1").click(function(){
		console.log($(this).html());
		$.ajax({
			url:"/views/user/page/movie/inputdata.jsp",
			data:{kind:$(this).html(), dd:"${moviedatabefore}"}, 
			success:function(data){
				$(".wrapper").html(data)
			},
			error:function(e){
				alert(e.responseText)
			}
		})
	})
	
		$(".btn2").click(function(){
		console.log($(this).html());
		$.ajax({
			url:"/views/user/page/movie/inputdata.jsp",
			data:{kind:$(this).html(), dd:"${moviedataafter}"}, 
			success:function(data){
				$(".wrapper").html(data)
			},
			error:function(e){
				alert(e.responseText)
			}
		})
	})
	
	
})	

</script>

<style>
	.wrapper{
		width: 1000px;
		height: 100%;
		margin-left: 150px;
	}

	.pp{
		background: #a0a;
		color: white;
		width: 800px;
		margin-left: 200px;

	}
	
	.pp>div{
		display: inline-block;
		width: 250px;
		font-size: 30px;	
	}	
	.pp>div>a{
		text-decoration: none;
	}
	.wrapper>table{
		display: inline-block;
		margin: 35px;
	}
	.wrapper>table>tr{
		width: 200px;
		
	}
	#pos>img{
		width:250px;
		height:400px;
	}

</style>

</head>
<body>
	<div class = "pp">
		<div class ="btn1">boxoffice</div>
		<div class ="btn2">expect</div>
	</div>
<div class = "wrapper">

</div>

</body>
</html>