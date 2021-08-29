<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   String loginid=(String)session.getAttribute("loginid");
   if(!loginid.equals("hyowon83")){
      response.sendRedirect("http://localhost:8080/app/tologin");
   }
%>
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
                        <input type="date" class="form-control">
                        <span class="input-group-text" id="roomPrice">17:00~</span>
                    </div>
                    <div class="input-group mb-3">
                        <input type="date" class="form-control">
                        <span class="input-group-text" id="roomPrice">~12:00</span>
                    </div>
                    <label for="roomli" style="float:left">객실 종류</label>
                    <select class="form-select" size="1" id="roomli">
                        <option value="">-종류선택-</option>
                        <option value="family">패밀리룸</option>
                        <option value="suite">스위트룸</option>
                        <option value="event">이벤트룸</option>
                        <option value="special">특실</option>
                        <option value="common">일반실</option>
                    </select><br />
                    
                    <button type="button" id="btnSearch" class="btn btn-lg btn-warning">검색</button>
                </div>
              </div>

                <div class="card mb-4 rounded-3 shadow-sm bg-dark text-white">
                    <div class="card-header py-3">
                      <h4 class="my-0 fw-normal">검색된객실</h4>
                    </div>
                    <div class="list-group list-group-flush border-bottom scrollarea">
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
                <label for="roomLi" style="float:left">객실 종류</label>
                <input class="form-control mb-3" type="text" name="roomLi" id="roomLi" value="" readonly>
                <label for="roomGuest" style="float:left">숙박인원</label>
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
                <label for="roomDay" style="float:left">숙박 기간</label>
                <div class="input-group mb-1">
                      <input type="date" class="form-control">
                      <span class="input-group-text" id="roomDateIn">17:00~</span>
                </div>
                <div class="input-group mb-3">
                      <input type="date" class="form-control">
                      <span class="input-group-text" id="roomDateOut">~12:00</span>
                </div>
                <div class="d-flex w-100 align-items-center justify-content-between">
                    <label for="roomPrice" style="float:left">총 숙박비용</label>
                    <small id="oneDay">1박-원</small>
                </div>
                <div class="input-group mb-3">
                    <span class="input-group-text" id="roomPriceDay">-박</span>
                    <input type="text" class="form-control" id="roomPrice" style = "text-align:right" placeholder=", 없이 입력" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
                    <span class="input-group-text" id="roomPrice">원</span>
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
                <a href="#" class="list-group-item list-group-item-action py-3 lh-tight" id="seonggeoR">
                    <div class="d-flex w-100 align-items-center justify-content-between">
                      <h5 class="fw-bold mb-1">성거산</h5>
                      <small>1인예약</small>
                    </div>
                    <div class="d-flex w-100 align-items-center justify-content-between">
                        <div class="small" style="float:left">일반실</div>
                        <small>[21.08.13~14/0928]</small>
                    </div>
                  </a>
                  <a href="#" class="list-group-item list-group-item-action py-3 lh-tight" id="baebangR">
                    <div class="d-flex w-100 align-items-center justify-content-between">
                      <h5 class="fw-bold mb-1">배방산</h5>
                      <small>1인예약</small>
                    </div>
                    <div class="d-flex w-100 align-items-center justify-content-between">
                        <div class="small" style="float:left">특실</div>
                        <small>[21.08.15~16/0640]</small>
                    </div>
                  </a>
                  <a href="#" class="list-group-item list-group-item-action py-3 lh-tight" id="gwangdukR">
                    <div class="d-flex w-100 align-items-center justify-content-between">
                      <h5 class="fw-bold mb-1">광덕산</h5>
                      <small>2인예약</small>
                    </div>
                    <div class="d-flex w-100 align-items-center justify-content-between">
                        <div class="small" style="float:left">특실</div>
                        <small>[21.08.18~21/5012]</small>
                    </div>
                  </a>
              </div>
            </div>
          </div>

      </div>
  </body>
  <script>
    //let n=2;
    //$('#roomPriceDay').text(`${n}박`);
    //$('#oneDay').text(`1박 ${n}원`);
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
     $(document)
    .on('click', '#baekdu', function() {
        $('#roomName').val("백두산");
        $('#roomLi').val('패밀리룸');
        $('#roomGuest').val("4");
        $('#roomPrice').val(65000);
        $('#guestNum').val('');
    })
    .on('click', '#hanla', function() {
        $('#roomName').val("한라산");
        $('#roomLi').val('스위트룸');
        $('#roomGuest').val("2");
        $('#roomPrice').val(45000);
        $('#guestNum').val('');
    })
    .on('click', '#jiri', function() {
        $('#roomName').val("지리산");
        $('#roomLi').val('이벤트룸');
        $('#roomGuest').val("4");
        $('#roomPrice').val(60000);
        $('#guestNum').val('');
    })
    .on('click', '#baebang', function() {
        $('#roomName').val("배방산");
        $('#roomLi').val('특실');
        $('#roomGuest').val("2");
        $('#roomPrice').val(50000);
        $('#guestNum').val('');
    })
    .on('click', '#baebangR', function() {
        $('#roomName').val("배방산");
        $('#roomLi').val('특실');
        $('#roomGuest').val("1");
        $('#roomPrice').val(50000);
        $('#guestNum').val('01012340640');
    })
    .on('click', '#gwangduk', function() {
        $('#roomName').val("광덕산");
        $('#roomLi').val('특실');
        $('#roomGuest').val("2");
        $('#roomPrice').val(50000);
        $('#guestNum').val('');
    })
    .on('click', '#gwangdukR', function() {
        $('#roomName').val("광덕산");
        $('#roomLi').val('특실');
        $('#roomGuest').val("2");
        $('#roomPrice').val(150000);
        $('#guestNum').val('01099995012');
    })
    .on('click', '#seonggeo', function() {
        $('#roomName').val("성거산");
        $('#roomLi').val('일반실');
        $('#roomGuest').val("2");
        $('#roomPrice').val(40000);
        $('#guestNum').val('');
    })
    .on('click', '#seonggeoR', function() {
        $('#roomName').val("성거산");
        $('#roomLi').val('일반실');
        $('#roomGuest').val("1");
        $('#roomPrice').val(40000);
        $('#guestNum').val('01022220928');
    })
    .on('click', '#taejo', function() {
        $('#roomName').val("태조산");
        $('#roomLi').val('특실');
        $('#roomGuest').val("2");
        $('#roomPrice').val(50000);
        $('#guestNum').val('');
    })
    .on('click', '#btnClear', function() {
        $('#roomName').val('');
        $('#roomLi').val('');
        $('#roomGuest').val('');
        $('#roomPrice').val('');
        $('#guestNum').val('');
    })
  </script>
</html>