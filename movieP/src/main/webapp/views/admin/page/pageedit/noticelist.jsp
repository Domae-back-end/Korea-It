<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	* {padding: 0px; margin: 0px; }
	ul, li {text-decoration: none; list-style: none; }
	a {text-decoration: none; }

	
	/* 공지테이블 */
	.td1 {font-size: 16px; border-top: 1px solid gray; border-bottom: 1px solid gray; border-spacing: 0; }
	.td1 tr:nth-of-type(1)>td a, 
	.td1 tr:nth-of-type(1)>td button {width: 60px; height: 30px; line-height: 30px; display: inline-block;
									text-align: center; border: none; border-radius: 5px; background: #dbdbdb; color: black; }
	.td1 tr:nth-of-type(1)>td a:hover, 
	.td1 tr:nth-of-type(1)>td button:hover {text-decoration: underline; color: black; }
	
	.td1 tr:nth-of-type(2)>td {background: yellow; font-weight: bold; border-bottom: 1px solid gray; }
	.td1 tr td {height: 30px; }
	.td1 tr:nth-of-type(2)>td:nth-of-type(1) {width: 100px;  }
	.td1 tr:nth-of-type(2)>td:nth-of-type(2) {width: 100px;  }
	.td1 tr:nth-of-type(2)>td:nth-of-type(3) {width: 400px;  }
	.td1 tr td:nth-of-type(3) {text-align: left;   }
	.td1 tr:nth-of-type(2)>td:nth-of-type(4) {width: 100px;  }
	.td1 tr:nth-of-type(2)>td:nth-of-type(5) {width: 100px;  }
	.td1 tr:last-of-type {height: 100px; }
	
	
	
</style>

<title>공지뉴스/리스트</title>
</head>

<script>
	$(function() {
		$(".btnnn").click(function(){ //페이지번호
			//alert("눌렀냐?"+$(this).attr("dd"))
			$("#pageIN").val($(this).attr("dd"))
			frm.submit()
		})
		
		
		$("#allChk").click(function() {
			//alert("전체선택");
			var chk = $("#allChk").prop("checked");

			if (chk) {
				$(".postno").prop("checked", true);
			} else {
				$(".postno").prop("checked", false);
			}

		})
		
		$(".postno").click(function(){
			$("#allChk").prop("checked", false);
		});
		

		$(".deleteGo").click(function() {
			var confirm_val = confirm("정말 삭제하시겠습니까?");
			
			if (confirm_val) {
				var checkArr = new Array();
	
				$("input[class='postno']:checked").each(function() {
					checkArr.push($(this).attr("value"));
					/* alert($(this).attr("value")) */
				});
	
				$.ajax({
					url : "noticedeleteReg",
					type : "post",
					data : {
						checkArr : checkArr
						},
					success : function(res) {
							/* text.indexOf(findString)
							console.log(res) */ 
						if (res.indexOf("삭제 성공") != -1) {
							alert(checkArr+"번 삭제성공!");
							location.href = "noticelist";
						} else {
							alert("체크박스를 선택하세요!");
						}
					}
				});
			}
		});
		
		
		$(".modifyGo").click(function() {
			var modArr = new Array();
			
			$("input[class='postno']:checked").each(function() {
				modArr.push($(this).attr("value"));
			});
			
			
			if (modArr.length == 1) {
				confirm(modArr+"번을 수정하시겠습니까?");
				location.href = "noticemodify?page="+${data.snpdto.page }+"&noticeindex="+modArr;
				
				
			}else if (modArr.length > 1) {
				alert("하나만 선택해주세요~");
				location.href = "noticelist?page="+${data.snpdto.page }
			}else {
				alert("선택먼저 하시죠?");
				location.href = "noticelist?page="+${data.snpdto.page }
			}
			
			
		})
	})
	
	
	function detailGo(aa) { //디테일페이지꺼
		
		frm.action = "noticedetail"
		
		$("#detailId").val(aa)
		
		
		frm.submit()
	}
	
</script>

<body>
<h2>공지/뉴스 게시판 리스트</h2>

<div class="notice_tb">
	<form action="" name="frm">
		<input type="hidden" name="page" id="pageIN" value="${data.snpdto.page}" />
		<input type="hidden" name="noticeindex" id="detailId" />
		
			<!-- 구분 시스템, 영화관, 기타 -->
			<table class="td1">
				<tr>
					<td colspan="5" style="text-align: right; ">
						<a href="noticeinsert?page=${data.snpdto.page }">글쓰기</a>
						<button type="button" class="modifyGo">수정</button>
						<button type="button" class="deleteGo" >삭제</button>
					</td>
				</tr>
				<tr>
					<td><input type="checkbox" name="allChk" id="allChk"/> 번호</td>
					<td>구분</td>
					<td>제목</td>
					<td>등록일</td>
					<td>조회수</td>
				</tr>
			<c:forEach items="${data.sfdto }" var="nDTO" varStatus="no" >
				<tr>
					<td><input type="checkbox" name="postno" class="postno" value="${nDTO.noticeindex }"/> ${nDTO.noticeindex }</td>
					<td>${nDTO.noticecateKr }</td>
					<td><a href="javascript:detailGo(${nDTO.noticeindex })">${nDTO.noticetitle }</a></td>
					<td>
						<fmt:formatDate value="${nDTO.noticetime}" type="both" pattern="yyy.MM.dd"/>					
					</td>
					<td>${nDTO.noticeview }</td>
				</tr>
			</c:forEach>

			
			
			
				<tr>
					<td colspan="5" align="center">
					
						<c:if test="${data.snpdto.startPage > 1 }">
							<input type="button" class="btnnn btn btn-warning" dd="${data.snpdto.startPage-1 }" value="&lt" />	
						</c:if>
						
						<c:forEach begin="${data.snpdto.startPage }" end="${data.snpdto.endPage }" step="1" var="i">
							<c:choose>
								<c:when test="${i==data.snpdto.page }">
									[${i }]
								</c:when>
								<c:otherwise>
									<input type="button" class="btnnn btn btn-warning" dd="${i }" value="${i }" />
								</c:otherwise>
							</c:choose>
						</c:forEach>
						
						<c:if test="${data.snpdto.endPage < data.snpdto.total }">
							<input type="button" class="btnnn btn btn-warning" dd="${data.snpdto.endPage+1 }" value="&gt" />
						</c:if>
					
					
					
					</td>
				</tr>
			
			
			
		</table>
	</form>
</div>
</body>
</html>