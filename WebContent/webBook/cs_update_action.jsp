<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="cs.Cs" %>
<%@ page import="cs.CsDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		if(userID == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		} 
		int csID = 0;
		if (request.getParameter("csID") != null) {
			csID = Integer.parseInt(request.getParameter("csID"));
		}
		if (csID == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글 입니다.')");
			script.println("location.href = 'cs.jsp'");
			script.println("</script>");
		}
		Cs cs = new CsDAO().getcs(csID);
		if (!userID.equals(cs.getUserID())) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href = 'cs.jsp'");
			script.println("</script>");
		} else {
			if (request.getParameter("csTitle") == null 
					|| request.getParameter("csContent") == null
					|| request.getParameter("csTitle").equals("") 
					|| request.getParameter("csContent").equals("")) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('입력하지 않은 사항이 있습니다.')");
					script.println("history.back()");
					script.println("</script");
				} else {
					CsDAO csDAO = new CsDAO();
					int result = csDAO.update(csID, 
							request.getParameter("csTitle"), 
							request.getParameter("csContent"));
					if (result == -1) {
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("alert('글 수정에 실패했습니다.')");
						script.println("history.back()");
						script.println("</script>");
					}
					else {
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("location.href = 'cs.jsp'");
						script.println("</script>");
					}
				}
		}
	%>
</body>
</html>