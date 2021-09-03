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

    <title>호텔객실예약</title>
  </head>
  <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
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
              <li><a href="/app/" class="nav-link px-2 text-secondary">Home</a></li>
              <li><a class="nav-link px-2 text-warning">예약관리</a></li>
              <li><a href="/app/room" class="nav-link px-2 text-white">객실관리</a></li>
            </ul>
            <div>
	            <small>${loginid}님 환영합니다.</small>
	            <a href="/app/logout" class="text-white">로그아웃</a>            
            </div>
          </div>
        </div>
      </header>

      <div class="row row-cols-1 row-cols-md-3 mb-3 text-center d-flex justify-content-center">

        <div class="col-3">
            <div class="card mb-4 rounded-3 shadow-sm bg-dark text-white">
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
                        <option value="">-종류선택-</option>
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
                    <div class="list-group list-group-flush border-bottom scrollarea">
                    <select id="btn_book" size="10">
                    <c:forEach items = "${list}" var = "room">
	                  <option value="${room.roomcode}">${room.roomname},${room.typename},${room.howmany},${room.howmuch}</option>
					</c:forEach>
                    </select>
                        <!-- <label class="mb-3 text-warning">검색된 객실이 없습니다.</label> -->
                        <a href="#" class="list-group-item list-group-item-action py-3 lh-tight" id="baebang">
                            <div class="d-flex w-100 align-items-center justify-content-between">
                              <h5 class="fw-bold mb-1">배방산</h5>
                              <small class="text-muted">2인</small>
                            </div>
                            <div class="small" style="float:left">특실</div>
                            <div class="small" style="float:left; color:red; display:none">(예약완료)</div>
                        </a>
                        <a href="#" class="list-group-item list-group-item-action py-3 lh-tight" id="gwangdukR">
                            <div class="d-flex w-100 align-items-center justify-content-between">
                              <h5 class="fw-bold mb-1">광덕산</h5>
                              <small class="text-muted">2인</small>
                            </div>
                            <div class="small" style="float:left">특실</div>
                            <div class="small" style="float:left; color:red; display:block">(예약완료)</div>
                        </a>
                        <a href="#" class="list-group-item list-group-item-action py-3 lh-tight" id="taejo">
                            <div class="d-flex w-100 align-items-center justify-content-between">
                              <h5 class="fw-bold mb-1">태조산</h5>
                              <small class="text-muted">2인</small>
                            </div>
                            <div class="small" style="float:left">특실</div>
                            <div class="small" style="float:left; color:red; display:none">(예약완료)</div>
                        </a>
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
                <input class="form-control mb-3" type="text" name="roomName" id="roomName" value="" readonly>
                <label for="roomtype" style="float:left">객실 종류</label>
                <input class="form-control mb-3" type="text" name="roomtype" id="roomtype" value="" readonly>
                <label for="roomGuest" style="float:left">숙박인원</label>
                <div class="input-group mb-3">
                    <input type="number" class="form-control" id="roomGuest" value="" min="1" max="">
                </div>
                <label for="roomDay" style="float:left">숙박 기간</label>
                <div class="input-group mb-1">
                      <input type="date" class="form-control" id="roomDateIn">
                      <span class="input-group-text">17:00~</span>
                </div>
                <div class="input-group mb-3">
                      <input type="date" class="form-control" id="roomDateOut">
                      <span class="input-group-text">~12:00</span>
                </div>
                <div class="d-flex w-100 align-items-center justify-content-between">
                    <label for="roomPrice" style="float:left">총 숙박비용</label>
                    <small id="oneDay">1박 -원</small>
                </div>
                <div class="input-group mb-3">
                    <span class="input-group-text" id="roomPriceDay">-박</span>
                    <input type="text" class="form-control" id="roomPrice" style = "text-align:right" placeholder=", 없이 입력" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
                    <span class="input-group-text">원</span>
                </div>
                <label for="guestNum" style="float:left">예약자 연락번호</label>
                <input class="form-control mb-3" type="text" name="guestNum" id="guestNum" value="" placeholder="- 없이 입력" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
                <button type="button" id="btnCreate" class="btn btn-lg btn-warning">등록</button>
                <button type="button" id="btnDel" class="btn btn-lg btn-warning">취소</button>
                <button type="button" id="btnClear" class="btn btn-lg btn-warning">초기화</button>
            </div>
          </div>
        </div>

        <div class="col-3">
            <div class="card mb-4 rounded-3 shadow-sm bg-dark text-white">
              <div class="card-header py-3">
                <h4 class="my-0 fw-normal">예약현황</h4>
              </div>
              <div class="list-group list-group-flush border-bottom scrollarea">
                <c:forEach items = "${book}" var = "book" varStatus = "num">
                  <option id="${num.index}" value="${book.roomcode}" style="display:none;">${book.roomname},${book.typename},${book.person},${book.howmuch},${book.checkin},${book.checkout},${book.mobile},${book.howmany}</option>
			  		<a href="#" class="list-group-item list-group-item-action py-3 lh-tight" onclick="getIndex(${num.index})">
	                  <div class="d-flex w-100 align-items-center justify-content-between">
	                    <h5 class="fw-bold mb-1">${book.roomname}</h5>
	                    <small>${book.howmany}인 예약</small>
	                  </div>
	                  <div class="d-flex w-100 align-items-center justify-content-between">
	                    <div class="small" style="float:left">${book.typename}</div>
	                    <small>[${book.checkin} ~ ${book.checkout}]</small>
	                  </div>
                	</a>
				</c:forEach>
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
//			if($("#btn_book option").length > 0) {
//		 		$.post("http://localhost:8080/app/deleteBooking1",{},function(result) {
//		  			if(result=="del"){
//		  				console.log(result);
//		   			location.reload();    				
//		  			}
//		   		}, 'text');    			
//			}
			let checkin = $("#searchIn").val();
			let checkout = $("#searchOut").val();
			let typename = $("#roomli option:selected").text();
