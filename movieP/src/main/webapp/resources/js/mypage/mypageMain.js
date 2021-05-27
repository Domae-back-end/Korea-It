/**
 * 
 */
 $(function() {
 
	if(document.getElementById("moiverecord") !=null){
		
		var date = new Date();
		var changeChars; 
		var currMonth = date.getMonth()+1;
		var currYear = date.getFullYear();
		var option;
		 
		for(var i = 0;i <=6 ;i++){
			
			var changeMonth = currMonth--;
			var changeYear = currYear;
			
			if(changeMonth <= 1){
				currMonth = 12;
				currYear--;
			}
			
			if(changeMonth < 10)
				changeChars = "0"+changeMonth;
			else
				changeChars = changeMonth;
			 
			option = new Option();
			option.value = changeYear + "-" + changeChars;
			option.text = changeYear + "년" + changeChars+ "월" ;
			document.getElementById("moiverecord").options.add(option);
		}
	}	
	
	$('#check').click(function(){
		
		$.ajax({
	    	async : true,
	        type : 'POST',
	        data : JSON.stringify({userid : $('#userid').val(), userpw : $('#userpwchk').val()}),
	        url : "/memberCheck",
	        dataType : "json",
			contentType : "application/json; charset=UTF-8",
			success : function(data) {
				
				if(data.dto!=null){
				
					alert("비밀번호가 일치합니다.")		
					frm.action = "/member/mypage/myinforchange"
					frm.submit();
			
				}else{ 
					alert("비밀번호가 일치하지않습니다.")
	     		}
	     	}
		});
	});
	
	$('#mainGo').click(function(){
		frm.action = "/member/mypage/mypageMain"
		frm.submit();
	});
	
	$("input:radio[name=moivepur]").click(function(){
 
        if($("input[name=moivepur]:checked").val() == "now"){
            $("#moiverecord").attr("disabled",true);
            $("#moiveButt").attr("disabled",true);
 
        }else{
              $("#moiverecord").attr("disabled",false);          
              $("#moiveButt").attr("disabled",false);  
        }
    });
    
  
    $("#moiveButt").click(function(){
    	
    	var list = {
    		userid : document.getElementById('userid').value,
    		date :  document.getElementById('moiverecord').value
    	};
    	
    	$.ajax({
	    	async : false,
	        type : 'POST',
	        data : JSON.stringify(list),
	        url : "/memberRecord",
	        dataType : "json",
			contentType : "application/json; charset=UTF-8",
			success : function(data) {
			
				$(".ppp").remove()
				
				if(data.purchase!=null){
										
					for(i in data.purchase ){
						
						if(data.purchase[i].salesprice > 0) {
							var tt ="<div class='ppp'>"
							tt+="<div class='puchaseinner'>"+ data.purchase[i].movietitle + "</div>"
							tt+="<div class='puchaseinner'>" +data.purchase[i].ticket_pcount+ "</div>"
							tt+="<div class='puchaseinner'>" +data.purchase[i].salesprice+ "</div>"
							tt+="<div class='puchaseinner'><fmt:formatDate value='"+data.purchase[i].sales_time +" pattern= \"yyyy년 MM월 dd일\" '/></div>"
							tt+="</div>"
							
							$("#recordpurchase").append(tt)	
						}
					}
				}
					
	     	}
		});
    });
    
    
    
    $("#changepw").click(function(){
    	
    	frm.action = "/member/mypage/mypwchange"
		frm.submit();

	});
     
	$("#pwmodifyGo").click(function(){
    	
    	var list = {
    		userid : document.getElementById('userid').value,
    		userpw :  document.getElementById('nowpw').value
    	};
    	
    	$.ajax({
	    	async : false,
	        type : 'POST',
	        data : JSON.stringify(list),
	        url : "/memberCheck",
	        dataType : "json",
			contentType : "application/json; charset=UTF-8",
			success : function(data) {
				
    	
				if(data.dto!=null && $('#newpw').val() == $('#newpwch').val()){
					
					var inlist = {
			    		userid : document.getElementById('userid').value,
			    		userpw :  $('#newpw').val()
	    			};

					$.ajax({
				    	async : false,
				        type : 'POST',
				        data : JSON.stringify(inlist),
				        url : "/membermodify",
				        dataType : "json",
						contentType : "application/json; charset=UTF-8",
						success : function(data) {
							
							if(data.cnt>0){
								alert("비밀번호 변경이 완료되었습니다.")
								frm.action = "/member/mypage/mypageMain"
								frm.submit();
							}
				     	}
					});
	
				}else{
					alert("비밀번호를 다시 확인해주세요.")
				}
					
	     	}
		});
	
	});
     
    
        
    $("#inforDelete").click(function(){
    	
    	var list = {
    		userpw : document.getElementById('userpw').value,
    		userid :  document.getElementById('userid').value
    	};
    	
    	$.ajax({
	    	async : false,
	        type : 'POST',
	        data : JSON.stringify(list),
	        url : "/memberdelete",
	        dataType : "json",
			contentType : "application/json; charset=UTF-8",
			success : function(data) {
			
				if(data.dcnt >0){
							
					alert("탈퇴처리되었습니다")
					frm.action = "/member/mypage/mypageMain"
					frm.submit();
				}
	
	     	}
		});
    });
    
    
    
        
    $("#informodifyGo").click(function(){
    	
    	var list = {
    		useremail : document.getElementById('useremail').value,
    		userpnum :  document.getElementById('userpnum').value,
    		userid :  document.getElementById('userid').value
    	};
    	
    	$.ajax({
	    	async : false,
	        type : 'POST',
	        data : JSON.stringify(list),
	        url : "/membermodify",
	        dataType : "json",
			contentType : "application/json; charset=UTF-8",
			success : function(data) {
			
				if(data.cnt >0){
							
					alert("회원정보가 수정되었습니다")
					frm.action = "/member/mypage/mypageMain"
					frm.submit();
				}
	
	     	}
		});
    });
    
    
 
 
 
	$("#ticketGo").click(function(){
    	frm.action = "/user/movietime/list"
		frm.submit();
	});
 
     
     
     
     
     
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
						
						var tt ="<div class='fff'>"
						tt+="<div class='puchaseinner'>"+ data.qna[i].persid + "</div>"
						tt+="<div class='puchaseinner'>" +data.qna[i].perstitle+ "</div>"
						tt+="<div class='puchaseinner'>" +data.qna[i].persqtime+ "</div>"
						tt+="<div class='puchaseinner'> <fmt:formatDate value=" +data.qna[i].persatime+ " pattern= 'yyyy년 MM월 dd일'/>"
						tt+=data.qna[i].persstate +"</div>"+"</div>"

						$("#qnarecord").append(tt)	
					}
				}
					
	     	}
		});
	});
	
});

