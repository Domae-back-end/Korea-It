<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css" href="/resources/css/movie/5star.css" />
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
<style>

	#reviewwrapper{
		border: 3px solid #000;
		width: 1000px;
		display: inline-block;
		text-align: left;
	}
	
	#aa{
		border: 1px solid #a0a;
		height: 60px;
	}
	#userinfo{
		display: inline-block;
		border: 2px solid #ccc;
		text-align: left;
		width: 300px;
		height: 60px;
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
		width: 530px;
		height: 70px;
	}
	#b{
		height: 60px;
	}
	#myr>#aa{
		background: "red";
	}
	 #star{
		 height: 60px;
		 line-height:60px; 
	 }
	 #star>i{
	 	color:gold;
	 }
	#del{
		float: right;
	}

</style>

<script>

	$(function(){
		
		$(".btn").click(function(){
			$("#pageIN").val( $(this).attr("dd") )
			reviewpage.submit()
		})
	})
	
	function checkstar(){

		if($("#p").val() == ""){
			alert("내용을 등록하세요");
			return false;
		}
		
		var Value = $('input:radio[name=gpa]:checked').val();
		if( Value==null){
			alert("평점을 등록하세요");
			return false;
		}
		return true;
		
	}
	
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

<form name = "reviewpage">
	<input type="hidden" name="page" id="pageIN" value="${data.pdto.page}" />
	<input type="hidden" name="ind" id="cate" value="${param.ind}" />
	<input type="hidden" name="sub" id="review" value="review" />
</form>
<div id="reviewwrapper">
<form id="reviewForm" action="reviewinsertReg" method="post" name="reviewgo" onsubmit="return checkstar()">
<ul class="rate-area">
  <input type="radio" id="5-star" id = "gpa" name="gpa" value="5" /><label for="5-star" title="Amazing" checked>5 stars</label>
  <input type="radio" id="4-star" id = "gpa" name="gpa" value="4" /><label for="4-star" title="Good">4 stars</label>
  <input type="radio" id="3-star" id = "gpa" name="gpa" value="3" /><label for="3-star" title="Average">3 stars</label>
  <input type="radio" id="2-star" id = "gpa" name="gpa" value="2" /><label for="2-star" title="Not Good">2 stars</label>
  <input type="radio" id="1-star" id = "gpa" name="gpa" value="1" /><label for="1-star" title="Bad">1 star</label>
</ul>
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
	<div id="star" style="display:inline-block;">
		<c:forEach begin="1" end="${myreview.gpa }" var="st" varStatus="no">
		<i class="fas fa-star"></i>
		</c:forEach>
		<c:forEach begin="1" end="${5-myreview.gpa }" var="st">
			<i class="far fa-star"></i>
		</c:forEach>
	</div>
	<div id= "content">${myreview.postcontent }</div>
	<div id="del"> <a href="javascript:deleteGo(${myreview.cnt})">삭제하기</a></div>
</div>
<hr>
</c:if>
</div>
<c:forEach items="${moviereview.mrd }" var="r" varStatus="no">
<div id = "aa">
	<div id= "userinfo">
		<div id="id">${r.userid }</div>
		<div id="time">${r.posttime_s }</div>
	</div>

	<div id="star" style="display:inline-block">
		<c:forEach begin="1" end="${r.gpa }" var="st" varStatus="no">
		<i class="fas fa-star"></i>
		</c:forEach>
		<c:forEach begin="1" end="${5-r.gpa }" var="st">
			<i class="far fa-star"></i>
		</c:forEach>
	</div>
	<div id= "content">${r.postcontent }</div>
	<div id="del"> <a href="javascript:deleteGo(${r.cnt})">삭제하기</a></div>
</div>
</c:forEach>
<c:if test="${moviereview.pdto.startPage > 1}">
		    	
   <input type="button" class="btn" dd="${moviereview.pdto.startPage-1}" value="&lt" />
    	
    </c:if>	
	<c:forEach begin="${moviereview.pdto.startPage}" end="${moviereview.pdto.endPage }" step="1" var="i">
		<c:choose>
			<c:when test="${i==moviereview.pdto.page }">
				[${i }]
			</c:when>
			<c:otherwise>
				<input type="button" class="btn" dd="${i }" value="${i }" />	
			</c:otherwise>
		</c:choose>
		
	</c:forEach>
	<c:if test="${moviereview.pdto.endPage < moviereview.pdto.total}">
		<input type="button" class="btn" dd="${moviereview.pdto.endPage+1}" value="&gt" />	
	</c:if>	


</div>