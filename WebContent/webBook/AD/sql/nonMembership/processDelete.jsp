<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="../dbconn.jsp" %>

<%
	String memberID = request.getParameter("id");

	PreparedStatement pstmt = null;	
	ResultSet rs = null;

	String sql = "select * from nonMembershipInform";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();

	if (rs.next()) {
		sql = "delete from nonMembershipInform where nm_orderNum = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, memberID);
		pstmt.executeUpdate();
	} else
		out.println("일치하는 비회원이 없습니다");
	
	if (rs != null)
		rs.close();
	if (pstmt != null)
		pstmt.close();
	if (conn != null)
		conn.close();
	
	response.sendRedirect("../../nonMembership/nonMembershipSelect.jsp");
%>