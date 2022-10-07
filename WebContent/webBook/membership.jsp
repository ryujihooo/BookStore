<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
</head>
<jsp:include page="header.jsp" />
	<div class="jumbotron">
		<div class="container" align="center">
			<form method="post" action="membership_process.jsp">
					<h3>회원가입 하기</h3>
						<p><input type="text" placeholder="아이디" name="userID" maxlength="20">
						<p><input type="password" placeholder="비밀번호" name="userPassword" maxlength="20" onchange = "check_pw()" ><span id = "check"></span>
						<p><input type="text" placeholder="이름" name="userName" maxlength="20">
						<p><input type="email"placeholder="이메일" name="userEmail" maxlength="20">
						<p><input type="text" placeholder="전화번호" name="userPhone" maxlength="12">
						<p><input type="text" placeholder="주소" name="userAddress" maxlength="100">
					<p><input type="submit" class="btn btn-primary pull-right" value="회원가입">
					<input type = "reset" class="btn btn-primary pull-right" value = "다시쓰기">
					
				</form>
		</div>				
	</div>
				
</body>
</html>