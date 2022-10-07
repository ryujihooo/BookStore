<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<title>고객센터 글쓰기</title>
</head>
<body>
<jsp:include page="header.jsp" />
	<div class="jumbotron">
		<div class="container" align="center">
			<form method="post" action="cs_write_action.jsp">
			<h3>고객센터</h3>
				<p><table style="width: 600px; text-align: center; border: 1px solid #dddddd">
					<tbody>
						<tr>
							<td><input type="text" class="form-control" placeholder="글 제목" name="csTitle" maxlength="50"></td>
						</tr>
						<tr>
							<td><textarea class="form-control" placeholder="글 내용" name="csContent" maxlength="2048" style="height: 200px;"></textarea></td>
						</tr>
					</tbody>
				</table>
				<p><input type="submit" class="btn btn-primary pull-right" value="글쓰기">
			</form>
		</div>
	</div>
</body>
</html>