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
<style type="text/css">
body{
font-size: 2em;


}

ul.menu{
list-style: none;

}
ul.menu li{
width: 120px;
float: left;
border: 1px solid gray;
height: 60px;
line-height: 60px;
margin-right: 10px;
text-align: center;
font-size: 25px; 
background-color:  black; 
cursor: pointer;
}

ul.menu li a{
	color: black;
	text-decoration: none;

}

</style>

</head>
<body>
	<c:set var="root" value="<%=request.getContextPath()%>" />

	<ul class="menu">
		<li>
		<a href="${root }">Home</a>
		</li>
		
		<li>
		<a href="${root }/ipgo/form">상품등록</a>
		</li>
		
		<li>
		<a href="${root }/ipgo/lsit">리스트</a>
		</li>
		
		<li>
		<a href="${root }/board/list">게시판</a>
		</li>
		
		
		<li>
		<a href="${root }/main">로그인</a>
		</li>
		
		li>
		<a href="${root }/member/myinfo">나의정보</a>
		</li>
		
		<li>
		<a href="${root }/member/form">회원가입</a>
		</li>
		
		
	</ul>

</body>
</html>