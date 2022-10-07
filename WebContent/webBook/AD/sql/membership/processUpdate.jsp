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
	ResultSet rs = null;
	
	String sql = "select * from membershipInform where m_id = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, memberID);
	rs = pstmt.executeQuery();	
	
	if (rs.next()) {		
			sql = "UPDATE membershipInform SET m_name=?, m_pw=?, m_email=?, m_phone=?, m_address=? WHERE m_id=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberName);
			pstmt.setString(2, memberPW);
			pstmt.setString(3, memberEmail);
			pstmt.setString(4, memberPhone);
			pstmt.setString(5, memberAddress);
			pstmt.setString(6, memberID);
			pstmt.executeUpdate();
		}
	if (rs != null)
		rs.close();
	if (pstmt != null)
		pstmt.close();
	if (conn != null)
		conn.close();
	
	response.sendRedirect("../../membership/membershipSelect.jsp");
%>