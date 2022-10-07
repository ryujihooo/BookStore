<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="cs.CsDAO" %>
<%@ page import="cs.Cs" %>
<%@ page import="java.util.ArrayList" %>
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
		int pageNumber = 1; // 기본 페이지
		if (request.getParameter("pageNumber") != null) {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
	%>
	<div class="jumbotron">
		<div class="container" align="center">
		<h2>고객센터</h2>
			<table class="table" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr class="table-active">
						<th style="width: 10%; background-color: #eeeeee; text-align: center;">번호</th>
						<th style="width: 55%; background-color: #eeeeee; text-align: center;">제목</th>
						<th style="width: 15%; background-color: #eeeeee; text-align: center;">작성자</th>
						<th style="width: 20%; background-color: #eeeeee; text-align: center;">작성일</th>
					</tr>
				</thead>
				<tbody>
					<%
						CsDAO csDAO = new CsDAO();
						ArrayList<Cs> list = csDAO.getlist(pageNumber);
						for(int i = 0; i < list.size(); i++) {
					%>
					<tr>
						<td><%= list.get(i).getcsID() %></td>
						<td><a href="cs_view.jsp?csID=<%= list.get(i).getcsID() %>">
							<%= list.get(i).getcsTitle() %></a></td>
						<td><%= list.get(i).getUserID() %></td>
						<td><%= list.get(i).getcsDate().substring(0, 11) + list.get(i).getcsDate().substring(11, 13) 
							+ "시 " + list.get(i).getcsDate().substring(14, 16) + "분 " %></td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
			<%
				if (pageNumber != 1) {
			%>
				<a href="header.jsp?pageNumber=<%=pageNumber - 1%>" class="btn btn-success btn-arraw-left">이전</a>
			<%
				} if (csDAO.nextPage(pageNumber + 1)) {
			%>
				<a href="header.jsp?pageNumber=<%=pageNumber + 1%>" class="btn btn-success btn-arraw-left">다음</a>
			<%
				}
			%>	
			<a href="cs_write.jsp" class="btn btn-primary pull-right">글쓰기</a>
		</div>
	</div>
</body>
</html>