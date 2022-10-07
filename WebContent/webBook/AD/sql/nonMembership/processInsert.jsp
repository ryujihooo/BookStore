<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="../dbconn.jsp" %>

<%
		request.setCharacterEncoding("UTF-8");
		
		String nonMemberOrderNum = request.getParameter("nonMembershipOrderNum");
		String nonMemberOrderDate = request.getParameter("nonMembershipOrderDate");
		String nonMemberName = request.getParameter("nonMembershipName");
		String nonMemberPhone = request.getParameter("nonMembershipPhone");
		String nonMemberAddress = request.getParameter("nonMembershipAddress");
		String nonMemberEmail = request.getParameter("nonMembershipEmail");
		String nonMemberPW = request.getParameter("nonMembershipPW");
		
		
		PreparedStatement pstmt = null;
		String sql = "insert into nonMembershipInform values(?,?,?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, nonMemberOrderNum);
		pstmt.setString(2, nonMemberOrderDate);
		pstmt.setString(3, nonMemberName);
		pstmt.setString(4, nonMemberPhone);
		pstmt.setString(5, nonMemberAddress);
		pstmt.setString(6, nonMemberEmail);
		pstmt.setString(7, nonMemberPW);
		pstmt.executeUpdate();
		
		if (pstmt != null)
			pstmt.close();
		if (conn != null)
			conn.close();
	response.sendRedirect("../../nonMembership/nonMembershipInsert.jsp");
	
%>