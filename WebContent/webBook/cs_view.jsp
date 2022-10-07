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
<jsp:include page="header.jsp" />
	<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
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
	%>
	<%
		if(userID == null) {
	%>
	<%
		} else {
	%>
	<%
			}
	%>
	<div class="jumbotron">
		<div class="container" align="center">
		<h2>고객센터</h2>
			<table class="table table-striped"
				style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="3" style="background-color: #eeeeee; 
							text-align: center;">게시판 글 보기</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width: 20%;">글 제목</td>
						<td colspan="2"><%= 
							cs.getcsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;")
							.replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></td>
					</tr>
					<tr>
						<td>작성자</td>
						<td colspan="2"><%= cs.getUserID() %></td>
					</tr>
					<tr>
						<td>작성일자</td>
						<td colspan="2"><%= cs.getcsDate().substring(0, 11) + cs.getcsDate().substring(11, 13) 
								+ "시 " + cs.getcsDate().substring(14, 16) + "분 " %></td>
					</tr>
					<tr>
						<td>내용</td>
						<td colspan="2" style="min-height: 200px; text-align: left;"><%= 
							cs.getcsContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;")
							.replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></td>
					</tr>
				</tbody>
			</table>
			<a href="cs.jsp" class="btn btn-primary pull-right">목록</a>
			<%
				if (userID != null && userID.equals(cs.getUserID())) {
			%>
					<a href="cs_update.jsp?csID=<%= csID %> class="btn btn-primary pull-right"">수정</a>
					<a href="cs_delete.jsp?csID=<%= csID %> class="btn btn-primary pull-right"">삭제</a>
			<%
				}
			%></a>
		</div>
	</div>
</body>
</html>