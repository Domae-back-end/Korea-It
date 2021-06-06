/**
 * 
 */
$(function() {
	
	 $(".qwer").click(function(){
	 	var ddd= $(this).attr("dd");
	 	var ccc= $(this).attr("cc").replace(/ /g,",");
	 	var ttt= $(this).attr("tt");
	 	
	 	  $("#inforpurchase1").modal({
		      	remote: '/views/user/page/modal/purchase.jsp?price='+ddd +'&time='+ccc+'&type='+ttt
		   	});
	 });
	
	
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
	
		
	
	$("input:radio[name=moivepur]").click(function(){
 
        if($("input[name=moivepur]:checked").val() == "now"){
            
            $("#moiveButt").attr("disabled",true);
            
            $('#moiverecord option:eq(0)').prop("selected", true);
            
            var list = {
	    		userid : document.getElementById('userid').value,
	    		date : $('#moiverecord option:selected').val(),
	    		pageKind : 'mypurchase'
    		};
    		
    		purchaselistChange(list);
    		$("#moiverecord").attr("disabled",true);
 
        }else{
              $("#moiverecord").attr("disabled",false);          
              $("#moiveButt").attr("disabled",false);  
        }
    });
    
  
    $("#moiveButt").click(function(){
    	
    	var list = {
    		userid : document.getElementById('userid').value,
    		date : document.getElementById('moiverecord').value,
    		pageKind : 'mypurchase'
    	};
    	
    	purchaselistChange(list);
    	
    });
 
	
});

function purchaselistChange(list){

	$.ajax({
	    async : false,
	    type : 'POST',
		data : JSON.stringify(list),
	    url : "/memberRecord",
	    dataType : "json",
		contentType : "application/json; charset=UTF-8",
		success : function(data) {
			
			$(".fff").remove()
				
			if(data.purchase!=null){
										
				for(j in data.purchase ){
					
					var tt ="<div class='fff'><div class = 'purchaseMainouter'>"
					
					tt+= "<a href='/user/movie/moviedetail?sub=review&ind="+data.purchase[j].m_index+"'>"
					tt+="<div class='purchaseimg'>"
					
					if(data.purchase[j].imgname!=null){
						tt+= "<img src='/moviedata/"+data.purchase[j].imgname + "' alt=' +data.purchase[j].movietitle+ '이미지' />"
					
					}else{
						tt+='이미지없음'
					}
						
					tt+="</div></a>"
					tt+="<div class='puinfor' id='puinfor'><div>"
					tt+='예매번호 :'+"<span class='saleslink'>"+ data.purchase[j].saleslink + "</span></div>"
					tt+= "<div>" +'영화명 : '+ data.purchase[j].movietitle +"</div>"
					tt+= "<div><div class='purchasespace'>"+'상영관 : '+ data.purchase[j].sectorNo +"</div>"
					tt+="<span>"+'관람인원 :'
					
					if(data.purchase[j].A!=null)
						tt+= '성인'+ data.purchase[j].A +'명'
					if(data.purchase[j].B!=null)
						tt+= '청소년'+ data.purchase[j].B +'명'
					if(data.purchase[j].C!=null)
						tt+= '어린이'+ data.purchase[j].C +'명'
					tt+="</span>"
					tt+="</div>"
					tt+="<div><div class='purchasespace'>"+'관람일시'+ data.purchase[j].starttime+"</div>"
					tt+="<span>"+ '관람좌석 : '+ data.purchase[j].seatNo +"</span></div>"
					tt+="<div class='purchasespace'>"+'결제일시 : '+ data.purchase[j].sales_time +"</div>"
					tt+="<div class='purchasespaceButt'><button class='changeButt'>"+'결제정보'+"</button>"
						if(data.purchase[j].checktime > data.dto.nowDate)
							tt+="<button class='changeButt' onclick='ticketCancel("+data.purchase[j].saleslink +")'>"+'예매취소'+"</button>"		
						
					tt+="</div></div></div>"
					
					$("#recordpurchase").append(tt)	
					
				}
					
			var pp = "<div class='fff'>"
				
			if(data.pdto.startPage > 1)
				pp += "<input type='button' class='btnnn pagebtn pagebtn_lr' onclick='purchasepageChange("+data.pdto.startPage-1+ ")' value='&lt' />"
							
			for( var i = data.pdto.startPage ; i <= data.pdto.endPage ; i++){
								
				if(i == data.pdto.page){
					pp += "<input type='button' class='pagebtn_sel' readonly value="+i+ ">"
				}else{
					pp += "<input type='button' class='btnnn pagebtn' onclick='purchasepageChange("+i+ ")' value="+i+ ">"
				}
			}			
	     	
	     	if(data.pdto.endPage < data.pdto.total)
				pp += "<input type='button' class='btnnn pagebtn pagebtn_lr' onclick='purchasepageChange("+data.pdto.endPage+1+ ")' value='&gt' />"
	     		
	     		pp+="</div>"
	     		
	     		$("#pageRecord").append(pp)
				
			}
	     }
	});
    	
}

