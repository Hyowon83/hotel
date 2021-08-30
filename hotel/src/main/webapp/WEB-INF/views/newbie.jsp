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
			<form method = "post" action = "/app/">
                <label for="username" style="float:left">USERNAME</label>
                <input class="form-control mb-3" type="text" name="username">
                <label for="userid" style="float:left">USERID</label>
                <input class="form-control mb-3" type="text" name="userid">
                <label for="userpw" style="float:left">PASSWORD</label>
                <input class="form-control mb-3" type="password" name="userpw">
                <label for="checkpw" style="float:left">checkPASSWORD</label>
                <input class="form-control mb-3" type="password" name="checkpw">
				<button type = submit onclick="location.href='newbie?path=login'" class="btn btn-lg btn-warning">회원가입</button>
				<button type = button onclick="location.href='/app/'" class="btn btn-lg btn-warning">돌아가기</button>
				<button type = reset class="btn btn-lg btn-danger">취소</button>
			</form>
            </div>
          </div>
        </div>
      </div>
</body>
</html>