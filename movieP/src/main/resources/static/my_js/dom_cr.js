

var no = 0

window.onload=function(){
   
   zxcv = document.getElementById("zxcv")
   
   arr = document.getElementById("arr")
   
}
function aaa(){
   
   //alert("aaa 실행");
   
   //console.log(zxcv.value)
   
   addDiv(zxcv.value)
   
   zxcv.value = ""
   zxcv.focus()
}

function bbb(ttt){
   //alert("bbb 실행 "+ttt)
   
   var del_item = document.getElementById(ttt)
   
   arr.removeChild(del_item)
}


function ccc(ttt){
   //alert("bbb 실행 "+ttt)
   const vvv = document.getElementById('btn'+ttt).value
   
   if(vvv == '수정'){
      document.getElementById('txt'+ttt).readOnly = false
      
      document.getElementById('btn'+ttt).value = '수정완료'
   }else{
      document.getElementById('txt'+ttt).readOnly = true
      
      document.getElementById('btn'+ttt).value = '수정'
   }
}

function addDiv(ttt){
   
   var new_item = document.createElement("div")
   
   var new_id = "box" + no
   
   var txt_id = "txt" + no
   
   
   
   new_item.setAttribute("id",new_id)
   
   var txt_item = document.createElement("input")
   
   txt_item.value = ttt
   
   txt_item.readOnly = true
   
   txt_item.setAttribute("id",txt_id)
   
   new_item.appendChild(txt_item)
   
   var btn_item = document.createElement("input")
   btn_item.setAttribute("type","button")
   //btn_item.setAttribute("del_id",new_id)
   btn_item.setAttribute("onclick","bbb('"+new_id+"')")
   
   btn_item.value = "삭제"
   new_item.appendChild(btn_item)
   
   var btn2_item = document.createElement("input")
   btn2_item.setAttribute("type","button")
   
   btn2_item.setAttribute("id","btn"+no)
   //btn_item.setAttribute("del_id",new_id)
   btn2_item.setAttribute("onclick","ccc('"+no+"')")
   
   btn2_item.value = "수정"
   new_item.appendChild(btn2_item)
   
   arr.appendChild(new_item)
   
   
   no++
   
}