function likeButt(data){
		
	var list = {
    	userid : document.getElementById('userid').value,
    	like : document.getElementById('like').value,
    	index : data
    };
   
	$(this).click(function(){
		
		$.ajax({
		    async : false,
		    type : 'POST',
		  	data : JSON.stringify(list),
			url : "/membermodify",
		    dataType : "json",
			contentType : "application/json; charset=UTF-8",
			success : function(data) {
					
				if(data.cnt >0){
				    	
					$.ajax({
						async : false,
					    type : 'POST',
					    data : JSON.stringify(list),
					    url : "/memberdelete",
					    dataType : "json",
						contentType : "application/json; charset=UTF-8",
						success : function(data) {
								
							if(data.dcnt >0){
								
								alert("좋아요가 취소되었습니다.")
								frm.action = "/member/mypage/mymoviestroy?kind=likemovie"
								frm.submit();
							}
					     }
					});
				}
		     }
		});
		
	})
}

function writemodifyGo(data,no){
    	
	$(".writetnow").eq(no).css('display','none')
	$(".writeArea").eq(no).css('display','block')
		
	$(".writeButtouter").eq(no).remove()
		
	var tt ="<span class='writeButtouter'>"
	tt+="<button class='changeButt' onclick='writemodifyfinish(" + data + ',' + no + ")'>" +"완료"
	tt+="</button>"
	tt+="<button class='changeButt' onclick='writemodifyNo(" + data + ',' + no + ")'>" +'취소'
	tt+="</button>"
	tt+="</span>"
		
	$(".writetitleouter").eq(no).append(tt)	
		
}

function writedelteGo(data,no){
	
	var list = {
		userid : document.getElementById('userid').value,
		content : $('.writeArea').eq(no).val(),
		index : data
    };
    
    if(confirm("작성하신 관람평을 삭제하시겠습니까?")){
        	
		$.ajax({
			
			async : false,
			type : 'POST',
			data : JSON.stringify(list),
		    url : "/memberdelete",
		    dataType : "json",
			contentType : "application/json; charset=UTF-8",
			success : function(res) {
				
				if(res.dcnt >0){
								
					alert("관람평이 삭제되었습니다.")
					location.href = "/member/mypage/mymoviestroy?kind=writemovie"
				}
		
		     }
		});
	}	
}


function writemodifyNo(data,no){
    	
	$(".writetnow").eq(no).css('display','block')
	$(".writeArea").eq(no).css('display','none')
		
	$(".writeButtouter").eq(no).remove()
		
	var tt ="<span class='writeButtouter'>"
	tt+="<button class='changeButt' onclick='writemodifyGo(" + data + ',' + no + ")'>" +"수정"
	tt+="</button>"
	tt+="<button class='changeButt' onclick='writedelteGo(" + data + ',' + no + ")'>" +'삭제'
	tt+="</button>"
	tt+="</span>"
		
	$(".writetitleouter").eq(no).append(tt)	
		
}

function writemodifyfinish(data,no){
	
	var list = {
		userid : document.getElementById('userid').value,
		content : $('.writeArea').eq(no).val(),
		index : data
    };
    
    
	$.ajax({
		
		async : false,
		type : 'POST',
		data : JSON.stringify(list),
	    url : "/membermodify",
	    dataType : "json",
		contentType : "application/json; charset=UTF-8",
		success : function(res) {
			
			if(res.cnt >0){
							
				alert("관람평이 수정되었습니다.")
				
				$(".writetnow").eq(no).text($('.writeArea').eq(no).val())
				
				$(".writetnow").eq(no).css('display','block')
				$(".writeArea").eq(no).css('display','none')
				
				$(".writeButtouter").eq(no).remove()
		
				var tt ="<span class='writeButtouter'>"
				tt+="<button class='changeButt' onclick='writemodifyGo(" + data + ',' + no + ")'>" +"수정"
				tt+="</button>"
				tt+="<button class='changeButt' onclick='writedelteGo(" + data + ',' + no + ")'>" +'삭제'
				tt+="</button>"
				tt+="</span>"
					
				$(".writetitleouter").eq(no).append(tt)	
				
			}
	
	     }
	});
		
}


