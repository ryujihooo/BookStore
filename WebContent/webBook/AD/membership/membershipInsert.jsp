<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>회원 등록</title>


</head>
<body>
	<%@ include file="./membershipMenu.jsp"%>
	<%!String greeting = "MembershipRegistration";%>
	<div class="jumbotron"; style="background-color:#7fffd4;">
		<div class="container">
			<h1 class="display-3">
				<%=greeting%>
			</h1>
		</div>
	</div>
	
	<div class="container">
		<form name="newProduct" action="../sql/membership/processInsert.jsp" class="form-horizontal" method="post">
			<div class="form-group row">
				<label class="col-sm-2">회원명</label>
				<div class="col-sm-3">
					<input type="text" name="membershipName" class="form-control" >
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">아이디</label>
				<div class="col-sm-3">
					<input type="text" name="membershipID" class="form-control" >
				</div>
			</div>
						
			<div class="form-group row">
				<label class="col-sm-2">패스워드</label>
				<div class="col-sm-3">
					<input type="text" name="membershipPW" class="form-control" >
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">이메일</label>
				<div class="col-sm-3">
					<input type="text" name="membershipEmail" class="form-control" >
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">휴대전화</label>
				<div class="col-sm-3">
					<input type="text" name="membershipPhone" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">주소</label>
				<div class="col-sm-3">
					<input type="text" name="membershipAddress" class="form-control">
				</div>
			</div>			

			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10 ">
					<input type="submit" class="btn btn-primary" value="등록">
					<input type="submit" class="btn btn-primary" value="취소" onclick="javascript: form.action='./membershipSelect.jsp';">
				</div>
			</div>
		</form>
	</div>
</body>
</html>