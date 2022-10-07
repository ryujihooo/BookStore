<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>회원 목록</title>
</head>
<body>
	<%@ include file="./orderMenu.jsp"%>
	<%!String greeting = "OrderList";%>
	<div class="jumbotron"; style="background-color:#7fffd4;">
		<div class="container">
			<h1 class="display-3">
				<%=greeting%>
			</h1>
		</div>
	</div>
	
	<form name="orderList" method="post">
		<div align="right">
			<input type="submit" class="btn btn-primary"  value="등록" onclick="javascript: form.action='./orderInsert.jsp';">
			<input type="submit" class="btn btn-primary"  value="변경" onclick="javascript: form.action='./orderUpdate.jsp';">
			<input type="submit" class="btn btn-primary"  value="삭제" onclick="javascript: form.action='./orderDelete.jsp';">
			<input type="submit" class="btn btn-primary" value="취소" onclick="javascript: form.action='./orderManagement.jsp';">
		</div>
		
		<table class="table">
 			<thead>
   				<tr>
   					<th></th>
      				<th>주문번호</th>
      				<th>주문날짜</th>
      				<th>수량</th>
      				<th>총 가격</th>
   				</tr>
 			</thead>
			<%@ include file="../sql/dbconn.jsp" %>
			<%
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				
				String sql = "select * from orderInform";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while (rs.next()) {
			%>
			
 			<tbody>
   				<tr>
   					<td><input type="radio" name="check" value="<%=rs.getString("o_orderNum")%>"></td>
   					<td><%=rs.getString("o_orderNum")%></td>
      				<td><%=rs.getString("o_orderDate")%></td>
      				<td><%=rs.getString("o_count")%></td>
      				<td><%=rs.getString("o_total")%></td>
   				</tr>
   			</tbody> 
			<%
				}
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			%>
		</table>
		</form>
</body>
</html>