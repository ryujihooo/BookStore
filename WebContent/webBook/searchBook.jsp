<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Product2"%>
<%@ page import="dao.ProductRepository2"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>검색결과</title>
</head>
<body>
<jsp:include page="header.jsp" />
<center><h3>검색결과</h3></center>
<div class="bordertable">
<table class="table table-striped">
    <thead>
        <tr>
            <th scope="col">title</th>
            <th scope="col">author</th>
        </tr>
    </thead>
            <tr>
                <th scope="row"></th>
                <td><a href="">{{post.title}}</a></td>
                <td>{{post.author}}</td>
            </tr>
  </tbody>
</table>
</div>

</body>
</html>