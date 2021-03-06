<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<script type="text/javascript" src="js/member.js"></script>
<style type="text/css">
body{   
  background-color:#B96DB5;
  font-family: Verdana;
}
#wrap{     
  margin: 0 20px;
}
h1 {
  font-family: "Times New Roman", Times, serif;
  font-size: 45px;
  color: #CCC;
  font-weight: normal;
}
input[type=button], input[type=submit] {
  float: right;
}
</style>
<script type="text/javascript">
function idok(){
  self.close();
}
</script>
</head>
<body>
<div id="wrap">
  <h1>비밀번호 찾기 결과</h1>
  <form method=post name=formm style="margin-right:0" >
    <div style="margin-top: 20px">
    	<input type="hidden" name="id" value="${id}">
      <c:if test="${message == 1}">
      	<label>Password</label> 
        <input type="password"  name="pwd"><br> 
        <label>Retype Password</label> 
        <input type="password"  name="pwdCheck"><br> 
        <input type="button" value="비밀번호 변경" class="cancel" onclick="changePassword()">
      </c:if>
      <c:if test="${message== -1}">
             잘못된 사용자 정보입니다.
		<input type="button" value="확인" class="cancel" onclick="resite()">
      </c:if>
    </div>
    
  </form>
</div>  
</body>
</html>