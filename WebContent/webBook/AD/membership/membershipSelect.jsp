<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>회원 목록</title>
</head>
<body>
	<%@ include file="./membershipMenu.jsp"%>
	<%!String greeting = "MembershipList";%>
	<div class="jumbotron"; style="background-color:#7fffd4;">
		<div class="container">
			<h1 class="display-3">
				<%=greeting%>
			</h1>
		</div>
	</div>
	
	<form name="productList" method="post">
		<div align="right">
			<input type="submit" class="btn btn-primary"  value="등록" onclick="javascript: form.action='./membershipInsert.jsp';">
			<input type="submit" class="btn btn-primary"  value="변경" onclick="javascript: form.action='./membershipUpdate.jsp';">
			<input type="submit" class="btn btn-primary"  value="삭제" onclick="javascript: form.action='./membershipDelete.jsp';">
			<input type="submit" class="btn btn-primary" value="취소" onclick="javascript: form.action='./membershipManagement.jsp';">
		</div>
		
		<table class="table">
 			<thead>
   				<tr>
   					<th></th>
      				<th>회원명</th>
      				<th>아이디</th>
      				<th>패스워드</th>
      				<th>이메일</th>
      				<th>휴대전화</th>
      				<th>주소</th>
   				</tr>
 			</thead>
			<%@ include file="../sql/dbconn.jsp" %>
			<%
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				
				String sql = "select * from membershipInform";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while (rs.next()) {
			%>
			
 			<tbody>
   				<tr>
   					<td><input type="radio" name="check" value="<%=rs.getString("m_id")%>"></td>
      				<td><%=rs.getString("m_name")%></td>
      				<td><%=rs.getString("m_id")%></td>
      				<td><%=rs.getString("m_pw")%></td>
      				<td><%=rs.getString("m_email")%></td>
      				<td><%=rs.getString("m_phone")%></td>
      				<td><%=rs.getString("m_address")%></td>
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