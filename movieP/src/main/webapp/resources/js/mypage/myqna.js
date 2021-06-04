/**
 * 
 */
$(function() {
	
	$("#serviceGo").click(function(){
    	frm.action = "/user/serviceC/servicePersonal"
		frm.submit();
	});
 
 	$("#qnafind").click(function(){
    	
    	var list = {
	    	userid : document.getElementById('userid').value,
	    	qnastate :  document.getElementById('qnastate').value,
	    	qnacontent :  $('#qnacontent').val()
    	};
    	qnalistChange(list);
    	
	});
	
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
					tt+="<a href='?detail="+ data.qna[i].persindex +"'>"
					tt+="<div class='puchaseinner'>"+data.qna[i].perstitle+"</div>"
					tt+="</a>"
					tt+="<div class='puchaseinner'>" +data.qna[i].persqtime+ "</div>"
					tt+="<div class='puchaseinner'>" +data.qna[i].persatime+'('+data.qna[i].persstate+')'
					tt+="</div>"+"</div>"

					$("#qnaRecord").append(tt)	
					
				}
					
			var pp = "<div class='fff'>"
				
			if(data.pdto.startPage > 1)
				pp += "<input type='button' class='btnnn pagebtn pagebtn_lr' onclick='qnapageChange("+data.pdto.startPage-1+ ")' value='&lt' />"
							
			for( var i = data.pdto.startPage ; i <= data.pdto.endPage ; i++){
								
				if(i == data.pdto.page){
					pp += "<input type='button' class='pagebtn_sel' readonly value="+i+ ">"
				}else{
					pp += "<input type='button' class='btnnn pagebtn' onclick='qnapageChange("+i+ ")' value="+i+ ">"
				}
			}			
	     	
	     	if(data.pdto.endPage < data.pdto.total)
				pp += "<input type='button' class='btnnn pagebtn pagebtn_lr' onclick='qnapageChange("+data.pdto.endPage+1+ ")' value='&gt' />"
	     		
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
