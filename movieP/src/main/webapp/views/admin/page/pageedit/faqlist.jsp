<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	* {padding: 0px; margin: 0px; }
	ul, li {text-decoration: none; list-style: none; }
	a {text-decoration: none; }
	
	
	
	/* FAQ 조회하기 */
	.td1 {font-size: 16px; border-top: 1px solid gray; border-bottom: 1px solid gray; border-spacing: 0; }
	.td1 tr:nth-of-type(2)>td {background: yellow; font-weight: bold; border-bottom: 1px solid gray; }
	.td1 tr:nth-of-type(2)>td:nth-of-type(1) {width: 50px;  }
	.td1 tr:nth-of-type(2)>td:nth-of-type(2) {width: 100px;  }
	.td1 tr:nth-of-type(2)>td:nth-of-type(3) {width: 430px;  }
	.td1 tr:nth-of-type(2)>td:nth-of-type(4) {width: 120px;  }
	.td1 tr:nth-of-type(2)>td:nth-of-type(5) {width: 100px;  }
	
</style>

<title>자주찾는질문관리</title>


<script type="text/javascript">

$(function() {
	$(".pbtn").click(function(){ //페이지번호
		alert("눌렀냐?"+$(this).attr("pagetoGo"))
		$("#pageIN").val($(this).attr("pagetoGo"))
		faqform.submit()
	})
	
	
	$("#allChk").click(function() {
		//alert("전체선택");
		var chk = $("#allChk").prop("checked");

		if (chk) {
			$(".ggno").prop("checked", true);
		} else {
			$(".ggno").prop("checked", false);
		}

	})
	
	$(".postno").click(function(){
		$("#allChk").prop("checked", false);
	});
	

	$(".deleteGo").click(function() {
		var confirm_val = confirm("정말 삭제하시겠습니까?");
		
		if (confirm_val) {
			var delArr = new Array();

			$("input[class='ggno']:checked").each(function() {
				delArr.push($(this).attr("value"));
				/* alert($(this).attr("value")) */
			});

			$.ajax({
				url : "faqdeleteReg",
				type : "post",
				data : {
					delArr : delArr
					},
				success : function(res) {
						/* text.indexOf(findString)
						console.log(res) */ 
					if (res.indexOf("삭제 성공") != -1) {
						alert(delArr+"번 삭제성공!");
						location.href = "faqlist";
					} else {
						alert("체크박스를 선택하세요!");
					}
				}
			});
		}
	});
	

})














	var bbb=0
	function detailGo(aa) { // 제이쿼리안씀.
		
			console.log(bbb+",지금눌린거"+aa)
			//var before = aa+""
			//alert("디테일 고 누름."+aa+"+"+bbb)			
			var clicked= document.getElementById(aa+"")
			var prevclicked= document.getElementById(bbb+"")
			bbb=aa
			clicked.style.display= "block"
			prevclicked.style.display="none"
				
				
			
			
			
				}

	console.log("디테일 고 누름."+before)	

</script>

</head>


<body>
<h2>자주찾는질문관리</h2>

<div class="faqwrap " id="faqwrap">
			<!-- 구분 시스템, 영화관, 기타 -->
				<form action="faqlist" name="faqform">
				
			<table class="table table-striped">
				 <thead>
					<td colspan="5" style="text-align: right; ">
						
						<a href="faqinsert">글쓰기</a>
						<!-- <button type="button" class="modifyGo">선택글수정하기</button>  -->
						<button type="button" class="deleteGo" >선택글삭제하기</button>
						
					<!-- 	<a href="admin/pageedit/faqdelete">삭제하기</a> -->
					</td>
				</thead>
				<tr>
					<td><input type="checkbox" name="allChk" id="allChk"/> 번호</td>
					<td>구분</td>
					<td>제목</td>
				
				</tr>
			<c:forEach items="${data.sfDTO }" var="faqDTO">
				<tr id="${faqDTO.bqindex }">
					
					
					<td>${faqDTO.bqcate }</td>
					<td style="border: 1px solid;">
					<a href="javascript:detailGo(${faqDTO.bqindex })">${faqDTO.bqtitle }</a></td>
					
					<td><a href="faqmodify?bqindex=${faqDTO.bqindex }">수정하기</a></td>
					
				</tr>
				<tr><td colspan="3" id="${faqDTO.bqindex }" style="display: none;">${faqDTO.bqcont }</td> </tr>
			</c:forEach>

			
			
			
			<tr>
				<td colspan="5" align="center"><c:if
						test="${data.pdto.startPage > 1}">
						<%-- <a href="?page=${data.pdto.startPage-1}"> < </a> --%>

						<input type="button" class="btn pbtn"
							pagetoGo="${data.pdto.startPage-1}" value="&lt;" />
					</c:if> <c:forEach begin="${data.pdto.startPage}"
						end="${data.pdto.endPage }" step="1" var="i">
						<c:choose>
							<c:when test="${i==data.pdto.page }">
						[${i }]
					</c:when>
							<c:otherwise>
								<input type="button" class="btn pbtn" pagetoGo="${i }" value="${i }" />
								<%-- 	<a href="?page=${i }">${i }</a>	 --%>
							</c:otherwise>
						</c:choose>

					</c:forEach> <c:if test="${data.pdto.endPage < data.pdto.total}">
						<%-- <a href="?page=${data.pdto.endPage+1}&cnt=${data.bdto.cnt}"> > </a> --%>
						<input type="button" class="btn pbtn" pagetoGo="${data.pdto.endPage+1}"
							value="&gt;" />
					</c:if></td>
			</tr>
			
			
			
			
			
			
			
			
			</table>
			<input type="hidden" name="page" value="1" id="pageIN" />
		</form>
		</div>
</body>
</html>