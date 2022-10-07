<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Product2"%>
<%@ page import="dao.ProductRepository2"%>
<%
	String id = request.getParameter("id");
	if (id == null || id.trim().equals("")) {
		response.sendRedirect("middle.jsp");
		return;
	}

	ProductRepository2 dao = ProductRepository2.getInstance();
	
	Product2 product = dao.getProductById(id);
	if (product == null) {
		response.sendRedirect("exceptionNoProductId2.jsp");
	}

	ArrayList<Product2> cartList = (ArrayList<Product2>) session.getAttribute("cartlist");
	Product2 goodsQnt = new Product2();
	for (int i = 0; i < cartList.size(); i++) { // 상품리스트 하나씩 출력하기
		goodsQnt = cartList.get(i);
		if (goodsQnt.getProductId().equals(id)) {
			cartList.remove(goodsQnt);
		}
	}

	response.sendRedirect("cart2.jsp");
%>
