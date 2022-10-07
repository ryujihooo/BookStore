<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title>KPU BookStore</title> 
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
</head> 
<body> 

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
         
	<nav class="navbar navbar-expending-lg navbar-dark bg-dark">
		<li>
		<a class="navbar-brand" href="header.jsp"><img src = "C:\Users\dusdn\eclipse-workspace\team_project1\WebContent\image\logo.png" width = "60" "height="60">home</a>
		<a href="secondhandshop.jsp"/>중고샵</a>&emsp;
		<a href="cs.jsp"/>고객센터</a>&emsp;
		<a href="./cart2.jsp">장바구니</a>&emsp;
		</li>
			<%
           		if(userID == null) {
         	%>
         		<li>
         		<a href="login.jsp"/>로그인</a> &emsp;
				<a href="membership.jsp"/>회원 가입</a>
				</li>
         	<%
           	 	} else {
         	%>
            	<a href="logout.jsp">로그아웃</a>	&emsp;
         	<%
            	}
         	%>
		<a class="nav-link">
		<%@ include file = "search.jsp" %>
		</a>
	</nav>
</body> 
</html> 