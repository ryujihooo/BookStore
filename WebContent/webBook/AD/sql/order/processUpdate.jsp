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
	ResultSet rs = null;
	
	String sql = "select * from orderInform where o_orderNum = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, orderNum);
	rs = pstmt.executeQuery();	
	
	if (rs.next()) {		
			sql = "UPDATE orderInform SET o_orderDate=?, o_count=?, o_total=? WHERE o_orderNum=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, orderDate);
			pstmt.setString(2, orderCount);
			pstmt.setString(3, orderTotal);
			pstmt.setString(4, orderNum);
			pstmt.executeUpdate();
		}
	if (rs != null)
		rs.close();
	if (pstmt != null)
		pstmt.close();
	if (conn != null)
		conn.close();
	
	response.sendRedirect("../../order/orderSelect.jsp");
%>