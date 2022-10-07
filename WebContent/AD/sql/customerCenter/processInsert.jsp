<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="../dbconn.jsp" %>

<%
		request.setCharacterEncoding("UTF-8");
		String csID = request.getParameter("csID");
		String csTitle = request.getParameter("csTitle");
		String csUserID = request.getParameter("csUserID");
		String csDate = request.getParameter("csDate");
		String csContent = request.getParameter("csContent");
		
		PreparedStatement pstmt = null;
		String sql = "insert into csInform values(?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, csID);
		pstmt.setString(2, csTitle);
		pstmt.setString(3, csUserID);
		pstmt.setString(4, csDate);
		pstmt.setString(5, csContent);
		pstmt.executeUpdate();
		
		if (pstmt != null)
			pstmt.close();
		if (conn != null)
			conn.close();
	response.sendRedirect("../../customerCenter/csInsert.jsp");
	
%>