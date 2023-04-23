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
<script type="text/javascript">
$(function(){
	
	$("#btnnewphoto").click(function(){
		$("#newphoto").trigger("click");
	})
	
	
	$("#newphoto").change(function(){
		
		var num=$(this).attr("num");
		//alert(num)
		
		
		//폼데이터 생성 파일,이미지 ajax할때 
		
		var form=new FormData();
		form.append("photo",$("#newphoto")[0].files[0]); //선택한 한개만 추가 
		form.append("num",num);
		
		console.dir(form);
		
		
		$.ajax({
			
			type:"post",
			dataType:"text",
			url:"updatephoto",
			processData:false,
			contentType:false,
			data:form,
			success:function(){
				location.reload();
			}
		});
	});
	
	
	//수정버튼 클릭시 모달에 데이타 넣기 
	 $("#btnupdate").click(function(){
		 
		 updatenum=$(this).attr("num");
		// alert(updatenum); 
		  
		
		$.ajax({
			type:"get",
			dataType:"json",
			url:"updateform",
			data:{"num": updatenum},
			success:function(res){
				
				console.dir(res);
				$("#updatename").val(res.name);
				$("#updatehp").val(res.hp);
				$("#updateaddr").val(res.addr);
				$("#updateemail").val(res.email);

				
			}
			
		});
		  
	  });
	//수정
	  $("#btnupdateok").click(function(){
		  
		  
		  var updatename=$("#updatename").val();
		  var updatehp=$("#updatehp").val();
		  var updateemail=$("#updateemail").val();
		  var updateaddr=$("#updateaddr").val();
		  
		  var data="num="+updatenum+"&name="+updatename+"&hp="+updatehp+"&email="+updateemail+"&addr="+updateaddr;
		  console.log(data);
		  
		  
		  $.ajax({
			  
			  type:"post",
			  dataType:"text",
			  data:data,
			  url:"update",
			  success:function(){
				  location.reload();
			  }
		  });
	  });
	
});

</script>



</head>
<body>
<div style="margin: 200px;">
   <table class="table table-bordered" >
      <c:forEach var="dto" items="${list }">
      
      <c:if test="${sessionScope.loginok!=null and sessionScope.myid==dto.id }">
        <tr>
          <td style="width: 250px;" align="center" rowspan="5">
            <img alt="" src="../photo/${dto.photo }" width="220"
            height="250" border="1">
            <br>
            <input type="file" id="newphoto" style="display: none;" num="${dto.num }">  <!-- 사진수정시 호출 -->
            <button type="button" class="btn btn-info" id="btnnewphoto">사진수정</button>
          </td>
          
          <td style="width: 300px;">회원명: ${dto.name }</td>
          
          <!-- 수정 삭제 버튼 -->
          <td rowspan="5" align="center" style="width: 200px; vertical-align: middle;">
            <button type="button" class="btn btn-default" 
   			 data-toggle="modal" data-target="#myModal2" id="btnupdate" num=${dto.num }>수정</button><br><br>
            
            <button type="button" class="btn btn-default" 
            onclick="location.href=''">삭제</button>
          </td>
          
        </tr>
        
        <tr>
            <td style="width: 300px;">아이디: ${dto.id }</td>
        </tr>
        <tr>
            <td style="width: 300px;">이메일: ${dto.email }</td>
        </tr>
        <tr>
            <td style="width: 300px;">핸드폰: ${dto.hp }</td>
        </tr>
        <tr>
            <td style="width: 300px;">주소: ${dto.addr }</td>
        </tr>
        
       </c:if> 
      </c:forEach>
   </table>
</div>

  <!-- Modal -->
  <div class="modal fade" id="myModal2" role="dialog">
    <div class="modal-dialog modal-sm">
    
      <!-- Modal content-->
      <div class="modal-content">
      
      <!--  header-->
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">회원 정보 수정</h4>
        </div>
        
        
        
        <!-- body -->
        <div class="modal-body">
		          <div class="form-group">
				      <label for="updatename">Name:</label>
				      <input type="text" class="form-control" id="updatename">
		    	</div>
			    <div class="form-group">
				      <label for="updatehp">Password:</label>
				      <input type="text" class="form-control" id="updatehp">
			    </div>
			     <div class="form-group">
				      <label for="updateaddr">address:</label>
				      <input type="text" class="form-control" id="updateaddr">
			    </div>
			    <div class="form-group">
				      <label for="updateemail">email:</label>
				      <input type="text" class="form-control" id="updateemail">
		    	</div>
			   
        </div>
        
        
        
        
       <!-- footer -->
        
        <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal" id="btnupdateok">수정</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
        </div>
      </div>
      
    </div>
  </div>
  
 


	
</body>
</html>