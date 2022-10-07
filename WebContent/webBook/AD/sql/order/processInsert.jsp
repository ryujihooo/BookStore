<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="../dbconn.jsp" %>

<%
		request.setCharacterEncoding("UTF-8");
		
		String orderNum = request.getParameter("orderNum");
		String orderDate = request.getParameter("orderDate");
		String orderCount = request.getParameter("orderCount");
		String orderTotal = request.getParameter("orderTotal");
		
		PreparedStatement pstmt = null;
		String sql = "insert into orderInform values(?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, orderNum);
		pstmt.setString(2, orderDate);
		pstmt.setString(3, orderCount);
		pstmt.setString(4, orderTotal);
		pstmt.executeUpdate();
		
		if (pstmt != null)
			pstmt.close();
		if (conn != null)
			conn.close();
	response.sendRedirect("../../order/orderInsert.jsp");
	
%>