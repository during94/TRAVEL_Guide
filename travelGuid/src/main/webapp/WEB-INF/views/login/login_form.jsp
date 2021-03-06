<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/member.js"></script>
<link href="css/main3.css" rel="stylesheet">
</head>
<body>
<div align="center">
<form name="frm" action="login" method="post">
	<h3>아이디  <input type="text" name="id"></h3>
	<h3>비밀번호  <input type="password" name="pwd"></h3>
	<input type="submit" value="로그인">
	<input type="button" value="회원가입" onclick="location = 'join_form'">
	<input type="button" value="아이디 및 비밀번호 찾기" onclick="go_find_login();">
	<br><br>
			<!-- 네이버 로그인 창으로 이동 -->
			<div id="naver_id_login" style="text-align:center"><a href="${naver_url}">
			<img width="223" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/></a></div>
				
			<!-- 카카오 로그인 창으로 이동 -->
			<div id="kakao_id_login" style="text-align:center"><a href="https://kauth.kakao.com/oauth/authorize?client_id=d0d0c0c71fb503150f19737bd084fd2e&redirect_uri=http://localhost:8080/biz/social_login_kakao&response_type=code">
			<img width="223" src="https://www.gb.go.kr/Main/Images/ko/member/certi_kakao_login.png"/></a></div>
			<br>

</form>
</div>
</body>
</html>