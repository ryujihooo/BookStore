<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>회원 변경</title>
</head>
<body>
	<%@ include file="./nonMembershipMenu.jsp"%>
	<%!String greeting = "NonMembershipUpdate";%>
	<div class="jumbotron" style="background-color:#7fffd4;">
		<div class="container">
			<h1 class="display-3">
				<%=greeting%>
			</h1>
		</div>
	</div>	
	
	
	
	
	
	<%@ include file="../sql/dbconn.jsp"%>
	<%
		String nonMemberID = request.getParameter("check");

		PreparedStatement pstmt = null;
		ResultSet rs = null;
	
		String sql = "select * from nonMembershipInform where nm_orderNum = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, nonMemberID);
		rs = pstmt.executeQuery();
		if (rs.next()) {
	%>
	<div class="container">
		<form name="newProduct" action="../sql/nonMembership/processUpdate.jsp" class="form-horizontal" method="post">
			<div class="form-group row">
				<label class="col-sm-2">주문번호</label>
				<div class="col-sm-3">
					<input type="text" name="nonMembershipNum"  class="form-control" value='<%=rs.getString("nm_orderNum")%>'>
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">주문날짜</label>
				<div class="col-sm-3">
					<input type="text" name="nonMembershipDate" class="form-control" value='<%=rs.getString("nm_orderDate")%>'>
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">비회원명</label>
				<div class="col-sm-3">
					<input type="text" name="nonMembershipName" class="form-control" value='<%=rs.getString("nm_name")%>'>
				</div>
			</div>
						
			<div class="form-group row">
				<label class="col-sm-2">전화번호</label>
				<div class="col-sm-3">
					<input type="text" name="nonMembershipPhone" class="form-control" value='<%=rs.getString("nm_phone")%>'>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">주소</label>
				<div class="col-sm-5">
					<input type="text" name="nonmembershipAddress" class="form-control" value='<%=rs.getString("nm_address")%>'>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">이메일</label>
				<div class="col-sm-3">
					<input type="text" name="nonMembershipEmail" class="form-control" value='<%=rs.getString("nm_email")%>'>
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">패스워드</label>
				<div class="col-sm-3">
					<input type="text" name="nonMembershipPW" class="form-control" value='<%=rs.getString("nm_pw")%>'>
				</div>
			</div>
			
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10 ">
					<input type="submit" class="btn btn-primary" value="변경">
					<input type="submit" class="btn btn-primary" value="취소" onclick="javascript: form.action='./nonMembershipSelect.jsp';">
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