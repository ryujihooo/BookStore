<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>CS 목록</title>
</head>
<body>
	<%@ include file="csMenu.jsp"%>
	<%!String greeting = "CustomerCenterList";%>
	<div class="jumbotron" style="background-color:#7fffd4;">
		<div class="container">
			<h1 class="display-3">
				<%=greeting%>
			</h1>
		</div>
	</div>
	
	<form name="orderList" method="post">
		<div align="right">
			<input type="submit" class="btn btn-primary"  value="등록" onclick="javascript: form.action='csInsert.jsp';">
			<input type="submit" class="btn btn-primary"  value="변경" onclick="javascript: form.action='csUpdate.jsp';">
			<input type="submit" class="btn btn-primary"  value="삭제" onclick="javascript: form.action='csDelete.jsp';">
			<input type="submit" class="btn btn-primary" value="취소" onclick="javascript: form.action='customerCenterManagement.jsp';">
		</div>
		
		<table class="table">
 			<thead>
   				<tr>
   					<th></th>
      				<th>csID</th>
      				<th>csTitle</th>
      				<th>userID</th>	
      				<th>csDate</th>
      				<th>csContent</th>
   				</tr>
 			</thead>
			<%@ include file="../sql/dbconn.jsp" %>
			<%
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				
				String sql = "select * from csInform";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while (rs.next()) {
			%>
			
 			<tbody>
   				<tr>
   					<td><input type="radio" name="check" value="<%=rs.getString("cs_id")%>"></td>
   					<td><%=rs.getString("cs_id")%></td>
   					<td><%=rs.getString("cs_title")%></td>
      				<td><%=rs.getString("cs_userid")%></td>
      				<td><%=rs.getString("cs_date")%></td>
      				<td><%=rs.getString("cs_content")%></td>
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