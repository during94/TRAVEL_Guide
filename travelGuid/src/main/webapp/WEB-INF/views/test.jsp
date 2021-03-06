<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>네이버 소셜로 로그인 하기</title>
<script type="text/javascript" src="js/member.js"></script>
</head>
<body>

	<h1>메인 페이지 입니다.</h1>
	<hr>
	<br>
	<form name="frmm" action="mail_check" method="post" style="text-align: center;">
		<input type="text" name="email" value="during94@naver.com">
		<button>메일 보내기</button><br>
	</form>
	href
		<a href="mail_check">메일 발송하기</a>
	<hr>
	
	<h1>테스트 하기</h1>
	<input type="text" id="login_email" name="login_email" value="${loginUser.email_check }">
	<input type="button" value="onclick 확인하기" onclick="mail_ck(${loginUser.email_check })">
</body>
</html>