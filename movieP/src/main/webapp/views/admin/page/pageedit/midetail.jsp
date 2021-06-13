<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
$(function() {
	function detailGo(aa) { //디테일페이지꺼
		//alert("detailGo 눌렀냐?"+aa)
		frm.action = "noticedetail"
		
		$("#detailId").val(aa)
		
		//alert(aa+"번으로 이동")
		frm.submit()
	}
	
	$("#movinfodelete").click(function() {
		var confirm_val = confirm("정말 삭제하시겠습니까?");
		
		if (confirm_val) {
			var deleteno;
			deleteNo= ($(this).attr("value"));
			//alert(deleteNo);
			$.ajax({
				url : "movieinfoDelReg",
				type : "post",
				data : {
					deleteNo : deleteNo
					},
				success : function(res) {
						
						console.log(res)
					if (res.indexOf("삭제 성공") != -1) {
						//alert(deleteNo+"번 삭제성공!");
						location.href = "movieinfolist";
					} else {
						//alert("삭제가 취소되었습니다!");
					}
				}
			});
		}
	});
	
	$("#movinfomodify").click(function() {
		var modArr = new Array();
		
		modArr.push($(this).attr("value"));
		
		
		if (modArr.length == 1) {
			//confirm(modArr+"번을 수정하시겠습니까?");
			location.href = "movieinfomodify?page="+${data.pdto.page }+"&m_index="+${data.midto.m_index };
		}
		
		
	})
})





</script>
<style>
        .nn{padding: 0;margin: 0;}
        .box_basic{border: 1px solid;}
        .info_poster{margin-top: 20px;margin:0 auto;}
        .detail_upper{border: 1px dashed;margin-left: 3px;display: inline-block;width: 70%;height:260px;}
        .detail_cont{clear:both;border: 1px solid;display: inline-block;}
        .bg_img{height:240px;width: 240px;}
        .box_basic:nth-child(1){display: inline;}
    	.moviedetailtb tr td:nth-of-type(1){background-color: #eee;width: 150px;}
    	.moviedetailtb tr td:nth-of-type(2){background-color: #fff;width: 650px;}
		.moviedetailtb tr td{border-bottom:1px solid #333;padding: 5px;}
		.moviedetailtb{width:800px;text-align: left;box-sizing: border-box;}
		#golist a:visited{color:#fff;}
		

    </style>

<body>




<div  id="upperpart">
<%-- <button type="button" id="movinfomodify" class="btn btn-info" value="${data.midto.m_index}" >수정</button> --%>

</div>


<div  id="mtitlepart">
<h1>제목 :  ${data.midto.movietitle} }</h1>
</div>


<div id="contentpart">
</div><div class="back_list">	</div>


<div class="box_basic" >
       
        <div class="info_detail">
           
            <div class="detail_cont">
            
            <table class="moviedetailtb">
				<tr>
					<td>감독 </td>
					<td>${data.midto.mdir}</td>
				</tr>
				<tr>
					<td>출연베우 </td>
					<td>${data.midto.mactrs}</td>
				</tr>
				<tr>
					<td>장르 </td>
					<td>
						${data.midto.mcate}
					</td>
				</tr>
				<tr>
					<td>러닝타임 </td>
					<td>${data.midto.mplaytime}</td>
				</tr>
				<tr>
					<td>줄거리 </td>
					<td>${data.midto.mplotBr}</td>
				</tr>
				<tr>
					<td>좋아요 수</td>
					
					<td>
					
						${data.midto.mlike}개
							
						
					</td>
				</tr>
			
			</table>
			
			 <div class="info_poster">
                    
              <img class="bg_img" src="../../moviedata/${data.midto.movietitle}/poster.jpg" alt="dd">
               
                
        </div>
             
                </div>
               
            </div>
             <div id="bottompart">
             <button type="button" id="movinfodelete" class="btn btn-danger" value="${data.midto.m_index}">삭제</button>
             
             	<button type="button" id="golist" class="btn btn-success">	<a href="movieinfolist?page=${data.pdto.page }">목록으로</a></button>
	</div>
        </div>




</body>