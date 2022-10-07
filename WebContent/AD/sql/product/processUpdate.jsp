<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ include file="../dbconn.jsp" %>

<%
	String filename = "";
	String realFolder = "C:\\upload"; //웹 어플리케이션상의 절대 경로
	String encType = "utf-8"; //인코딩 타입
	int maxSize = 5 * 1024 * 1024; //최대 업로드될 파일의 크기5Mb

	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
	String bookId = multi.getParameter("bookId");
	String bookName = multi.getParameter("bookName");
	String author = multi.getParameter("author");
	String bookPrice = multi.getParameter("bookPrice");
	String bookInform = multi.getParameter("bookInform");
	String publisher = multi.getParameter("publisher");
	String bookDate = multi.getParameter("bookDate");
	String bookCategory = multi.getParameter("bookCategory");
	String bookStock = multi.getParameter("bookStock");
	String bookCondition = multi.getParameter("bookCondition");

	Integer price;
	Integer stock;
	
	if (bookPrice.isEmpty() && bookStock.isEmpty())
	{
		price = 0;
		stock = 0;
	}
	else
	{
		price = Integer.valueOf(bookPrice);
		stock = Integer.valueOf(bookStock);
	}

	Enumeration files = multi.getFileNames();
	String fname = (String) files.nextElement();
	String fileName = multi.getFilesystemName(fname);	

	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "select * from bookinformation where b_id = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, bookId);
	rs = pstmt.executeQuery();	
	
	if (rs.next()) {		
		if (fileName != null && bookCondition != null) {
			sql = "UPDATE bookinformation SET b_name=?, b_author=?, b_price=?, b_inform=?, b_publisher=?, b_date=?, b_category=?, b_stock=?, b_condition=?, b_fileName=? WHERE b_id=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bookName);
			pstmt.setString(2, author);
			pstmt.setInt(3, price);
			pstmt.setString(4, bookInform);
			pstmt.setString(5, publisher);
			pstmt.setString(6, bookDate);
			pstmt.setString(7, bookCategory);
			pstmt.setInt(8, stock);
			pstmt.setString(9, bookCondition);
			pstmt.setString(10, fileName);
			pstmt.setString(11, bookId);
			pstmt.executeUpdate();
		}
		else if(fileName != null && bookCondition == null)
		{
			sql = "UPDATE bookinformation SET b_name=?, b_author=?, b_price=?, b_inform=?, b_publisher=?, b_date=?, b_category=?, b_stock=?, b_fileName=? WHERE b_id=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bookName);
			pstmt.setString(2, author);
			pstmt.setInt(3, price);
			pstmt.setString(4, bookInform);
			pstmt.setString(5, publisher);
			pstmt.setString(6, bookDate);
			pstmt.setString(7, bookCategory);
			pstmt.setInt(8, stock);
			pstmt.setString(9, fileName);
			pstmt.setString(10, bookId);
			pstmt.executeUpdate();	
		}
		else if (fileName == null && bookCondition != null) 
		{
			sql = "UPDATE bookinformation SET b_name=?, b_author=?, b_price=?, b_inform=?, b_publisher=?, b_date=?, b_category=?, b_stock=?, b_condition=? WHERE b_id=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bookName);
			pstmt.setString(2, author);
			pstmt.setInt(3, price);
			pstmt.setString(4, bookInform);
			pstmt.setString(5, publisher);
			pstmt.setString(6, bookDate);
			pstmt.setString(7, bookCategory);
			pstmt.setInt(8, stock);
			pstmt.setString(9, bookCondition);
			pstmt.setString(10, bookId);
			pstmt.executeUpdate();
		}
		else {
			sql = "UPDATE bookinformation SET b_name=?, b_author=?, b_price=?, b_inform=?, b_publisher=?, b_date=?, b_category=?, b_stock=? WHERE b_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bookName);
			pstmt.setString(2, author);
			pstmt.setInt(3, price);
			pstmt.setString(4, bookInform);
			pstmt.setString(5, publisher);
			pstmt.setString(6, bookDate);
			pstmt.setString(7, bookCategory);
			pstmt.setInt(8, stock);
			pstmt.setString(9, bookId);
			pstmt.executeUpdate();			
		}		
	}
	if (rs != null)
		rs.close();
	if (pstmt != null)
		pstmt.close();
	if (conn != null)
		conn.close();
	
	response.sendRedirect("../../product/productSelect.jsp");
%>