<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>

	#reviewwrapper{
		border: 3px solid #000;
		width: 1000px;
		display: inline-block;
		text-align: left;
	}
	
	#aa{
		border: 1px solid #a0a;
	}
	#userinfo{
		display: inline-block;
		border: 2px solid #ccc;
		text-align: left;
		width: 300px;
	}
	#content{
		display: inline-block;
	}
	#del{
		background: cyan;
		display: inline-block;
	}
	#id{
		font-size:20px;
	}
	#p{
		margin-left: 50px;
		text-align:center;
		width: 830px;
		height: 70px;
	}
	#b{
		text-align:center;
		width: 100px;
		height:50px;
	}
	#myr>#aa{
		background: "red";
	}

</style>

<script>
	function deleteGo(idx){
		//console.log(idx)
		// cate영화의, idx 번 글 삭제. 
		//console.log("/user/movie/reviewdeleteReg?cate="+${param.ind}+"&cnt="+idx)
		location.href = "/user/movie/reviewdeleteReg?cate="+${param.ind}+"&cnt="+idx
		
	}
	
	$(document).ready(function() {


	    $('#p').on('keyup', function() {


	        if($(this).val().length > 100) {
	        	alert("관람평은 100글자이상 쓸 수 없습니다.")
	            $(this).val($(this).val().substring(0, 100));
	        }


	    });


	});
	
</script>
<div id="reviewwrapper">
<form id="reviewForm" action="reviewinsertReg" method="post" name="reviewgo">
<textarea name="postcontent" id="p" rows="1" cols="200" onKeyUp="javascript:fnChkByte(this,'500')"></textarea>
<input type="hidden" name="cate" id="cate" value="${param.ind}" />
<input type="hidden" name="cnt" id="cnt"  />
<input type="submit" value="관람평 작성" id="b">
</form>
<div id= "myr">
<c:if test="${myreview != null}">
<div id = "aa" style="border: 3px dotted #f00">
	<div id= "userinfo">
		<div id="id">${myreview.userid }</div>
		<div id="time">${myreview.posttime_s }</div>
	</div>
	<div id= "content">${myreview.postcontent }</div>
	<div id="del"> <a href="javascript:deleteGo(${myreview.cnt})">삭제하기</a></div>
</div>
<hr>
</c:if>
</div>
<c:forEach items="${moviereview }" var="r" varStatus="no">
<div id = "aa">
	<div id= "userinfo">
		<div id="id">${r.userid }</div>
		<div id="time">${r.posttime_s }</div>
	</div>
	<div id= "content">${r.postcontent }</div>
	<div id="del"> <a href="javascript:deleteGo(${r.cnt})">삭제하기</a></div>
</div>
</c:forEach>



</div>