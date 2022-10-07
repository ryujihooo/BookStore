<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>CS 변경</title>
</head>
<body>
	<%@ include file="csMenu.jsp"%>
	<%!String greeting = "CSUpdate";%>
	<div class="jumbotron" style="background-color:#7fffd4;">
		<div class="container">
			<h1 class="display-3">
				<%=greeting%>
			</h1>
		</div>
	</div>	
	
	
	
	
	
	<%@ include file="../sql/dbconn.jsp"%>
	<%
		String memberID = request.getParameter("check");

		PreparedStatement pstmt = null;
		ResultSet rs = null;
	
		String sql = "select * from csInform where cs_id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, memberID);
		rs = pstmt.executeQuery();
		if (rs.next()) {
	%>
	<div class="container">
		<form name="newProduct" action="../sql/customerCenter/processUpdate.jsp" class="form-horizontal" method="post">
			<div class="form-group row">
				<label class="col-sm-2">csID</label>
				<div class="col-sm-3">
					<input type="text" name="csID"  class="form-control" value='<%=rs.getString("cs_id")%>'>
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">csTitle</label>
				<div class="col-sm-3">
					<input type="text" name="csTitle" class="form-control" value='<%=rs.getString("cs_title")%>'>
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">csUserID</label>
				<div class="col-sm-3">
					<input type="text" name="csUserID" class="form-control" value='<%=rs.getString("cs_userid")%>'>
				</div>
			</div>
						
			<div class="form-group row">
				<label class="col-sm-2">csDate</label>
				<div class="col-sm-3">
					<input type="text" name="csDate" class="form-control" value='<%=rs.getString("cs_date")%>'>
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">csContent</label>
					<div class="col-sm-5">
						<textarea name="csContent" cols="50" rows="2" class="form-control"><%=rs.getString("cs_content")%></textarea>
					</div>
			</div>

			
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10 ">
					<input type="submit" class="btn btn-primary" value="변경">
					<input type="submit" class="btn btn-primary" value="취소" onclick="javascript: form.action='csSelect.jsp';">
				</div>
					</div>
				</form>
			</div>
		</div>
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