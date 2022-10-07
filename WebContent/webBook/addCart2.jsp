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

	ArrayList<Product2> goodsList = dao.getAllProducts();
	Product2 goods = new Product2();
	for (int i = 0; i < goodsList.size(); i++) {
		goods = goodsList.get(i);
		if (goods.getProductId().equals(id)) { 			
			break;
		}
	}
	
	ArrayList<Product2> list = (ArrayList<Product2>) session.getAttribute("cartlist");
	
	if (list == null) { 
		list = new ArrayList<Product2>();
		session.setAttribute("cartlist", list);
	}

	int cnt = 0;
	Product2 goodsQnt = new Product2();
	for (int i = 0; i < list.size(); i++) {
		goodsQnt = list.get(i);
		if (goodsQnt.getProductId().equals(id)) {
			cnt++;
			int orderQuantity = goodsQnt.getQuantity() + 1;
			goodsQnt.setQuantity(orderQuantity);
		}
	}

	if (cnt == 0) { 
		goods.setQuantity(1);
		list.add(goods);
	}

	response.sendRedirect("middle.jsp?id=" + id);
%>