<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<style>
*{margin:0;paddin:0;}
 #infoinsert{
	 
	 
 }
 #movietitleb{margin-top:20px; }
#movietitle:first-child {
	
	
}
#movietitle:last-child {
	
	
}
</style>

</head>
<body>




	<form action="/admin/pageedit/movieinfoinsertReg" method="post"
		enctype="multipart/form-data" name="minfoform">
		
		<div id="infoinsert">
		
		
		<div id="movietitleb" class="row">
			<div class="col-md-4">영화제목</div>
			<div class="col-md-8">  <input type="text" name="movietitle" id="movietitle" /></div>
		
		</div><hr>
		
		<div id="mdirb" class="row">
		<div class="col-md-4">
		 감독</div>
		 <div class="col-md-8">
		 <input	type="text" name="mdir" id="mdir" /></div></div><hr />







		<div id="actor" class="row">
			<div class="col-md-4">배우 </div>
			<div class="col-md-3"> </div>
			 <input class="col-md-2" type="text" name="insertname" id="actortext" />	
			<button class="col-md-2" type="button" id="addactor"  class="mb-3">배우추가</button>
			
	
				</div>
				<div id="actor2">
				<div   id="actorcont" ></div>
		</div>
		
		
		
<hr />
		<div id="cate" class="row">		
			<div class="col-md-4">카테고리 </div>
			<div class="col-md-3"> </div>
			
			<select id="cateselect" >
			<option value="null">카테고리</option>
			<option value="드라마">드라마</option>
			<option value="멜로/로맨스">멜로/로맨스</option>
			<option value="가족">가족</option>
			<option value="액션">액션</option>
			<option value="SF">SF</option>
			<option value="모험">모험</option>
			<option value="코미디">코미디</option>
			<option value="판타지">판타지</option>
			<option value="스릴러">스릴러</option>
			<option value="애니메이션">애니메이션</option>
			<option value="공포">공포</option>
			<option value="미스터리">미스터리</option>
			<option value="범죄">범죄</option>
			
			</select>
				<button type="button" id="addcate"  class="mb-3">카테고리추가</button>
			</div>
			<div   id="catecont" >
				
			</div>
			
			
		
		<hr />
		<div class="row">
		<div class="col-md-4">개봉일 </div>
			<div class="col-md-3"> </div>
	
		
		<input type="date" name="moviedate" id="moviedate" /></div><br> <!--setMoviedate  -->
		<hr />
		<div class="row">
		<div class="col-md-4">상영시간 </div>
			<div class="col-md-3"> </div>
		<input	type="text" name="mplaytime" id="mplaytime" /></div><br>
		<hr />
		<div class="row">
		
		 <div class="col-md-4"> 줄거리 </div>
			<div class="col-md-3"> </div>
		 <textarea name="mplot" rows="5" cols="30"   id="mplot" ></textarea>
		 
		</div>
		<br>
		<hr />
		<div id="image">
			<button type="button" id="addimg" class="mb-3" >이미지추가</button><br>
	
		
			
		</div>
		<hr />
		<input id="submitall" type="button" value="영화 등록하기" onclick="insertvalidcheck()" />
		
		
		</div>
	</form>