//    		console.log(checkin,checkout,typename);
//    		
    		if(checkin == "" || checkout == ""){
    			alert("날짜를 선택해주세요.");
    			return false;
    		} else if(typename == "-종류선택-") {
    			alert("객실 종류를 선택해주세요.");
    			return false;
    		}
    		getDate(checkin,checkout)
    		if(checkin >= checkout) {
    			alert("체크아웃날짜를 다시 선택해주세요.");
    			return false;
    		}
//    		} else {
//    			$.post("http://localhost:8080/app/getAbleBookList",{typename:typename},function(result){
//    				if(result=="search"){
//        				console.log(result);
//    	    			location.reload();    
//        			}
//		    	}, 'text');	    			
//    		}
//	    	return false;
//    	})
    })
    
    $(".list-group-item").click(function(){

        var listItems = $(".list-group-item"); //Select all list items
     
        //Remove 'active' tag for all list items
        for (let i = 0; i < listItems.length; i++) {                    
           listItems[i].classList.remove("active");
           listItems[i].classList.remove("bg-warning");
        }
     
        //Add 'active' tag for currently selected item
        this.classList.add("active");
        this.classList.add("bg-warning");
     })
     
     $("#btn_book option").click(function() {
    	 let str = $(this).text();
    	 let arr = str.split(",");
    	 $('#roomName').val(arr[0]);
         $('#roomtype').val(arr[1]);
         $('#roomGuest').val(1);
         $('#roomGuest').attr('max', arr[2]);
         $('#oneDay').text("1박 "+arr[3]+"원");
         
         $('#roomDateIn').val($("#searchIn").val());
         $('#roomDateOut').val($("#searchOut").val());
         
 		getDate($("#searchIn").val(),$("#searchOut").val());
         let day = date2-date;
         console.log(date,date2,day);
         
         $('#roomPriceDay').text(day+"박");
         $('#roomPrice').val(parseInt(arr[3])*day);
         
     	let code = $(this).val();
     	$('#roomcode').val(code);
         return false;
     })
    })

    function getIndex(num) {
    	let str = $('#'+num).text();
    	let arr = str.split(",");
    	$('#roomName').val(arr[0]);
        $('#roomtype').val(arr[1]);
        $('#roomGuest').val(arr[2]);
        $('#roomGuest').attr('max', arr[7]);
        $('#oneDay').text("1박 "+arr[3]+"원");
        $('#roomDateIn').val(arr[4]);
        $('#roomDateOut').val(arr[5]);
        $('#guestNum').val(arr[6]);
        
		getDate(arr[4],arr[5]);
        let day = date2-date;
        console.log(date,date2,day);
        
        $('#roomPriceDay').text(day+"박");
        $('#roomPrice').val(parseInt(arr[3])*day);
        
    	let code = $('#'+num).val();
    	$('#roomcode').val(code);
        return false;
	}
    
    function getDate(a,b) {
    	date = a.replace(/\-/g,"");
    	date = parseInt(date);
    	date2 = b.replace(/\-/g,"");
    	date2 = parseInt(date2);
    }
    
	function getToday(){
		let today = new Date();
	    var year = today.getFullYear();
	    var month = ("0" + (1 + today.getMonth())).slice(-2);
	    var day = ("0" + today.getDate()).slice(-2);

	    return year + "-" + month + "-" + day;
	}
  </script>
</html>