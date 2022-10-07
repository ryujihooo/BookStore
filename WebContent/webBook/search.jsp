<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색</title>
<script type="text/javascript">
 function check(){
  if(document.search.keyWord.value==''){
   alert('검색어를 입력하세요'); 
   document.search.keyWord.focus();
   return false;
  }
 }
</script>
</head>
<body>
	<form name = "search" method = "post" action ="searchBook.jsp" onsubmit="return check()">
	 <table width="10" border="5" align="center">
	<tr>
   <td align ="center" valign="bottom">
    <select name="keyField">
     <option value="subject">제목</option>
     <option value="writer">이름</option>
     <option value="content">내용</option>
     </select>
     </td>
     
   <td>
    <input type="text" size="50" name="keyWord"> 
   </td>
   
   <td>
    <input type="submit" value="찾기">
   </td>  
  </tr>
  </table>
</form>
</body>
</html>