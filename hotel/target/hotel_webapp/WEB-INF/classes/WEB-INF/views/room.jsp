<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <title>호텔객실관리</title>
  </head>
  <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
  <style>
	  @import url('https://fonts.googleapis.com/css2?family=Gowun+Batang:wght@700&display=swap');
	  body {
	    font-family: 'Gowun Batang', serif;
	    }
  </style>
  <body  style="overflow-x: hidden">
    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <header class="p-3 mb-3 border-bottom bg-dark text-white">
        <div class="containe">
          <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
            <a href="/" class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none">
              <svg class="bi me-2" width="40" height="20" role="img" aria-label="Bootstrap"><use xlink:href="#bootstrap"></use></svg>
            </a>
            <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
              <li><a href="/" class="nav-link px-2 text-secondary">Home</a></li>
              <li><a href="/booking" class="nav-link px-2 text-white">예약관리</a></li>
              <li><a class="nav-link px-2 text-warning">객실관리</a></li>
            </ul>
            <div>
	            <small>${loginid}님 환영합니다.</small>
	            <a href="/logout" class="text-white">로그아웃</a>            
            </div>
          </div>
        </div>
      </header>

      <div class="row row-cols-1 row-cols-md-3 mb-3 text-center d-flex justify-content-center">
        <div class="col-4">
          <div class="card mb-4 rounded-3 shadow-sm bg-dark text-white">
            <div class="card-header py-3">
              <h4 class="my-0 fw-normal">객실리스트</h4>
            </div>
            <div class="list-group list-group-flush border-bottom scrollarea" id="btn_room" style="height:475px; overflow-y: scroll;">

