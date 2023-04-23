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

	<c:if test="${sessionScope.loginok==null }">
		<img alt="" src="${root }/image/no.png" width="130" height="130"
			class="img-circle">
	</c:if>

	<c:if test="${sessionScope.loginok!=null }">
	<img alt="" src="${root }/photo/${sessionScope.loginphoto}" width="130" height="130"
  class="img-circle">
</c:if>
	<Br>
	<Br>

	<span class="glyphicon glyphicon-envelope"> email</span>&nbsp;
	ehddlrhome@naver.com
	<br>
	<Br>
	<span class="	glyphicon glyphicon-book"> 스스므 패션커뮤니티</span>
	<br>
	<a href=""> <img alt="" src="../image/info.png"
		style="width: 200px; height: 200px;">
	</a>

	<Br>


</body>
</html>