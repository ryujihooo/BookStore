<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="../dbconn.jsp" %>

<%
		request.setCharacterEncoding("UTF-8");
		
		String memberName = request.getParameter("membershipName");
		String memberID = request.getParameter("membershipID");
		String memberPW = request.getParameter("membershipPW");
		String memberEmail = request.getParameter("membershipEmail");
		String memberPhone = request.getParameter("membershipPhone");
		String memberAddress = request.getParameter("membershipAddress");
		
		PreparedStatement pstmt = null;
		String sql = "insert into membershipInform values(?,?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, memberName);
		pstmt.setString(2, memberID);
		pstmt.setString(3, memberPW);
		pstmt.setString(4, memberEmail);
		pstmt.setString(5, memberPhone);
		pstmt.setString(6, memberAddress);
		pstmt.executeUpdate();
		
		if (pstmt != null)
			pstmt.close();
		if (conn != null)
			conn.close();
	response.sendRedirect("../../membership/membershipInsert.jsp");
	
%>