/**
 * 
 */
$(function() {

	if( document.getElementById('qnastateGo') != null){
		
		 document.getElementById('qnastatenow').value =  document.getElementById('qnastateGo').value
		 document.getElementById('qnacontentnow').value =  document.getElementById('qnacontentGo').value
		
		if(document.getElementById('qnastateGo').value != ''){
			var list = {
			    userid : document.getElementById('userid').value,
			    qnastate :  document.getElementById('qnastateGo').value,
			    qnacontent :  $('#qnacontentGo').val(),
			    page : document.getElementById('page').value
		    };	
		    
		     document.getElementById('qnastate').value = document.getElementById('qnastateGo').value
		     document.getElementById('qnacontent').value = document.getElementById('qnacontentGo').value
		    
			qnalistChange(list)
		}
	}

	
	$(document).on("click", ".qnaDetailGo", function(){
		
		document.getElementById('qnastateGo').value =  $('#qnastatenow').val()
		if(document.getElementById('qnastateGo').value == '')
			document.getElementById('qnastateGo').value = '전체'
		
		document.getElementById('qnacontentGo').value = $('#qnacontentnow').val()
		$('#detail').val($(this).attr("dd"));
		$('#page').val($('.pagebtn_sel').attr("pp"));
		qq.submit();	
	});
	
	$('#backQna').click(function(){
		pp.action="/member/mypage/myqna"
		pp.submit();
	});
	
	$("#serviceGo").click(function(){
    	frm.action = "/user/serviceC/servicePersonal"
		frm.submit();
	});
 
 	$("#qnafind").click(function(){
    	
    	document.getElementById('qnastatenow').value =  $('#qnastate').val()
    	document.getElementById('qnacontentnow').value =  $('#qnacontent').val()
    	
    	
    	var list = {
	    	userid : document.getElementById('userid').value,
	    	qnastate :  document.getElementById('qnastate').value,
	    	qnacontent :  $('#qnacontent').val()
    	};
    	qnalistChange(list);
    	
	});
	
	if(document.getElementById("content") !=null){
	
		if(document.getElementById('qnastate').value!= ''){
			
			var list = {
		    	userid : document.getElementById('userid').value,
		    	qnastate :  document.getElementById('qnastate').value,
		    	qnacontent :  $('#qnacontent').val(),
		    	page : document.getElementById('page').value
	    	};
		
		}else{
			
			var list = {
		    	userid : document.getElementById('userid').value
	    	};
		
		}
		
		$.ajax({
	    async : false,
	    type : 'POST',
		data : JSON.stringify(list),
	    url : "/memberRecord",
	    dataType : "json",
		contentType : "application/json; charset=UTF-8",
		success : function(data) {
			console.log( data.dto )	
			$(".fff").remove()
				
			if(data.qna!=null){
									
				for(i in data.qna ){
					
					if(data.qna[i].persindex ==  document.getElementById('detail').value){
					
						if(data.qna[i].persatime ==null)
							data.qna[i].persatime =""
							
						var tt ="<div class='fff'>"
						tt+="<div class='history_detail'>"
						tt+="<div class='hdetail_top'>"
						tt+="<ul>"
						tt+="<li>"+'['+data.qna[i].perscate+']'+data.qna[i].perstitle+"<li>"
						tt+="<li><span>"+'등록일'+"</span>"+data.qna[i].persqtime+"<li>"
						tt+="<li><span>"+'답변상태'+"</span>"+data.qna[i].persstate+"<li>"
						tt+="</ul></div>"
						tt+="<div class='hdetail_cont'>"
						tt+="<p class='hdetail_cont_ques'>"+data.qna[i].perscont+"</p>"
						tt+="<p class='hdetail_cont_pic'>"
						
						if(data.qna[i].persimg!=null)
						
						
						tt+="</p>"
						tt+="<p class='hdetail_cont_status'><span>"+ data.qna[i].persatime
						tt+="</span>"+data.qna[i].persstate+"</p>"
						tt+="<p class='hdetail_cont_ans'>"+data.qna[i].persacont
						tt+="</p></div></div>"
						
						
						tt+= "</div>"
						
						$("#content").append(tt)	
						
					}
				}
					
				}
		     }
		});
	}
	
	
	
	
});

function qnalistChange(list){
    	
    $.ajax({
	    async : false,
	    type : 'POST',
		data : JSON.stringify(list),
	    url : "/memberRecord",
	    dataType : "json",
		contentType : "application/json; charset=UTF-8",
		success : function(data) {
			
			$(".fff").remove()
				
			if(data.qna!=null){
										
				for(i in data.qna ){
					
					if(data.qna[i].persatime==null)
						data.qna[i].persatime =""
						
					var tt ="<div class='fff'>"
					tt+="<div class='puchaseinner'>"+ data.qna[i].persid + "</div>"
					tt+="<a class='qnaDetailGo' value=" + data.qna[i].persindex + " dd=" + data.qna[i].persindex +">"
					tt+="<div class='puchaseinner'>"+data.qna[i].perstitle+"</div>"
					tt+="</a>"
					tt+="<div class='puchaseinner'>" +data.qna[i].persqtime+ "</div>"
					tt+="<div class='puchaseinner'>" +data.qna[i].persatime+'('+data.qna[i].persstate+')'
					tt+="</div></div>"

					$("#qnaRecord").append(tt)	
					
				}
					
			var pp = "<div class='fff'>"
				
			if(data.pdto.startPage > 1)
				pp += "<input type='button' class='btnnn pagebtn pagebtn_lr' onclick='qnapageChange("+(data.pdto.startPage-1)+ ")' value='&lt' />"
							
			for( var i = data.pdto.startPage ; i <= data.pdto.endPage ; i++){
								
				if(i == data.pdto.page){
					pp += "<input type='button' class='pagebtn_sel' readonly value="+i+ ' pp='+ i+ ">"
				}else{
					pp += "<input type='button' class='btnnn pagebtn' onclick='qnapageChange("+i+ ")' value="+i+ ">"
				}
			}			
	     	
	     	if(data.pdto.endPage < data.pdto.total)
				pp += "<input type='button' class='btnnn pagebtn pagebtn_lr' onclick='qnapageChange("+(data.pdto.endPage+1)+ ")' value='&gt' />"
	     		
	     		pp+="</div>"
	     		
	     		$("#pageRecord").append(pp)
				
			}
	     }
	});
}

function qnapageChange(i){
	
	var list = {
    	userid : document.getElementById('userid').value,
    	qnastate :  document.getElementById('qnastate').value,
    	qnacontent :  $('#qnacontent').val(),
    	page : i
    };
	
	qnalistChange(list);
}
