<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>CS</title>


</head>
<body>
	<%@ include file="./csMenu.jsp"%>
	<%!String greeting = "CSRegistration";%>
	<div class="jumbotron" style="background-color:#7fffd4;">
		<div class="container">
			<h1 class="display-3">
				<%=greeting%>
			</h1>
		</div>
	</div>
	
	<div class="container">
		<form name="newProduct" action="../sql/customerCenter/processInsert.jsp" class="form-horizontal" method="post">
			<div class="form-group row">
				<label class="col-sm-2">csID</label>
				<div class="col-sm-3">
					<input type="text" name="csID" class="form-control" >
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">csTitle</label>
				<div class="col-sm-3">
					<input type="text" name="csTitle" class="form-control" >
				</div>
			</div>
						
			<div class="form-group row">
				<label class="col-sm-2">csUserID</label>
				<div class="col-sm-3">
					<input type="text" name="csUserID" class="form-control" >
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">csDate</label>
				<div class="col-sm-5">
					<input type="text" name="csDate" class="form-control" >
				</div>
			</div>
		
			<div class="form-group row">
				<label class="col-sm-2">csContent</label>
					<div class="col-sm-5">
						<textarea name="csContent" cols="50" rows="2" class="form-control"></textarea>
					</div>
			</div>
			
			
			
		
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10 ">
					<input type="submit" class="btn btn-primary" value="등록">
					<input type="submit" class="btn btn-primary" value="취소" onclick="javascript: form.action='csSelect.jsp';">
				</div>
			</div>
		</form>
	</div>
</body>
</html>