</body>


	<script>
		$(document).ready(function() {
						
		
			
			
			
				var catecount= 0,filecount=0,actorcount=0;
				var cateselect= document.getElementById("cateselect")			
					var actortext= document.getElementById("actortext")			
				//카테삭제버튼정의
				function catedelete(){
					number= this.value;
				    if (!confirm( "카테고리를 삭제하시겠습니까")) {
				        // 취소(아니오) 버튼 클릭 시 이벤트
				    } else {
				        document.querySelector("#catediv"+number).remove()
				        console.log(this.value)				        
				    }					
				}
				//배우삭제버튼정의
				function actordelete(){
					number= this.value;
				    if (!confirm("배우를 삭제하시겠습니까")) {
				        // 취소(아니오) 버튼 클릭 시 이벤트
				    } else {
				        document.querySelector("#actordiv"+number).remove()
				        console.log(this.value)				        
				    }					
				}
				
				
				
				
				
			//윈도우가 열리면
				document.getElementById("addactor").onclick = function() {
				     
					 if (!confirm("배우를 추가하시겠습니까")) {
					        // 취소(아니오) 버튼 클릭 시 이벤트
					    } else {
					   				    
							if(actortext.value!='')	{						
					    	actorcount++;
							var newactordiv = document.createElement("div");
							newactordiv.setAttribute("id","actordiv"+actorcount)
							newactordiv.classList.add('mb-3')	
							var newinput = document.createElement("input");
							newinput.setAttribute("type", "text");
							newinput.setAttribute("name", "mactrs");
							newinput.setAttribute("value", actortext.value)
							newinput.setAttribute("readonly","readonly")
							
							
							var actordeletebutton = document.createElement("button");
							actordeletebutton.setAttribute("type", "button");
							var btntext = document.createTextNode( '삭제하기' );
							actordeletebutton.appendChild(btntext);
							actordeletebutton.setAttribute("value",actorcount)
							actordeletebutton.setAttribute("id", actorcount);
							actordeletebutton.addEventListener('click',actordelete)
							
							newactordiv.appendChild(newinput)
							newactordiv.appendChild(actordeletebutton)
							document.getElementById("actortext").value=""
							document.getElementById("actorcont").appendChild(newactordiv)
							}
					    }					
					
					
				}

				document.getElementById("addcate").onclick = function() {
					
					 if (!confirm("카테고리를 추가하시겠습니까")) {
					        // 취소(아니오) 버튼 클릭 시 이벤트
					    } else {
					    	
					    	
					    if(cateselect.value!='null'){
					    	
					    	catecount++;
							var newcatediv = document.createElement("div");
							newcatediv.setAttribute("id","catediv"+catecount)
							newcatediv.classList.add('mb-3')			
							var newinput = document.createElement("input");
							newinput.setAttribute("type", "text");
							newinput.setAttribute("name", "mcate");
							newinput.setAttribute("value", cateselect.value)
							newinput.setAttribute("readonly","readonly")
								
							
							var catedeletebutton = document.createElement("button");
							catedeletebutton.setAttribute("type", "button");
							var btntext = document.createTextNode( '삭제하기' );
							catedeletebutton.appendChild(btntext);
							catedeletebutton.setAttribute("value",catecount)
							catedeletebutton.setAttribute("id", catecount);
							catedeletebutton.addEventListener('click',catedelete)
							
							newcatediv.appendChild(newinput)
							newcatediv.appendChild(catedeletebutton)
							cateselect.options[0].setAttribute("selected","false")
							cateselect.options[0].setAttribute("selected","true")
							
							document.getElementById("catecont").appendChild(newcatediv)
					    	
					    }	
					    	
				
					    }
					}
				
				
				
				
				
				
				document.getElementById("addimg").onclick = function() {
					
					
					filecount++;
					var filediv = document.createElement("div")
						filediv.setAttribute("id","filediv"+filecount)
						filediv.classList.add('mb-3')			
							
					var newinput = document.createElement("input");
					newinput.setAttribute("type", "file");
					newinput.setAttribute("name", "infoimg");
					newinput.setAttribute("onchange","checkfile(this,this.value)")
					newinput.classList.add("movieinfofiles")
					var filedeletebutton = document.createElement("button");
					filedeletebutton.setAttribute("type", "button");
					var btntext = document.createTextNode( '삭제하기' );
					filedeletebutton.appendChild(btntext);
					filedeletebutton.setAttribute("value",filecount)
					filedeletebutton.setAttribute("id", filecount);
					filedeletebutton.addEventListener('click',catedelete)
					
					
					filediv.appendChild(newinput)
					filediv.appendChild(filedeletebutton)
					
					
					
					
					document.getElementById("image").appendChild(filediv)			
					alert("이미지 추가");
					
					
					
					
				}
				//window.open("URL", "팝업이름", "팝업 옵션");				
				
				var searchbtns = document.getElementsByClassName("actorsearch")
				
				var searchfunc = function(){
					alert("검색들어감")
				}
				
				//for(var i=0; i<searchbtns.length; i++){
				// searchbtns[i].addEventListener('click', searchfunc(), false);
				//}
				
				Array.from(searchbtns).forEach(function(element){
					element.addEventListener('click',searchfunc)
				});
				
				
		})
		
			function insertvalidcheck(){// 유효성체킹. 
			//	\
		
			console.log("insertvalidcheck")
			if (document.getElementById("movietitle").value === "") {
				alert("제목을 입력해주세요");
				return false;
			}else if(document.getElementById("mdir").value === "") {
				alert("감독명 입력해주세요");
				return false;
			}
			else if(document.getElementById("moviedate").value === "") {
				alert("개봉일 입력해주세요");
				return false;
			}//mplaytime
			else if(document.getElementById("mplaytime").value === "") {
				alert("상영시간 입력해주세요");
				return false;
			}
			else if(document.getElementById("mplot").value === "") {
				alert("줄거리를 입력해주세요");
				return false;
			}else {
				document.minfoform.submit();
			}
				
				
				
			}
			
			
			function checkfile(input, inputV) {				
				var fileLen = inputV.length; 
				var fileLas = inputV.lastIndexOf(".");
				var fileExt = inputV.substring(fileLas+1, fileLen).toLowerCase();
				alert("체크파일")
				if (fileExt != "jpg" && fileExt != "png" && fileExt != "jpeg") {
				var msg="확장자를 확인하세요"
					
					 if (input.files && input.files[0].size > (1 * 1024 * 1024)) {
					       msg="파일 사이즈가 1mb 를 넘습니다.";
					        
					      
					    }
					 alert(msg)
					 input.value = null;
				}
			}
			
	</script>


</html>