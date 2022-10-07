<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>회원 변경</title>
</head>
<body>
	<%@ include file="./membershipMenu.jsp"%>
	<%!String greeting = "MembershipUpdate";%>
	<div class="jumbotron"; style="background-color:#7fffd4;">
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
	
		String sql = "select * from membershipInform where m_id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, memberID);
		rs = pstmt.executeQuery();
		if (rs.next()) {
	%>
	<div class="container">
		<form name="newProduct" action="../sql/membership/processUpdate.jsp" class="form-horizontal" method="post">
			<div class="form-group row">
				<label class="col-sm-2">회원명</label>
				<div class="col-sm-3">
					<input type="text" name="membershipName"  class="form-control" value='<%=rs.getString("m_name")%>'>
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">아이디</label>
				<div class="col-sm-3">
					<input type="text" name="membershipID" class="form-control" value='<%=rs.getString("m_id")%>'>
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">패스워드</label>
				<div class="col-sm-3">
					<input type="text" name="membershipPW" class="form-control" value='<%=rs.getString("m_pw")%>'>
				</div>
			</div>
						
			<div class="form-group row">
				<label class="col-sm-2">이메일</label>
				<div class="col-sm-3">
					<input type="text" name="membershipEmail" class="form-control" value='<%=rs.getString("m_email")%>'>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">전화번호</label>
				<div class="col-sm-3">
					<input type="text" name="membershipPhone" class="form-control" value='<%=rs.getString("m_phone")%>'>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">주소</label>
				<div class="col-sm-3">
					<input type="text" name="membershipAddress" class="form-control" value='<%=rs.getString("m_address")%>'>
				</div>
			</div>
			
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10 ">
					<input type="submit" class="btn btn-primary" value="변경">
					<input type="submit" class="btn btn-primary" value="취소" onclick="javascript: form.action='./membershipSelect.jsp';">
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