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
	        url : "/memberpurchase",
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
     
	$("#modifyGo").click(function(){
    	
		if($("#nowpw").val() == $("#userpw").val()){
			
			frm.action = "/member/mypage/mypageMain"
			frm.submit();
		
		}else{
			alert("비밀번호를 다시 확인해주세요.")
		}
		
	});
     
	$("#ticketGo").click(function(){
    	frm.action = "/user/movietime/list"
		frm.submit();
	});
 
     
	$("#serviceGo").click(function(){
    	frm.action = "/user/serviceC/servicePersonal"
		frm.submit();
	});
 
 	$("#fnafind").click(function(){
    	//수정
    	$.ajax({
	    	async : false,
	        type : 'POST',
	        data : JSON.stringify(list),
	        url : "/memberpurchase",
	        dataType : "json",
			contentType : "application/json; charset=UTF-8",
			success : function(data) {
			
				$(".ppp").remove()
				
				if(data.purchase!=null){
										
					for(i in data.fna ){
						
						if(data.purchase[i].salesprice > 0) {
							var tt ="<div class='ppp'>"
							tt+="<div class='puchaseinner'>"+ data.purchase[i].movietitle + "</div>"
							tt+="<div class='puchaseinner'>" +data.purchase[i].ticket_pcount+ "</div>"
							tt+="<div class='puchaseinner'>" +data.purchase[i].salesprice+ "</div>"
							tt+="<div class='puchaseinner'> <fmt:formatDate value=" +data.purchase[i].sales_time+ " pattern= 'yyyy년 MM월 dd일'/>"
							tt+="</div>"+"</div>"
							
							$("#recordpurchase").append(tt)	
						}
					}
				}
					
	     	}
		});
	});
	
	
	
	
});
