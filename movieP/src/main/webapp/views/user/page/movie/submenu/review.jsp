<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
	#reviewwrapper{
		border: 3px solid #000;
		width: 1000px;
		display: inline-block;
	}
	
	#aa{
		border: 1px solid #a0a;
	}
	#userinfo{
		display: inline-block;
		border: 2px solid #ccc;
		text-align: center;
	}
	#content{
		display: inline-block;
	}
	
	
</style>

<script>



		function deleteGo(idx){
			alert("idx:"+idx)
			console.log(idx)
			// cate영화의, idx 번 글 삭제. 
			
			console.log("/user/movie/reviewdeleteReg?cate="+${param.ind}+"&cnt="+idx)
			location.href = "/user/movie/reviewdeleteReg?cate="+${param.ind}+"&cnt="+idx
			
		}
	
	

</script>

<form id="reviewForm" action="reviewinsertReg" method="post" name="reviewgo">
<input type="text" name="postcontent">
<input type="hidden" name="cate" id="cate" value="${param.ind}" />
<input type="hidden" name="cnt" id="cnt"  />
<input type="submit" value="관람평 작성">


<div id="reviewwrapper">
<c:forEach items="${moviereview }" var="r" varStatus="no">
<div id = "aa">
	<div id= "userinfo">
		${r.userid }<br>
		${r.posttime_s }
	</div>
	<div id= "content">${r.postcontent }</div>
	<div> <a href="javascript:deleteGo(${r.cnt})">삭제하기</a> </button></div>
</div>
</c:forEach>



</div>
</form>
