<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <title>호텔객실예약</title>
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
              <li><a class="nav-link px-2 text-warning">예약관리</a></li>
              <li><a href="/room" class="nav-link px-2 text-white">객실관리</a></li>
            </ul>
            <div>
	            <small>${loginid}님 환영합니다.</small>
	            <a href="/logout" class="text-white">로그아웃</a>            
            </div>
          </div>
        </div>
      </header>

      <div class="row row-cols-1 row-cols-md-3 mb-3 text-center d-flex justify-content-center">

        <div class="col-3">
            <div class="card mb-2 rounded-3 shadow-sm bg-dark text-white">
                <div class="card-header py-3 text-white">
                  <h4 class="my-0 fw-normal">객실검색</h4>
                </div>
                <div class="card-body">
                    <label for="roomDay" style="float:left">숙박 기간</label>
                    <div class="input-group mb-1">
                        <input type="date" class="form-control" id="searchIn">
                        <span class="input-group-text">17:00~</span>
                    </div>
                    <div class="input-group mb-3">
                        <input type="date" class="form-control" id="searchOut">
                        <span class="input-group-text">~12:00</span>
                    </div>
                    <label for="roomli" style="float:left">객실 종류</label>
                    <select class="form-select" size="1" id="roomli">
                        <option value="0">-전체-</option>
                        <c:forEach items = "${type}" var = "rtype">
				  			<option value="${rtype.typecode}">${rtype.name}</option>
						</c:forEach>
                    </select><br />
                    
                    <button type="button" id="btnSearch" class="btn btn-lg btn-warning">검색</button>
                </div>
              </div>

                <div class="card mb-4 rounded-3 shadow-sm bg-dark text-white">
                    <div class="card-header py-3">
                      <h4 class="my-0 fw-normal">검색된객실</h4>
                    </div>
                    <div class="list-group list-group-flush border-bottom scrollarea" style="height:310px; overflow-y: auto;" id="btn_book">
                        <label class="mb-3 text-warning" style="display:block;" id="resultSearch">검색된 객실이 없습니다.</label>
                    
