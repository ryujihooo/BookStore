<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="../dbconn.jsp" %>

<%
	request.setCharacterEncoding("UTF-8");
	String nonMemberNum = request.getParameter("nonMembershipNum");
	String nonMemberDate = request.getParameter("nonMembershipDate");
	String nonMemberName = request.getParameter("nonMembershipName");
	String nonMemberPhone = request.getParameter("nonMembershipPhone");
	String nonMemberAddress = request.getParameter("nonmembershipAddress");
	String nonMemberEmail = request.getParameter("nonMembershipEmail");
	String nonMemberPW = request.getParameter("nonMembershipPW");
	
	Integer num;
	
	if (nonMemberNum.isEmpty())
		num = 0;
	else
		num = Integer.valueOf(nonMemberNum);

	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "select * from nonMembershipInform where nm_orderNum = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, nonMemberNum);
	rs = pstmt.executeQuery();	
	
	if (rs.next()) {		
			sql = "UPDATE nonMembershipInform SET nm_orderDate=?, nm_name=?, nm_phone=?, nm_address=?, nm_email=?, nm_pw=? WHERE nm_orderNum=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nonMemberDate);
			pstmt.setString(2, nonMemberName);
			pstmt.setString(3, nonMemberPhone);
			pstmt.setString(4, nonMemberAddress);
			pstmt.setString(5, nonMemberEmail);
			pstmt.setString(6, nonMemberPW);
			pstmt.setInt(7, num);
			pstmt.executeUpdate();
		}
	if (rs != null)
		rs.close();
	if (pstmt != null)
		pstmt.close();
	if (conn != null)
		conn.close();
	
	response.sendRedirect("../../nonMembership/nonMembershipSelect.jsp");
%>