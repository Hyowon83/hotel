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

    <title>로그인</title>
  </head>
  <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
  <body  style="overflow-x: hidden">
    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

    <div class="row row-cols-1 row-cols-md-3 mb-3 text-center d-flex justify-content-center">

        <div class="col-4">
          <div class="card mb-4 rounded-3 shadow-sm bg-dark text-white">
            <div class="card-header py-3 text-white">
              <h4 class="my-0 fw-normal">로그인</h4>
            </div>
            <div class="card-body">
			<form method = "post" action = "/app/check_user/">
                <label for="roomName" style="float:left">USERID</label>
                <input class="form-control mb-3" type="text" name="userid">
                <label for="roomName" style="float:left">PASSWORD</label>
                <input class="form-control mb-3" type="password" name="userpw">
				<button type = submit id="submitlogin" class="btn btn-lg btn-warning">로그인</button>
				<button type = button onclick="location.href='login?path=newbie'" class="btn btn-lg btn-warning">회원가입</button>
				<button type = reset class="btn btn-lg btn-danger">취소</button>
			</form>
            </div>
          </div>
        </div>
      </div>
</body>
<script>
$(document).ready(function() {
	
	$("#submitlogin").click(function() {
		let pstr = $.trim($("input[name=userid]").val());
		$("input[name=userid]").val(pstr);
		pstr = $.trim($("input[name=userpw]").val());
		$("input[name=userpw]").val(pstr);
		if($("input[name=userid]").val() == "") {
			alert("아이디를 입력하세요.");
			return false;
		}
		if($("input[name=userpw]").val() == "") {
			alert("비밀번호를 입력하세요.");
			return false;
		}
		return true;
	})
	
})
</script>
</html>