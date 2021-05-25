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
    	console.log($('#moiverecord').val())
    	
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
				
				alert(data.purchase)
				
	     	},error:function(request,status,error){
       			 alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
       		}


		});
    });
    
    $("#changepw").click(function(){
    	
		frm.action = "/member/mypage/mypwchange"
		frm.submit();
	});
     
	$("#modifyGo").click(function(){
    	
		
	});
     
	$("#ticketGo").click(function(){
    	frm.action = "/user/movietime/list"
		frm.submit();
	});
 
     
	$("#serviceGo").click(function(){
    	frm.action = "/user/serviceC/servicePersonal"
		frm.submit();
	});
 
 	
});
