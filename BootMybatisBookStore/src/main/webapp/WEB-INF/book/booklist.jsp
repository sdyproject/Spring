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
    #bookimg{
    
    align-content: center; 
    	
    }
    
    </style>
</head>
<body>
	<c:if test="${totbooks==0 }">
	<div class="alert alert-info ">
		<b>저장된 책정보가 없습니다</b>
	
	</div>
	</c:if>
	
	<c:if test="${totbooks>0 }">
	<div class="alert alert-info ">
		<b>총 ${totbooks }개의 책정보가 있습니다 </b>
	
	</div>
	</c:if>
	
	
	<br>
   <c:forEach var = "a" items = "${list }"  varStatus="i" >
      <table class = "table table-bordered" style="width: 300px; float: left ;"  >
         <tr>
            <td>
            	<div id="bookimg">
               <c:if test="${a.bookphoto!=null }">
                  <img alt ="" src = "../upload/${a.bookphoto }"  style="width: 100px;">
               </c:if>
               <c:if test="${a.bookphoto==null }">
                  <img alt ="" src = "../upload/noimg.png" >
               </c:if>
               </div>
               
               <h4>도서명: ${a.bookname }</h4>
               <h4>저자: ${a.bookwriter }</h4>
               
               <h4>단가: <fmt:formatNumber value = "${a.bookprice }" type ="currency"/></h4>
                <h4>도서 출판사 : ${a.bookcompany }</h4>
               <h4>입고날짜: <fmt:formatDate value = "${a.ipgoday }" pattern = "yyyy-MM-dd FHH:mm"/> </h4>
            </td>
            
         </tr>
      </table> 
      
      <c:if test="${i.count%2==0 }">
         <div style = "clear: both"></div><br> 
      </c:if>        
   </c:forEach>
</body>
</html>