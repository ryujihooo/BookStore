<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>주문 등록</title>


</head>
<body>
	<%@ include file="./orderMenu.jsp"%>
	<%!String greeting = "OrderRegistration";%>
	<div class="jumbotron"; style="background-color:#7fffd4;">
		<div class="container">
			<h1 class="display-3">
				<%=greeting%>
			</h1>
		</div>
	</div>
	
	<div class="container">
		<form name="newProduct" action="../sql/order/processInsert.jsp" class="form-horizontal" method="post">
			<div class="form-group row">
				<label class="col-sm-2">주문번호</label>
				<div class="col-sm-3">
					<input type="text" name="orderNum" class="form-control" >
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">주문날짜</label>
				<div class="col-sm-3">
					<input type="text" name="orderDate" class="form-control" >
				</div>
			</div>
						
			<div class="form-group row">
				<label class="col-sm-2">수량</label>
				<div class="col-sm-3">
					<input type="text" name="orderCount" class="form-control" >
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">총 가격</label>
				<div class="col-sm-5">
					<input type="text" name="orderTotal" class="form-control" >
				</div>
			</div>
		
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10 ">
					<input type="submit" class="btn btn-primary" value="등록">
					<input type="submit" class="btn btn-primary" value="취소" onclick="javascript: form.action='./orderSelect.jsp';">
				</div>
			</div>
		</form>
	</div>
</body>
</html>