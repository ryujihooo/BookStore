<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>회원 등록</title>


</head>
<body>
	<%@ include file="./nonMembershipMenu.jsp"%>
	<%!String greeting = "NonMembershipRegistration";%>
	<div class="jumbotron" style="background-color:#7fffd4;">
		<div class="container">
			<h1 class="display-3">
				<%=greeting%>
			</h1>
		</div>
	</div>
	
	<div class="container">
		<form name="newProduct" action="../sql/nonMembership/processInsert.jsp" class="form-horizontal" method="post">
			<div class="form-group row">
				<label class="col-sm-2">주문번호</label>
				<div class="col-sm-3">
					<input type="text" name="nonMembershipOrderNum" class="form-control" >
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">주문날짜</label>
				<div class="col-sm-3">
					<input type="text" name="nonMembershipOrderDate" class="form-control" >
				</div>
			</div>
						
			<div class="form-group row">
				<label class="col-sm-2">비회원명</label>
				<div class="col-sm-3">
					<input type="text" name="nonMembershipName" class="form-control" >
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">휴대전화</label>
				<div class="col-sm-3">
					<input type="text" name="nonMembershipPhone" class="form-control" >
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">주소</label>
				<div class="col-sm-3">
					<input type="text" name="nonMembershipAddress" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">이메일</label>
				<div class="col-sm-3">
					<input type="text" name="nonMembershipEmail" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">패스워드</label>
				<div class="col-sm-3">
					<input type="text" name="nonMembershipPW" class="form-control">
				</div>
			</div>			

			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10 ">
					<input type="submit" class="btn btn-primary" value="등록">
					<input type="submit" class="btn btn-primary" value="취소" onclick="javascript: form.action='./nonMembershipSelect.jsp';">
				</div>
			</div>
		</form>
	</div>
</body>
</html>