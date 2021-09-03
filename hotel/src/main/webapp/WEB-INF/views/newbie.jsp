<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <title>회원가입</title>
  </head>
  <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
  <body  style="overflow-x: hidden">
    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

    <div class="row row-cols-1 row-cols-md-3 mb-3 text-center d-flex justify-content-center">

        <div class="col-4">
          <div class="card mb-4 rounded-3 shadow-sm bg-dark text-white">
            <div class="card-header py-3 text-white">
              <h4 class="my-0 fw-normal">회원가입</h4>
            </div>
            <div class="card-body">
			<form method = "post" action = "/app/signin">
                <label for="username" style="float:left">USERNAME</label>
                <input class="form-control mb-3" type="text" id="username" name="username">
                <label for="userid" style="float:left">USERID</label>
                <input class="form-control mb-3" type="text" id="userid" name="userid">
                <input type = text id="userid_check">
                <label for="userpw" style="float:left">PASSWORD</label>
                <input class="form-control mb-3" type="password" id="userpw" name="userpw">
                <label for="checkpw" style="float:left">checkPASSWORD</label>
                <input class="form-control mb-3" type="password" id="checkpw">
				<button type = submit id="signin" class="btn btn-lg btn-warning">회원가입</button>
				<button type = button onclick="location.href='/app/'" class="btn btn-lg btn-warning">돌아가기</button>
				<button type = reset class="btn btn-lg btn-danger">취소</button>
			</form>
            </div>
          </div>
        </div>
      </div>
</body>
<script>
	$(document).ready(function() {

		$('#signin').click(function(result) {
			console.log(result);
			let username = $('#username').val();
	    	let userid = $('#userid').val();
	    	let userpw = $('#userpw').val();
	    	let checkpw = $('#checkpw').val();
	    	
	    	if(username == "" || userid == "" || userpw == "") {
	    		alert("값을 전부 입력해주세요.");
	    		return false;
	    	}
	    	if(userpw != checkpw) {
	    		alert("비밀번호가 일치하지 않습니다.");
	    		return false;
			} else if(result == "nope") {
				alert("이미 존재하는 아이디입니다.");
				return false;
			} else {
				alert("회원가입이 완료되었습니다.");
			}
	    	
	    	console.log(username,userid,userpw,checkpw);
		})
	})
</script>
</html>