<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
$(function() {
	function detailGo(aa) { //디테일페이지꺼
		alert("detailGo 눌렀냐?"+aa)
		frm.action = "noticedetail"
		
		$("#detailId").val(aa)
		
		alert(aa+"번으로 이동")
		frm.submit()
	}
	
	$("#movinfodelete").click(function() {
		var confirm_val = confirm("정말 삭제하시겠습니까?");
		
		if (confirm_val) {
			var deleteno;
			deleteNo= ($(this).attr("value"));
			alert(deleteNo);
			$.ajax({
				url : "movieinfoDelReg",
				type : "post",
				data : {
					deleteNo : deleteNo
					},
				success : function(res) {
						
						console.log(res)
					if (res.indexOf("삭제 성공") != -1) {
						alert(deleteNo+"번 삭제성공!");
						location.href = "movieinfolist";
					} else {
						alert("삭제가 취소되었습니다!");
					}
				}
			});
		}
	});
	
	$("#movinfomodify").click(function() {
		var modArr = new Array();
		
		modArr.push($(this).attr("value"));
		
		
		if (modArr.length == 1) {
			confirm(modArr+"번을 수정하시겠습니까?");
			location.href = "movieinfomodify?page="+${data.pdto.page }+"&m_index="+${data.midto.m_index };
		}
		
		
	})
})





</script>
<style>
	#bannercontainer{
		
	
	}


</style>

<body>영화제목 : ${data.midto.movietitle} :: 디테일 <br>




<div  id="upperpart">
<button type="button" id="movinfomodify" class="btn btn-info" value="${data.midto.m_index}" >수정</button>
<button type="button" id="movinfodelete" class="btn btn-info" value="${data.midto.m_index}">삭제</button>

</div>

<div  id="detailwrapper">
<div  id="mtitlepart">
<h1>제목 :  ${data.midto.movietitle} }</h1>
</div>


<div id="contentpart">
<h2>줄거리</h2>
${data.midto.mplotBr}

</div>


<div id="bottompart">
	
	<button type="button" id="golist" class="btn btn-warning">	<a href="movieinfolist?page=${data.pdto.page }">목록${data.pdto.page }</a></button>
	
</div>
<div class="back_list">
			
			</div>



</div>





</body>