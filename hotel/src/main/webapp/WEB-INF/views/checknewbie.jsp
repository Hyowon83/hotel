<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 확인</title>
</head>
<body>
<form method = "post" action = "/app/tologin">
	USERNAME: ${name}<br>
	USERID: ${id}<br><br>
	위 정보가 맞습니까?<br><br>
	<button type = submit onclick="location.href='check?path=login'">로그인하기</button>
	<button type = button onclick="location.href='check?path=choose'">돌아가기</button>
</form>
</body>
</html>