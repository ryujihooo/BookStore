<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>상품 변경</title>
</head>
<body>
	<%@ include file="productMenu.jsp"%>
	<%!String greeting = "ProductUpdate";%>
	<div class="jumbotron" style="background-color:#7fffd4;">
		<div class="container">
			<h1 class="display-3">
				<%=greeting%>
			</h1>
		</div>
	</div>	
	
	<%@ include file="../sql/dbconn.jsp"%>
	<%
		String bookId = request.getParameter("check");

		PreparedStatement pstmt = null;
		ResultSet rs = null;
	
		String sql = "select * from bookinformation where b_id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, bookId);
		rs = pstmt.executeQuery();
		if (rs.next()) {
	%>
	<div class="container">
		<div class="row">
			<div class="col-md-5">
				<img src="../image/<%=rs.getString("b_filename")%>" alt="image" style="width: 100%" />
			</div>
			<div class="col-md-7">
			
		<form name="newProduct" action="../sql/processUpdate.jsp" class="form-horizontal" method="post" enctype="multipart/form-data">
			<div class="form-group row">
				<label class="col-sm-2">도서 코드</label>
				<div class="col-sm-3">
					<input type="text" id="bookId"  name="bookId"  class="form-control" value='<%=rs.getString("b_id")%>'>
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">도서명</label>
				<div class="col-sm-3">
					<input type="text" id="bookName"  name="bookName" class="form-control" value='<%=rs.getString("b_name")%>'>
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">저자명</label>
				<div class="col-sm-3">
					<input type="text" id="author"  name="author" class="form-control" value='<%=rs.getString("b_author")%>'>
				</div>
			</div>
						
			<div class="form-group row">
				<label class="col-sm-2">가격</label>
				<div class="col-sm-3">
					<input type="text" id="bookPrice"  name="bookPrice" class="form-control" value='<%=rs.getInt("b_price")%>'>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">도서 정보</label>
				<div class="col-sm-5">
					<textarea name="bookInform" cols="50" rows="2" class="form-control"><%=rs.getString("b_inform")%></textarea>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">출판사</label>
				<div class="col-sm-3">
					<input type="text" name="publisher" class="form-control" value='<%=rs.getString("b_publisher")%>'>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">발행일</label>
				<div class="col-sm-3">
					<input type="text" name="bookDate" class="form-control" value='<%=rs.getString("b_date")%>'>
				</div>
			</div>			
			<div class="form-group row">
				<label class="col-sm-2">도서 분류</label>
				<div class="col-sm-3">
					<input type="text" name="bookCategory" class="form-control" value='<%=rs.getString("b_category")%>'>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">재고 수</label>
				<div class="col-sm-3">
					<input type="text" id="bookStock" name="bookStock" class="form-control" value='<%=rs.getInt("b_stock")%>'>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">도서 상태</label>
				<div class="col-sm-5">
					<input type="radio" name="bookCondition" value="New" /> 신규 도서
					<input type="radio" name="bookCondition" value="Old" /> 중고 도서
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">이미지</label>
				<div class="col-sm-5">
					<input type="file" name="bookImage" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10 ">
					<input type="submit" class="btn btn-primary" value="변경">
					<input type="submit" class="btn btn-primary" value="취소" onclick="javascript: form.action='productSelect.jsp';">
				</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<%
		}
		if (rs != null)
			rs.close();
		if (pstmt != null)
			pstmt.close();
		if (conn != null)
			conn.close();
	%>
</body>
</html>