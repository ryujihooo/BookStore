<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>상품 목록</title>
</head>
<body>
	<%@ include file="productMenu.jsp"%>
	<%!String greeting = "ProductList";%>
	<div class="jumbotron" style="background-color:#7fffd4;">
		<div class="container">
			<h1 class="display-3">
				<%=greeting%>
			</h1>
		</div>
	</div>
	
	<form name="productList" method="post">
		<div align="right">
			<input type="submit" class="btn btn-primary"  value="등록" onclick="javascript: form.action='productInsert.jsp';">
			<input type="submit" class="btn btn-primary"  value="변경" onclick="javascript: form.action='productUpdate.jsp';">
			<input type="submit" class="btn btn-primary"  value="삭제" onclick="javascript: form.action='productDelete.jsp';">
			<input type="submit" class="btn btn-primary" value="취소" onclick="javascript: form.action='productManagement.jsp';">
		</div>
		
		<table class="table">
 			<thead>
   				<tr>
   					<th></th>
      				<th>도서 코드</th>
      				<th>도서명</th>
      				<th>저자명</th>
      				<th>가격</th>
      				<th>출판사</th>
      				<th>발행일</th>
      				<th>도서 분류</th>
      				<th>재고 수</th>
      				<th>도서 상태</th>
      				<th>이미지</th>
   				</tr>
 			</thead>
			<%@ include file="../sql/dbconn.jsp" %>
			<%
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				
				String sql = "select * from bookinformation";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while (rs.next()) {
			%>
			
 			<tbody>
   				<tr>
   					<td><input type="radio" name="check" value="<%=rs.getString("b_id")%>"></td>
      				<td><%=rs.getString("b_id")%></td>
      				<td><%=rs.getString("b_name")%></td>
      				<td><%=rs.getString("b_author")%></td>
      				<td><%=rs.getString("b_price")%></td>
      				<td><%=rs.getString("b_publisher")%></td>
      				<td><%=rs.getString("b_date")%></td>
      				<td><%=rs.getString("b_category")%></td>
      				<td><%=rs.getString("b_stock")%></td>
      				<td><%=rs.getString("b_condition")%></td>
      				<td><%=rs.getString("b_fileName")%></td>
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