<!-- 			 <c:forEach items = "${list}" var = "room" varStatus = "num">
                  <option id="${num.index}" value="${room.roomcode}" style="display:none;">${room.roomname},${room.type},${room.howmany},${room.howmuch}</option>
			  		<a href="#" class="list-group-item list-group-item-action py-3 lh-tight" onclick="getIndex(${num.index})">
	                  <div class="d-flex w-100 align-items-center justify-content-between">
	                    <h5 class="fw-bold mb-1">${room.roomname}</h5>
	                    <small>${room.howmany}인</small>
	                  </div>
	                  <div class="d-flex w-100 align-items-center justify-content-between">
	                    <div class="small" style="float:left">${room.typename}</div>
	                    <small>1박 ${room.howmuch}</small>
	                  </div>
                	</a>
				</c:forEach>
 -->
            </div>
          </div>
        </div>
        <div class="col-6">
          <div class="card mb-4 rounded-3 shadow-sm bg-dark text-white">
            <div class="card-header py-3 text-white">
              <h4 class="my-0 fw-normal">객실등록</h4>
            </div>
            <div class="card-body">
                <label for="roomName" style="float:left">객실 이름</label>
                <input class="form-control mb-3" type="text" name="roomName" id="roomName">
                <input type="hidden" id="roomcode" value="">
                <label for="roomli" style="float:left">객실 종류</label>
                <select class="form-select mb-3" size="5" id="roomli">
                	<c:forEach items = "${type}" var = "rtype">
			  		<option value="${rtype.typecode}">${rtype.name}</option>
					</c:forEach>
                </select>
                <label for="roomGuest" style="float:left">인원제한</label>
                <div class="input-group mb-3">
                    <input type="number" class="form-control" id="roomGuest" value="">
                  </div>
                <label for="roomPrice" style="float:left">1박요금</label>
                <div class="input-group mb-3">
                    <input type="text" class="form-control" id="roomPrice" style = "text-align:right" placeholder=", 없이 입력" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
                    <span class="input-group-text" id="roomPrice">원</span>
                </div>
                
                <button type="button" id="btnCreate" class="btn btn-lg btn-warning">등록</button>
                <button type="button" id="btnClear" class="btn btn-lg btn-warning">초기화</button>
                <button type="button" id="btnDel" class="btn btn-lg btn-danger">삭제</button>
            </div>
          </div>
        </div>
      </div>
  </body>
  <script>
    $(document).ready(function() {
    	console.log('ready');
    	$.post("http://localhost:8080/getRoomList",{},function(result) {
    		console.log(result);
    		$.each(result, function(ndx, value){
    			//let li = '<option value='+value['roomcode']+'>'+value['roomname']+','+value['typename']+','+value['howmany']+','+value['howmuch']+'</option>';
			  	let li = '<a href="#" id="'+value['roomcode']+'" class="list-group-item list-group-item-action py-3 lh-tight" onclick="getIndex(\''+value['roomname']+'\','+value['type']+','+value['howmany']+','+value['howmuch']+','+value['roomcode']+')">'+
             			'<div class="d-flex w-100 align-items-center justify-content-between">'+
               				'<h5 class="fw-bold mb-1">'+value['roomname']+'</h5>'+
              				 '<small>'+value['howmany']+'인</small>'+
             			'</div>'+
             			'<div class="d-flex w-100 align-items-center justify-content-between">'+
               				'<div class="small" style="float:left">'+value['typename']+'</div>'+
               				'<small>1박 '+value['howmuch']+'</small>'+
             			'</div>'+
	       			'</a>';
              	$('#btn_room').append(li);
              	//selRoom
    		});
    	},'json')
    	
    	$(document).on("click","#btn_room a",function(event){
            // 동적으로 여러 태그가 생성된 경우라면 이런식으로 클릭된 객체를 this 키워드를 이용해서 잡아올 수 있다.
            for (let i = 0; i < $("#btn_room a").length; i++) {                    
            	$("#btn_room a").removeClass("active");
                $("#btn_room a").removeClass("bg-warning");
 	        }
            
            $(this).addClass("active");
            $(this).addClass("bg-warning");
          });
    	
	    $('#btnClear').click(function() {
	        $('#roomName, #roomGuest, #roomPrice, #roomcode').val('');
	        $("#roomli option").prop("selected", false);
	        for (let i = 0; i < $("#btn_room a").length; i++) {                    
            	$("#btn_room a").removeClass("active");
                $("#btn_room a").removeClass("bg-warning");
 	        }
	    })
	    
	    $('#btnDel').click(function() {
	    	if(confirm("객실을 삭제하시겠습니까?")) {
		    	$.post("http://localhost:8080/deleteRoom",{roomcode:$('#roomcode').val()},function(result) {
		    		console.log(result);
		    		let rc = $('#roomcode').val();
		    		if(result=="ok"){
		    			$('#btnClear').trigger('click');
		    			//$('#selRoom option:selected').remove();
		    			$('#'+rc).remove();
		    		}
		    	}, 'text');
	    	}
	    	return false;
	    })
	    
	    $('#btnCreate').click(function() {
	    	let roomname = $('#roomName').val();
	    	let roomlist = $('#roomli').val();
	    	let roomguest = $('#roomGuest').val();
	    	let roomprice = $('#roomPrice').val();
	    	let roomcode = $('#roomcode').val();
	    	if(roomname == "" || roomlist == "" || roomguest == "" || roomprice == "") {
	    		alert("값을 전부 입력해주세요.");
	    		return false;
	    	}
	    	if(roomcode == "") {
		    	$.post("http://localhost:8080/addRoom",{roomname:roomname,roomtype:roomlist,howmany:roomguest,howmuch:roomprice},function(result){
		    		if(result=="ok"){
		    			location.reload();
		    		}
		    	}, 'text');	    		
	    	} else {
	    		if(confirm("객실을 수정하시겠습니까?")) {
		    		$.post("http://localhost:8080/updateRoom",{roomcode:roomcode,roomname:roomname,roomtype:roomlist,howmany:roomguest,howmuch:roomprice},function(result){
			    		if(result=="ok"){
			    			location.reload();
			    		}
			    	}, 'text');
	    		}
	    	}
	    })
	    
//	    $('#selRoom').click(function () {
//	    	let str = $('#selRoom option:selected').text();
//	    	let arr = str.split(",");
//	    	$('#roomName').val(arr[0]);
//	        $('#roomli option:contains("'+arr[1]+'")').prop("selected", true);
//	        $('#roomGuest').val(arr[2]);
//	        $('#roomPrice').val(arr[3]);
//	        
//	    	let code = $('#selRoom option:selected').val();
//	    	$('#roomcode').val(code);
//	        return false;
//	    })
	    
    })
    
    function getIndex(a,b,c,d,e) {
        $('#roomName').val(a);
        $('#roomli').val(b);
        $('#roomGuest').val(c);
        $('#roomPrice').val(d);
    	$('#roomcode').val(e);
        return false;
	}
  </script>
</html>