<!--
 	                    <c:forEach items = "${list}" var = "room" varStatus = "num">
		                  <option id="${num.index}" value="${room.roomcode}" style="display:none;">${room.roomname},${room.typename},${room.howmany},${room.howmuch}</option>
	                        <a href="#" class="list-group-item list-group-item-action py-3 lh-tight" onclick="getRoomIndex(${num.index})">
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

        <div class="col-4">
          <div class="card mb-4 rounded-3 shadow-sm bg-dark text-white">
            <div class="card-header py-3 text-white">
              <h4 class="my-0 fw-normal">예약등록</h4>
            </div>
            <div class="card-body">
                <label for="roomName" style="float:left">객실 이름</label>
                <input type="hidden" id="bookcode" value="">
                <input type="hidden" id="roomcode" value="">
                <input class="form-control mb-3" type="text" name="roomName" id="roomName" value="" readonly>
                <label for="roomtype" style="float:left">객실 종류</label>
                <input class="form-control mb-3" type="text" name="roomtype" id="roomtype" value="" readonly>
                <label for="roomGuest" style="float:left">숙박인원</label>
                <div class="input-group mb-3">
                    <input type="number" class="form-control" id="roomGuest" value="" min="1" max="">
                </div>
                <label for="roomDay" style="float:left">숙박 기간</label>
                <div class="input-group mb-1">
                      <input type="date" class="form-control" id="roomDateIn" readonly>
                      <span class="input-group-text">17:00~</span>
                </div>
                <div class="input-group mb-3">
                      <input type="date" class="form-control" id="roomDateOut" readonly>
                      <span class="input-group-text">~12:00</span>
                </div>
                <div class="d-flex w-100 align-items-center justify-content-between">
                    <label for="roomPrice" style="float:left">총 숙박비용</label>
                    <small id="oneDay">1박 -원</small>
                </div>
                <div class="input-group mb-3">
                    <span class="input-group-text" id="roomPriceDay">-박</span>
                    <input type="text" class="form-control" id="roomPrice" style = "text-align:right" placeholder=", 없이 입력" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" readonly>
                    <span class="input-group-text">원</span>
                </div>
                <label for="guestNum" style="float:left">예약자 이름</label>
                <input class="form-control mb-3" type="text" name="guestName" id="guestName" value="">
                <label for="guestNum" style="float:left">예약자 연락번호</label>
                <input class="form-control mb-3" type="text" name="guestNum" id="guestNum" value="" placeholder="- 없이 입력" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
                <button type="button" id="btnCreate" class="btn btn-lg btn-warning">등록</button>
                <button type="button" id="btnClear" class="btn btn-lg btn-warning">초기화</button>
                <button type="button" id="btnDel" class="btn btn-lg btn-danger">예약취소</button>
            </div>
          </div>
        </div>

        <div class="col-3">
            <div class="card mb-4 rounded-3 shadow-sm bg-dark text-white">
              <div class="card-header py-3">
                <h4 class="my-0 fw-normal">예약현황</h4>
              </div>
              <div class="list-group list-group-flush border-bottom scrollarea">
              	<label class="mb-3 text-warning" style="display:block;" id="resultBooked">예약된 객실이 없습니다.</label>
              	<div class="list-group list-group-flush border-bottom scrollarea" id="booked">
              </div>
              </div>
            </div>
          </div>

      </div>
  </body>
  <script>
	let date = 0;
	let date2 = 0;

    $(document).ready(function() {

    	$("#searchIn").click(function() {
    		if($("#searchIn").val() == ""){
				$("#searchIn").val(getToday());
    		}
	    	$("#searchIn").attr( 'min', getToday() );
    	})
    	
    	$("#searchOut").click(function() {
    		if($("#searchOut").val() == "") {
		    	$("#searchOut").attr( 'min', $("#searchIn").val() );    			
    		}    		
    	})
    	
    	$("#btnSearch").click(function() {
    		
			let checkin = $("#searchIn").val();
			let checkout = $("#searchOut").val();
			let typename = $("#roomli option:selected").val();
			
			if($("#roomli option:selected").val() == 0) {
				typename = "all";
			} else {
				typename = $("#roomli option:selected").text();
			}
			
    		if(checkin == "" || checkout == ""){
    			alert("날짜를 선택해주세요.");
    			return false;
    		}
    		getDate(checkin,checkout)
    		if(checkin >= checkout) {
    			alert("체크아웃날짜를 다시 선택해주세요.");
    			return false;
    		} else {
    			
    			$.post("http://localhost:8080/getBookList",{checkin:checkin,checkout:checkout,typename:typename},function(result) {
    	    		console.log(checkin, checkout);
   	    			$('#btn_book *').remove();
    	    		$.each(result, function(ndx, value){
    				  	let li = '<a href="#" id="'+value['roomcode']+'" class="list-group-item list-group-item-action py-3 lh-tight" onclick="getRoomIndex(\''+value['roomname']+'\',\''+value['typename']+'\','+value['howmany']+','+value['howmuch']+','+value['roomcode']+')">'+
	    	             			'<div class="d-flex w-100 align-items-center justify-content-between">'+
	    	               				'<h5 class="fw-bold mb-1">'+value['roomname']+'</h5>'+
	    	              				 '<small>'+value['howmany']+'인</small>'+
	    	             			'</div>'+
	    	             			'<div class="d-flex w-100 align-items-center justify-content-between">'+
	    	               				'<div class="small" style="float:left">'+value['typename']+'</div>'+
	    	               				'<small>1박 '+value['howmuch']+'</small>'+
	    	             			'</div>'+
	    		       			'</a>';
    	              	$('#btn_book').append(li);
		    			$("#resultSearch").css("display", "none");
    	    		});
    	    	},'json')
    	    	
    	    	$.post("http://localhost:8080/bookedRoomList",{checkin:checkin,checkout:checkout,typename:typename},function(result) {
    	    		console.log(checkin, checkout);
   	    			$('#booked *').remove();
   	    			$("#resultBooked").css("display", "block");
    	    		$.each(result, function(ndx, value){
//    	    			let lit = '<option value='+value['roomcode']+'>'+value['roomname']+','+value['typename']+','+value['howmany']+','+value['howmuch']+'</option>';
    				  	let lit =
    				  		'<option value="'+value['bookcode']+'" id="b'+value['bookcode']+'" style="display:none;">'+value['roomname']+','+value['typename']+','+value['person']+','+value['howmany']+','+value['howmuch']+','+value['checkin']+','+value['checkout']+','+value['mobile']+','+value['roomcode']+','+value['name']+'</option>'+
    				  		'<a href="#" class="list-group-item list-group-item-action py-3 lh-tight"  style="display:block;" onclick="getIndex('+value['bookcode']+')">'+
				                  '<div class="d-flex w-100 align-items-center justify-content-between">'+
				                    '<h5 class="fw-bold mb-1">'+value['roomname']+'</h5>'+
				                    '<small>'+value['person']+'인 예약 [ '+value['name']+', '+value['mobile'].substr(7,4)+' ]</small>'+
				                  '</div>'+
				                  '<div class="d-flex w-100 align-items-center justify-content-between">'+
				                    '<div class="small" style="float:left">'+value['typename']+'</div>'+
				                    '<small>['+value['checkin']+' ~ '+value['checkout']+']</small>'+
				                  '</div>'+
			                	'</a>';
    	              	$('#booked').append(lit);
		    			$("#resultBooked").css("display", "none");
    	    		});
    	    	},'json')   
    	    	
    	    	
    		}
	    	return false;
    	})
		
		$("#btnCreate").click(function() {
	    	let roomcode = $('#roomcode').val();
	    	let person = $('#roomGuest').val();
	    	let checkin = $('#roomDateIn').val();
	    	let checkout = $('#roomDateOut').val();
	    	let name = $('#guestName').val();
	    	let mobile = $('#guestNum').val();
	    	let bookcode = $('#bookcode').val();
	    	if(person == "" || checkin == "" || checkout == "" || name == "" || mobile == "") {
	    		alert("값을 전부 입력해주세요.");
	    		return false;
	    	}
	    	if(bookcode == "") {
		    	$.post("http://localhost:8080/addBook",{roomcode:roomcode,person:person,checkin:checkin,checkout:checkout,name:name,mobile:mobile},function(result){
		    		if(result=="ok"){
		    			$('#btnSearch').trigger('click');
		    			del();
		    		}
		    	}, 'text');	    		
	    	} else {
	    		if(confirm("예약을 수정하시겠습니까?")) {
		    		$.post("http://localhost:8080/updateBook",{bookcode:bookcode,person:person,name:name,mobile:mobile},function(result){
			    		if(result=="ok"){
			    			$('#btnSearch').trigger('click');
			    			del();
			    		}
			    	}, 'text');
	    		}
	    	}
	    	return false;
	    })
	    
	    $('#btnDel').click(function() {
	    	if($('#bookcode').val() != '') {
		    	if(confirm("예약을 취소하시겠습니까?")) {
			    	$.post("/deleteBook",{bookcode:$('#bookcode').val()},function(result) {
			    		console.log(result);
			    		if(result=="ok"){
			    			$('#btnSearch').trigger('click');
			    			del();
			    		}
			    	}, 'text');
		    	}	    		
	    	}
	    	return false;
	    })
	    
	   	$('#btnClear').click(function() {
	        del();
	        return false;
	    })
    	
	    $(document).on("click",".list-group-item",function(event){
            // 동적으로 여러 태그가 생성된 경우라면 이런식으로 클릭된 객체를 this 키워드를 이용해서 잡아올 수 있다.
            for (let i = 0; i < $("#btn_room a").length; i++) {                    
            	$("#btn_room a").removeClass("active");
                $("#btn_room a").removeClass("bg-warning");
 	        }
            
            $(this).addClass("active");
            $(this).addClass("bg-warning");
         });
    	
//    	.on('change','#roomDateIn, #roomDateOut', function() {
//    		getDate($('#roomDateIn').val(),$('#roomDateOut'). val());
//    	});
	     
    })

    function getIndex(num) {
    	del();
    	let str = $('#b'+num).text();
    	let arr = str.split(",");
    	$('#roomName').val(arr[0]);
        $('#roomtype').val(arr[1]);
        $('#roomGuest').val(arr[2]);
        $('#roomGuest').attr('max', arr[3]);
        $('#oneDay').text("1박 "+arr[4]+"원");
        $('#roomDateIn').val(arr[5]);
        $('#roomDateOut').val(arr[6]);
        $('#guestNum').val(arr[7]);
    	$('#roomcode').val(arr[8]);
    	$('#guestName').val(arr[9]);
        
		getDate(arr[5],arr[6]);
        //let day = date2-date;
        let day = (date2.getTime() - date.getTime()) / (1000*60*60*24);
        console.log(date,date2,day);
        
        $('#roomPriceDay').text(day+"박");
        $('#roomPrice').val(parseInt(arr[4])*day);
        
        let code = $('#b'+num).val();
        $('#bookcode').val(code);

        return false;
	}
    
    function getRoomIndex(a,b,c,d,e) {
    	del();
   	 	$('#roomName').val(a);
        $('#roomtype').val(b);
        $('#roomGuest').val(1);
        $('#roomGuest').attr('max', c);
        $('#oneDay').text("1박 "+d+"원");
        
        $('#roomDateIn').val($("#searchIn").val());
        $('#roomDateOut').val($("#searchOut").val());
        
		getDate($("#searchIn").val(),$("#searchOut").val());
        //let day = date2-date;
        let day = (date2.getTime() - date.getTime()) / (1000*60*60*24);
        console.log(date,date2,day);
        
        $('#roomPriceDay').text(day+"박");
        $('#roomPrice').val(parseInt(d)*day);

    	$('#roomcode').val(e);
    	
        return false;
	}
    
    function getDate(a,b) {
    	let date_arr = a.split("-");
    	let date2_arr = b.split("-");
    	date = new Date(date_arr[0], date_arr[1], date_arr[2]);
    	date2 = new Date(date2_arr[0], date2_arr[1], date2_arr[2]);
    }
    
	function getToday(){
		let today = new Date();
	    var year = today.getFullYear();
	    var month = ("0" + (1 + today.getMonth())).slice(-2);
	    var day = ("0" + today.getDate()).slice(-2);

	    return year + "-" + month + "-" + day;
	}
	
	function del() {
		$('#roomName, #roomtype, #roomGuest, #roomDateIn, #roomDateOut, #guestNum, #roomcode, #guestName,#roomPrice, #bookcode').val('');
        $('#oneDay').text("1박 -원");
        $('#roomPriceDay').text("-박");                 
        $("a").removeClass("active bg-warning");
	}
  </script>
</html>