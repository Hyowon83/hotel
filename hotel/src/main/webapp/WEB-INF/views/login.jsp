<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
<form method = "post" action = "/app/check_user/">
	USERID: <input type = text name = userid><br>
	PASSWORD: <input type = password name = userpw><br><br>
	<button type = submit onclick="location.href='login?path=login'">로그인</button>
	<button type = button onclick="location.href='login?path=choose'">취소</button>
</form>
</body>
</html>