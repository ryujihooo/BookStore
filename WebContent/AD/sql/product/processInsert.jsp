<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ include file="../dbconn.jsp" %>

<%
		request.setCharacterEncoding("UTF-8");
		
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
		String sql = "insert into bookinformation values(?,?,?,?,?,?,?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, bookId);
		pstmt.setString(2, bookName);
		pstmt.setString(3, author);
		pstmt.setInt(4, price);
		pstmt.setString(5, bookInform);
		pstmt.setString(6, publisher);
		pstmt.setString(7, bookDate);
		pstmt.setString(8, bookCategory);
		pstmt.setInt(9, stock);
		pstmt.setString(10, bookCondition);
		pstmt.setString(11, fileName);
		pstmt.executeUpdate();
		
		if (pstmt != null)
			pstmt.close();
		if (conn != null)
			conn.close();
	response.sendRedirect("../../product/productInsert.jsp");
	
%>