<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<c:set var="root" value="<%=request.getContextPath()%>" />
	<img alt="" src="${root }/image/banner1.jpg" style="width: 1200px;">
	<Br>
	<Br>
	<img alt="" src="${root }/image/banner2.jpg"  style="width: 1200px;">
	<Br>
	<Br>

	<img alt="" src="${root }/image/banner3.jpg"  style="width: 1200px;">
	<Br>
	<Br>
	<h1>
		<b>메인페이지입니다 </b>
	</h1>

</body>
</html>