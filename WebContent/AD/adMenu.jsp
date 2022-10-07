<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 
<nav class="navbar navbar-expand  navbar-dark bg-dark">
	<div class="container">
		<div class="navbar-header">
			<a class="navbar-brand" href="./loginAD.jsp">KPUBookStore_Administrator</a>
		</div>
		<div>
			<ul class="navbar-nav mr-auto">
				<li class="nav-item"><a class="nav-link" href="<c:url value="./product/productManagement.jsp"/>">상품 관리</a></li>
				<li class="nav-item"><a class="nav-link" href="<c:url value="./order/orderManagement.jsp"/>">주문 관리</a></li>
				<li class="nav-item"><a class="nav-link" href="<c:url value="./membership/membershipManagement.jsp"/>">회원 관리</a></li>
				<li class="nav-item"><a class="nav-link" href="<c:url value="./customerCenter/customerCenterManagement.jsp"/>">고객센터 관리</a></li>
			</ul>
		</div>
	</div>
</nav>