function purchasepageChange(i){
	
	var list = {
    	userid : document.getElementById('userid').value,
    	date :  document.getElementById('moiverecord').value,
    	pagekind : 'mypurchase',
    	page : i
    };
	
	purchaselistChange(list);
}

function ticketCancel(i){
	
	var list = {
		userid : document.getElementById('userid').value,
		ticket : i
    };
    
    if(confirm("예매를 취소하시겠습니까?")){
	
		$.ajax({
		    	async : false,
		        type : 'POST',
		        data : JSON.stringify(list),
		        url : "/memberdelete",
		        dataType : "json",
				contentType : "application/json; charset=UTF-8",
				success : function(data) {
				
					if(data.dcnt >0 && data.ccnt >0 ){
								
						alert("예매가 취소되었습니다")
						location.reload()
					}
		
		     	}
		});
	}
}

function purchasCancelepageChange(i){

	var list = {
    	userid : document.getElementById('userid').value,
    	cpage : i
    };
    
	$.ajax({
	    async : false,
	    type : 'POST',
		data : JSON.stringify(list),
	    url : "/memberRecord",
	    dataType : "json",
		contentType : "application/json; charset=UTF-8",
		success : function(data) {
			
			$(".CCC").remove()
				
			if(data.cancel!=null){
										
				for(j in data.cancel ){
					
					var tt ="<div class='CCC'>"
					tt+="<div><div class = 'puchaseinner'>"+data.cancel[j].sales_time+"</div>"
					tt+="<div class = 'puchaseinner'>" + data.cancel[j].movietitle +"</div>"
					tt+"<div class = 'puchaseinner'>"+ data.cancel[j].starttime +"</div>"
					tt+="<div class = 'puchaseinner'>"+ data.cancel[j].salesprice +"</div>"
					tt+="</div>"
					tt+="</div>"
					
					$("#recordCpurchase").append(tt)	
					
				}
					
			var pp = "<div class='CCC'>"
				
			if(data.cpdto.startPage > 1)
				pp += "<input type='button' class='btnnn pagebtn pagebtn_lr' onclick='purchasCancelepageChange("+data.pdto.cstartPage-1+ ")' value='&lt' />"
							
			for( var i = data.cpdto.cstartPage ; i <= data.cpdto.cendPage ; i++){
								
				if(i == data.cpdto.cpage){
					pp += "<input type='button' class='pagebtn_sel' readonly value="+i+ ">"
				}else{
					pp += "<input type='button' class='btnnn pagebtn' onclick='purchasCancelepageChange("+i+ ")' value="+i+ ">"
				}
			}			
	     	
	     	if(data.cpdto.cendPage < data.cpdto.ctotal)
				pp += "<input type='button' class='btnnn pagebtn pagebtn_lr' onclick='purchasCancelepageChange("+data.cpdto.cendPage+1+ ")' value='&gt' />"
	     		
	     		pp+="</div>"
	     		
	     		$("#pageCRecord").append(pp)
				
			}
	     }
	});
    	
}
