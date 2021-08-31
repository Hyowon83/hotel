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
              <li><a href="/app/booking" class="nav-link px-2 text-white">예약관리</a></li>
              <li><a class="nav-link px-2 text-warning">객실관리</a></li>
            </ul>
            <div>
	            <small>${loginid}님 환영합니다.</small>
	            <a href="/app/logout" class="text-white">로그아웃</a>            
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
            <div class="list-group list-group-flush border-bottom scrollarea" id="btn_room">

			  	<c:forEach items = "${list}" var = "room" varStatus = "num">
                  <input type="hidden" id="${num.index}" value="${room.roomname},${room.type},${room.howmany},${room.howmuch}">
			  		<a href="#" class="list-group-item list-group-item-action py-3 lh-tight" onclick="getIndex(${num.index})" value="${room.roomcode}">
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
                <input type="hidden" id="roodcode">
                <label for="roomli" style="float:left">객실 종류</label>
                <select class="form-select mb-3" size="5" id="roomli">
                	<c:forEach items = "${type}" var = "rtype">
			  		<option value="${rtype.typecode}">${rtype.name}</option>
					</c:forEach>
                </select>
                <label for="roomGuest" style="float:left">인원제한</label>
                <div class="input-group mb-3">
                    <input type="number" class="form-control" id="roomGuest" value="" readonly>
                    <button class="input-group-text" id="guestUp">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-down-circle" viewBox="0 0 16 16">
                            <path fill-rule="evenodd" d="M1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8zm15 0A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8.5 4.5a.5.5 0 0 0-1 0v5.793L5.354 8.146a.5.5 0 1 0-.708.708l3 3a.5.5 0 0 0 .708 0l3-3a.5.5 0 0 0-.708-.708L8.5 10.293V4.5z"/>
                        </svg>
                    </button>
                    <button class="input-group-text" id="guestDown">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-up-circle" viewBox="0 0 16 16">
                            <path fill-rule="evenodd" d="M1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8zm15 0A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-7.5 3.5a.5.5 0 0 1-1 0V5.707L5.354 7.854a.5.5 0 1 1-.708-.708l3-3a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708L8.5 5.707V11.5z"></path>
                        </svg>
                    </button>
                  </div>
                <label for="roomPrice" style="float:left">1박요금</label>
                <div class="input-group mb-3">
                    <input type="text" class="form-control" id="roomPrice" style = "text-align:right" placeholder=", 없이 입력" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
                    <span class="input-group-text" id="roomPrice">원</span>
                </div>
                
                <button type="button" id="btnCreate" class="btn btn-lg btn-warning">등록</button>
                <button type="button" id="btnDel" class="btn btn-lg btn-warning">삭제</button>
                <button type="button" id="btnClear" class="btn btn-lg btn-warning">초기화</button>
            </div>
          </div>
        </div>
      </div>
  </body>
  <script>
    $(document).ready(function() {
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
	     });
    	
	    $('#btnClear').click(function() {
	        $('#roomName').val('');
	        $('#roomGuest').val('');
	        $('#roomPrice').val('');
	        $("select option").prop("selected", false);
	    })
    })
    
    function getIndex(num) {
    	let str = $('#'+num).val();
		let arr = str.split(",");
        $('#roomName').val(arr[0]);
        $('#roomli').val(arr[1]);
        $('#roomGuest').val(arr[2]);
        $('#roomPrice').val(arr[3]);
	}
  </script>
</html>