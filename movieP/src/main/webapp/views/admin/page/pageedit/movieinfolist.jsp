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
<h2>


<script>
$(function() {
	$(".pagego").click(function(){ //페이지번호
		//alert("눌렀냐?"+$(this).attr("dd"))
		$("#pageIN").val($(this).attr("dd"))
		frm.submit()
	})
})



function detailGo(aa) { //디테일페이지꺼
	alert("detailGo 눌렀냐?"+aa)
	frm.action = "midetail"
	
	$("#detailId").val(aa)
	//m_index로 이
	
	alert(aa+"번으로 이동")
	frm.submit()
}


</script>



영화정보관리리스트${data.pdto.ttt}</h2>



    <form action="" name="frm">
    <input type="hidden" name="page" id="pageIN" value="${data.pdto.page}" />
		<input type="hidden" name="m_index" id="detailId" />
	<br>
	
		<div class="search">
		<a href="serviceNotice">초기화</a>
			<select name="mis_kind">
				<option value="movietitle" <c:if test="${data.midto.mis_kind == 'movietitle' }"> selected="selected"</c:if>>제목</option>
				<option value="mdir" <c:if test="${data.midto.mis_kind == 'mdir' }"> selected="selected"</c:if>>감독</option>
			</select>
			<input type="text" name="mis_key" value="${data.midto.mis_key }"/> <!-- 요놈이문제 -->
			<input type="submit" value="검색" class="smtGo" />
		</div>
		
    
  <table class="table table-striped">
  
    <thead>
      <tr>
        <th>영화제목</th>
        <th>감독명</th>
            <th>개봉일</th>
        <th>배우</th>
            <th>카테고리</th>
                <th>메인포스터</th>
      </tr>
    </thead>
    <tbody>

<c:forEach var="i" items="${data.movielist }" >
      <tr>
        <%-- <td>${i }체크박스</td> --%>
        <td>
        <a href="javascript:detailGo(${i.m_index})">${i.movietitle }<%-- ${nDTO.noticetitle } --%></a>
        </td>
        <td>${i.mdir }&nbsp; </td>
         <td>${i.mdate }</td>
         
        <td>${i.mactrs }</td>
         <td>${i.mcate }</td>
         <td><img src='<c:url value="/${i.posterUrl }"/>' alt="안보여" style="width: 40px;height:60px;" /></td>
         
      </tr>
   
</c:forEach>

		<tr>
					<td colspan="5" align="center">
					
						<c:if test="${data.pdto.startPage > 1 }">
							<input type="button" class="pagego btn btn-warning" dd="${data.pdto.startPage-1 }" value="&lt" />	
						</c:if>
						
						<c:forEach begin="${data.pdto.startPage }" end="${data.pdto.endPage }" step="1" var="i">
							<c:choose>
								<c:when test="${i==data.pdto.page }">
									[${i }]
								</c:when>
								<c:otherwise>
									<input type="button" class="pagego btn btn-warning" dd="${i }" value="${i }" />
								</c:otherwise>
							</c:choose>
						</c:forEach>
						
						<c:if test="${data.pdto.endPage < data.pdto.total }">
							<input type="button" class="pagego btn btn-warning" dd="${data.pdto.endPage+1 }" value="&gt" />
						</c:if>
					
					
					
					</td>
				</tr>



  <tr>
        <td colspan="5"> 
        <a href="movieinfoinsert">글쓰기</a>
        
        </td>
       
      </tr>
 
    </tbody>
  </table>
     </form>

</body>
</html>