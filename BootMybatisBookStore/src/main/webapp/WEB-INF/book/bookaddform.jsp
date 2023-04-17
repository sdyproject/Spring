<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix = "fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.6.3.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<form action="insert" method="post" enctype="multipart/form-data">
	
	
	
	
	<input type="file" name="photo" class="form-control" style="width: 300px;" >
	
	
	
	
	<table class="table talbe-bordered" style="width: 500px;" > 
	<caption>책정보 입력</caption>
	<tr>
	<th bgcolor="#Aaaa">도서명</th>
	<td> 
	<input type="text" name="bookname" class="form-control" style="width: 200px;" required="required">
	</td>
	
	</tr>
	
	<tr>
	<th bgcolor="#Aaaa">저자</th>
	<td> 
	<input type="text" name="bookwriter" class="form-control" style="width: 200px;" required="required">
	</td>
	
	</tr>
	
	
	<tr>
	<th bgcolor="#Aaaa">단가</th>
	<td> 
	<input type="text" name="bookprice" class="form-control" style="width: 200px;" required="required">
	</td>
	
	</tr>
	
	<tr>
	<th bgcolor="#Aaaa">도서 출판사</th>
	<td> 
	<input type="text" name="bookcompany" class="form-control" style="width: 200px;" required="required">
	</td>
	</tr>
	
	
	
	<tr>
	<td colspan="2" align="center">
	<button type="submit"class="btn btn-info" style="width: 100px;">저장</button>
		<button type="button"class="btn btn-info" style="width: 100px;" onclick="location.href='list'">목록</button>
	</td>
	
	</tr>
	
	
	</table>
	
	
	
	</form>
	
</body>
</html>