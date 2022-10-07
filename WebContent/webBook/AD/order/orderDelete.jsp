<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>

<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>주문 삭제</title>

<script type="text/javascript">
	function deleteConfirm(id) {
		if (confirm("해당 주문을 삭제합니다!!") == true)
			location.href = "../sql/order/processDelete.jsp?id=" + id;
		else
			location.href = "orderSelect.jsp";
	}
</script>

</head>
<body>
	<%@ include file="./orderMenu.jsp"%>
	<%!String greeting = "OrderDelete";%>
	<div class="jumbotron" style="background-color:#7fffd4;">
		<div class="container">
			<h1 class="display-3">
				<%=greeting%>
			</h1>
		</div>
	</div>	



	<%@ include file="../sql/dbconn.jsp" %>
	<%
		String memberID = request.getParameter("check");

		PreparedStatement pstmt = null;
		ResultSet rs = null;
	
		String sql = "select * from orderInform where o_orderNum = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, memberID);
		rs = pstmt.executeQuery();
		if (rs.next()) {
	%>
	<div class="container">

		<form name="newProduct" class="form-horizontal" method="post">
			<div class="form-group row">
				<label class="col-sm-2">주문번호</label>
				<div class="col-sm-3">
					<input type="text" name="orderNum"  class="form-control" value='<%=rs.getString("o_orderNum")%>'>
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">주문날짜</label>
				<div class="col-sm-3">
					<input type="text" name="orderDate" class="form-control" value='<%=rs.getString("o_orderDate")%>'>
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">수량</label>
				<div class="col-sm-3">
					<input type="text" name="orderCount" class="form-control" value='<%=rs.getString("o_count")%>'>
				</div>
			</div>
						
			<div class="form-group row">
				<label class="col-sm-2">총 가격</label>
				<div class="col-sm-3">
					<input type="text" name="orderTotal" class="form-control" value='<%=rs.getString("o_total")%>'>
				</div>
			</div>
			
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10 ">
					<a href="#" onclick="deleteConfirm('<%=rs.getString("o_orderNum")%>')" class="btn btn-danger" role="button">삭제 &raquo;></a>
					<a href="#" onclick="location.href='./orderSelect.jsp';" class="btn btn-primary" role="button">취소 &raquo;></a>
				</div>
			</div>
		</form>
	</div>
	<%
		}
		if (rs != null)
			rs.close();
		if (pstmt != null)
			pstmt.close();
		if (conn != null)
			conn.close();
	%>

</body>
</html>