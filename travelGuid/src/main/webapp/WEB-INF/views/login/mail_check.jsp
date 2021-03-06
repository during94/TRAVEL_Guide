<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메일 인증</title>
<script type="text/javascript" src="js/member.js"></script>
</head>
<body>
<form action="email_ck_ok" id="email_ck" name="email_ck" method="post" style="text-align: center;">
	<h3>인증 페이지 입니다</h3>
	<input type="text" id="mail_ck" name="mail_ck" placeholder="인증 번호를 입력해주세요">
	<input type="button" value="인증하기" onclick="email_check_form('${loginUser.email_check }')">
</form>
</body>
</html>