<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>비회원 목록</title>
</head>
<body>
	<%@ include file="./nonMembershipMenu.jsp"%>
	<%!String greeting = "NonMembershipList";%>
	<div class="jumbotron" style="background-color:#7fffd4;">
		<div class="container">
			<h1 class="display-3">
				<%=greeting%>
			</h1>
		</div>
	</div>
	
	<form name="NonMembershipList" method="post">
		<div align="right">
			<input type="submit" class="btn btn-primary"  value="등록" onclick="javascript: form.action='./nonMembershipInsert.jsp';">
			<input type="submit" class="btn btn-primary"  value="변경" onclick="javascript: form.action='./nonMembershipUpdate.jsp';">
			<input type="submit" class="btn btn-primary"  value="삭제" onclick="javascript: form.action='./nonMembershipDelete.jsp';">
			<input type="submit" class="btn btn-primary" value="취소" onclick="javascript: form.action='./nonMembershipManagement.jsp';">
		</div>
		
		<table class="table">
 			<thead>
   				<tr>
   					<th></th>
      				<th>주문번호</th>
      				<th>주문날짜</th>
      				<th>비회원명</th>
      				<th>휴대전화</th>
      				<th>주소</th>
      				<th>이메일</th>
      				<th>패스워드</th>
   				</tr>
 			</thead>
			<%@ include file="../sql/dbconn.jsp" %>
			<%
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				
				String sql = "select * from nonMembershipInform";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while (rs.next()) {
			%>
			
 			<tbody>
   				<tr>
   					<td><input type="radio" name="check" value="<%=rs.getString("nm_orderNum")%>"></td>
      				<td><%=rs.getString("nm_orderNum")%></td>
      				<td><%=rs.getString("nm_orderDate")%></td>
      				<td><%=rs.getString("nm_name")%></td>
      				<td><%=rs.getString("nm_phone")%></td>
      				<td><%=rs.getString("nm_address")%></td>
      				<td><%=rs.getString("nm_email")%></td>
      				<td><%=rs.getString("nm_pw")%></td>
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