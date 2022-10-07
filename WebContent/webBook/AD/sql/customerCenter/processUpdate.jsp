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
	ResultSet rs = null;
	
	String sql = "select * from csInform where cs_id = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, csID);
	rs = pstmt.executeQuery();	
	
	if (rs.next()) {		
			sql = "UPDATE csInform SET cs_title=?, cs_userid=?, cs_date=?, cs_content=? WHERE cs_id=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, csTitle);
			pstmt.setString(2, csUserID);
			pstmt.setString(3, csDate);
			pstmt.setString(4, csContent);
			pstmt.setString(5, csID);
			pstmt.executeUpdate();
		}
	if (rs != null)
		rs.close();
	if (pstmt != null)
		pstmt.close();
	if (conn != null)
		conn.close();
	
	response.sendRedirect("../../customerCenter/csSelect.jsp");
%>