<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/main3.css" rel="stylesheet">
<script type="text/javascript" src="js/member.js"></script>
</head>
<body>
<c:choose>
	<c:when test="${loginUser.id != null}">
		<form name="frmm" action="mail_check" method="post" style="text-align: center;">
			<table>
				<tr>
					<td>id</td>
					<td>
						${loginUser.id }
						<input type="hidden" name="id" value="${loginUser.id }">
					</td>
				</tr>
				<tr>
					<td>이름</td>
					<td>
						${loginUser.name }
						<input type="hidden" name="name" value="${loginUser.name }">	
					</td>
				</tr>
				<tr>
					<td>e-mail</td>
					<td>${loginUser.email }
					<br>
						<c:choose>
							<c:when test="${loginUser.email_check != 'Y' }">
								<input type="button" value="인증하기" onclick="mail_check()">
							</c:when>
							<c:otherwise>
								<span style="color: blue;"><c:out value="인증이 완료 되었습니다" ></c:out></span>
							</c:otherwise>
						</c:choose>
						<input type="hidden" name="email" value="${loginUser.email }">
					</td>
				</tr>
				<tr>
					<td>휴대폰</td>
					<td>
						${loginUser.phone }
						<input type="hidden" name="phone" value="${loginUser.phone }">
						</td>
				</tr>
			</table>
			<input type="button" value="회원 정보 수정" onclick="location.href='mypage_update'">
			<input type="button" value="메인 페이지로" onclick="location.href='main'">
		</form>
	</c:when>
	<c:when test="${sessionId != null }">
		<form name="frmm" action="" style="text-align: center;">
			<table>
				<tr>
					<td>이름</td>
					<td>${sessionId}</td>
				</tr>
				<tr>
					<td>핸드폰 번호</td>
					<td>${sessionPhone}</td>
				</tr>
				<tr>
					<td>성별</td>
					<c:choose>
						<c:when test="${sessionGender == 'M' || sessionGender == 'm'}">
							<td>남성</td>
						</c:when>
						<c:otherwise>
							<td>여성</td>
						</c:otherwise>
					</c:choose>
				</tr>
			</table>
			<input type="button" value="메인 페이지로" onclick="location.href='main'">
		</form>
	</c:when>
	<c:otherwise>
		<form id="frmm" action="" style="text-align: center;">
			<table>
				<tr>
					<td>닉네임</td>
					<c:choose>
						<c:when test="${sessionId_kakao == true}">
							<td>개인정보 동의 후 확인가능</td>
						</c:when>
						<c:otherwise>
							<td>${sessionId_kakao}</td>
						</c:otherwise>
					</c:choose>
				</tr>
				<tr>
					<td>성별</td>
					<c:choose>
						<c:when test="${sessionId_kakao_gender == true}">
							<td>개인정보 동의 후 확인가능</td>
						</c:when>
						<c:otherwise>
							<td>${sessionId_kakao_gender}</td>
						</c:otherwise>
					</c:choose>
				</tr>
				<tr>
					<td>e-mail</td>
					<c:choose>
						<c:when test="${sessionId_kakao_mail == true}">
							<td>개인정보 동의 후 확인가능</td>
						</c:when>
						<c:otherwise>
							<td>${sessionId_kakao_mail}</td>
						</c:otherwise>
					</c:choose>
				</tr>
				<tr>
					<td>생일</td>
					<c:choose>
						<c:when test="${sessionId_kakao_birthday == true}">
							<td>개인정보 동의 후 확인가능</td>
						</c:when>
						<c:otherwise>
							<td>${sessionId_kakao_birthday}</td>
						</c:otherwise>
					</c:choose>
				</tr>
			</table>
			<input type="button" value="메인 페이지로" onclick="location.href='main'">
		</form>
	</c:otherwise>
</c:choose>
</body>
</html>