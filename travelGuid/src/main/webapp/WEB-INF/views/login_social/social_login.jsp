<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>소셜로 로그인 하기</title>
</head>
<body>
	<h1>소셜로 로그인 하기 메인 페이지</h1>
<div align="center">
	<c:choose>
		<c:when test="${sessionId != null || sessionId_kakao != null}">
			<c:choose>
				<c:when test="${sessionId != null}">
					<h2>네이버 아이디 로그인 성공</h2>
					<h3>"${sessionId }"님 환영합니다! 번호 : ${sessionPhone}</h3>
					
					<h3><a href="logout">로그아웃</a></h3>
				</c:when>
				<c:when test="${sessionId_kakao != null}">
					<h2>카카오 아이디 로그인 성공</h2>
					<h3>"${sessionId_kakao }"님 환영합니다!</h3>
					
					<h3><a href="logout_kakao">로그아웃</a></h3>
				</c:when>
			</c:choose>
		</c:when>
		
		<c:otherwise>
			<form action="login.userdo" method="post" name="frm" style="width:470px;">
				<h2>로그인</h2>
				<input type="text" name="id" id="id" class="w3-input w3-border" placeholder="아이디" value="${id}">
				<input type="password" name="pwd" id="pwd" class="w3-input w3-border" placeholder="비밀번호">
				<input type="submit" value="로그인" onclick="#"><br><br>
				
				<!-- 네이버 로그인 창으로 이동 -->
				<div id="naver_id_login" style="text-align:center"><a href="${naver_url}">
				<img width="223" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/></a></div>
				
				<!-- 카카오 로그인 창으로 이동 -->
				<div id="kakao_id_login" style="text-align:center"><a href="https://kauth.kakao.com/oauth/authorize?client_id=d0d0c0c71fb503150f19737bd084fd2e&redirect_uri=http://localhost:8080/biz/social_login_kakao&response_type=code">
				<img width="223" src="https://www.gb.go.kr/Main/Images/ko/member/certi_kakao_login.png"/></a></div>
				<br>
			</form>
		</c:otherwise>
	</c:choose>
</div>
</body>
</html>