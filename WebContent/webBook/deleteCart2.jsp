<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dto.Product2"%>
<%@ page import="dao.ProductRepository2"%>
<%
	String id = request.getParameter("cartId");
	if (id == null || id.trim().equals("")) {
		response.sendRedirect("cart2.jsp");
		return;
	}

	session.invalidate();
	response.sendRedirect("cart2.jsp");
%>
