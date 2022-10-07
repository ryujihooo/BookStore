<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
</head>
<body>
<jsp:include page="header.jsp" />
	<div class="jumbotron">
		<div class="container" align="center">
			<form method="post" action="login_process.jsp">
					<h3>로그인 하기</h3>
						<p><p><input type="text" placeholder="아이디" name="userID" maxlength="20">
						<p><input type="password" placeholder="비밀번호" name="userPassword" maxlength="20">
					<P><input type="submit" class="btn btn-primary pull-right" value="로그인">
				</form>
		</div>				
	</div>
</body>
</html>