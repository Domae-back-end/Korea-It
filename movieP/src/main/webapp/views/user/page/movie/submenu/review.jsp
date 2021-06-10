<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css" href="/resources/css/movie/5star.css" />
<link rel="stylesheet" type="text/css" href="/resources/css/movie/5star2.css" />
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>


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
	
	function checkstar2(){

		if($("#myp").val() == ""){
			alert("내용을 등록하세요");
			return false;
		}
		
		var Value = $('input:radio[name=rating1]:checked').val();
		if( Value==null){
			alert(Value+" 평점을 등록하세요");
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
	
	function ModifyForm(idx, postcontent){
		
		var value = '<div class="rating-css" style="display: inline-block"><div class="star-icon">'
		      +'<input type="radio" name="rating1" id="rating1" value="1" checked>'
	      +'<label for="rating1" class="fa fa-star"></label>'
	      +'<input type="radio" name="rating1" id="rating2" value="2">'
	      +'<label for="rating2" class="fa fa-star"></label>'
	      +'<input type="radio" name="rating1" id="rating3" value="3">'
	      +'<label for="rating3" class="fa fa-star"></label>'
	      +'<input type="radio" name="rating1" id="rating4" value="4">'
	      +'<label for="rating4" class="fa fa-star"></label>'
	      +'<input type="radio" name="rating1" id="rating5" value="5">'
	      +'<label for="rating5" class="fa fa-star"></label>'
	      +'</div></div>';
		$('#mystar').html(value)
		$('#mycontent').html('<textarea name="postcontent" id="p" rows="1" cols="200"/>${myreview.postcontent} </textarea>');
		$('#del').html('')
		$('#mod').html('<input type="submit" value="수정"/>')
		
	}
	
	

	
	$(document).ready(function() {


	    $('textarea').on('keyup', function() {

	        if($(this).val().length > 100) {
	        	alert("관람평은 100글자이상 쓸 수 없습니다.")
	            $(this).val($(this).val().substring(0, 100));
	        }


	    });
	    
	    
	
	    


	});
	
	$(window).ready(function() {
	    $('textarea').on('keyup', function() {

	        if($(this).val().length > 70) {
	        	alert("관람평은 70글자이상 쓸 수 없습니다.")
	            $(this).val($(this).val().substring(0, 70));
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
		<div id="formset" style="text-aglin: left; height:60px;">
			<c:if test="${sessionId !=null}">
				<div id = "sid">${sessionId }</div>
			</c:if>
			<ul class="rate-area" style="margin-left: 20px;">
			  <input type="radio" id="5-star" id = "gpa" name="gpa" value="5" /><label for="5-star" title="Amazing" checked>5 stars</label>
			  <input type="radio" id="4-star" id = "gpa" name="gpa" value="4" /><label for="4-star" title="Good">4 stars</label>
			  <input type="radio" id="3-star" id = "gpa" name="gpa" value="3" /><label for="3-star" title="Average">3 stars</label>
			  <input type="radio" id="2-star" id = "gpa" name="gpa" value="2" /><label for="2-star" title="Not Good">2 stars</label>
			  <input type="radio" id="1-star" id = "gpa" name="gpa" value="1" /><label for="1-star" title="Bad">1 star</label>
			</ul>
			<textarea name="postcontent" id="p" rows="1" cols="200" placeholder="관람평을 입력 해 주세요. 최대 100글자까지 가능합니다."></textarea>
			<input type="hidden" name="cate" id="cate" value="${param.ind}" />
			<input type="hidden" name="cnt" id="cnt"  />
			<input type="submit" value="관람평 작성" id="b">
		</div>
	</form>

<c:if test="${myreview !=null }">
<div id= "myr">
<div id = "aa" style="border: 3px dotted #f00;">
<div style="display: inline-block; height: 60px;">
	<form id="reviewModifyForm" action="reviewModifyReg" method="post" onsubmit="return checkstar2()">
	<input id= "cnt" name="cnt" type="hidden" value="${myreview.cnt }"/>
	<input id= "cate" name="cate" type="hidden" value="${myreview.cate }"/>
	<div id= "userinfo">
		<div id="id">${myreview.userid }</div>
		<div id="time">${myreview.posttime_s }</div>
	</div>
	<div id="mystar" style="display:inline-block;">
			<c:forEach begin="1" end="${myreview.gpa }" var="st" varStatus="no">
			<i class="fas fa-star"></i>
			</c:forEach>
			<c:forEach begin="1" end="${5-myreview.gpa }" var="st">
				<i class="far fa-star"></i>
			</c:forEach>
		</div>
		<div id= "mycontent">${myreview.postcontent }</div>
		<div id="mod"> <a href="javascript:ModifyForm(${myreview.cnt}, '${myreview.postcontent }' )">
		<i class="fas fa-edit"></i>
		</a></div>
		<div id="del"> <a href="javascript:deleteGo(${myreview.cnt})">
		<i class="far fa-trash-alt"></i>
		</a></div>
	</form>
	</div>
</div>
</div>
</c:if>

<div style="color:white">dldkdkkdkd</div>
<c:forEach items="${moviereview.mrd }" var="r" varStatus="no">
<div id = "aa" style="text-align: left;">
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
</div>
</c:forEach>



<div id ="num">
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

</div>