<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
<form method = "post" action = "/app/checknewbie">
	USERNAME: <input type = text name = username><br>
	USERID: <input type = text name = userid><br>
	PASSWORD: <input type = password name = password><br>
	CHECK PASSWORD: <input type = password name = checkpw><br><br>
	<button type = submit onclick="location.href='newbie?path=login'">회원가입</button>
	<button type = button onclick="location.href='newbie?path=choose'">취소</button>
</form>
</body>
</html>