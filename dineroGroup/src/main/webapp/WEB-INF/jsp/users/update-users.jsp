<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*" %>
<html>
<head>
<meta charset="UTF-8">
<title>User Management Application</title>

<link rel="stylesheet"
 href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
 integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
 crossorigin="anonymous">

</head>

<body>
 <header>
  <nav class="navbar navbar-expand-md navbar-dark"
   style="background-color: tomato">
   <div>
    <a href="" class="navbar-brand">Dinero</a>
   </div>

  </nav>
 </header>
 <div class="container col-md-5">
  <div class="card">
   <div class="card-body">
      
    <caption>
     <h2>
               編輯會員
     </h2>
    </caption>

    
  <form action="${pageContext.request.contextPath}/users/update" method="POST" name="userForm"  enctype="multipart/form-data">
  <input type="hidden" name="action" value="update" />
  <input type="hidden" name="userId" value="${User.userId}" />
  

    <fieldset class="form-group">
     <label>帳號</label> <input type="text"
       class="form-control" value="${User.username}"
      name="username" required="required" minlength="1">
    </fieldset>

    <fieldset class="form-group">
     <label>密碼</label> <input type="text"
       class="form-control" value="${User.password}"
      name="password" minlength="1">
    </fieldset>

    <fieldset class="form-group">
     <label>姓名</label> <input type="text"
       class="form-control" value="${User.name}"
      name="name" minlength="1">      
    </fieldset>
     
    
     <fieldset class="form-group">
     <label>信箱</label> <input type="text"
       class="form-control" value="${User.email}"
      name="email" minlength="1">
      
      <fieldset class="form-group">
     <label>地址</label> <input type="text"
      value="${User.address}" class="form-control"
      name="address" required="required">
    </fieldset>
      
    </fieldset>
     <label>照片</label>
      <input type="file"
       class="form-control"
      name="fileImage" id="fileImage" accept="image/png , image/jpeg , image/jpg" value="${User.photoImagePath} ">  
      </fieldset>
    <p>
     <img id="thumbnail" alt="Photo Preview"/>
    </p>
    

<%--     <c:url var="listRole" value="/users"> --%>
<%--     <c:param name="action" value="list" /> --%>
<%--     </c:url> --%>
<%--     <a href="${listLink}" class="btn btn-primary">查詢所有會員</a> <br> <br> --%>



     <fieldset class="form-group">
     <c:forEach var="roles" items="${listRoles}" >
     <input type="checkbox" value="${roles.roleId}" name="roles" id="roles"
      <c:if test="${Arrays.toString(User.roles.toArray()).contains(roles.name)}">checked="checked"</c:if>
      >
     <label for ="roles"><c:out value="${roles.name}" /></label> 
     
     </c:forEach> 
    
    
    <button type="submit" value="Save" class="btn btn-success">修改</button>
    </form>
    
<%--     ${User.roles.toArray()[0].name.contains(roles.name)} --%>
   </div>
  </div>
 </div>
<script>
 console.log('${Arrays.toString(listRoles.toArray()).contains("ADMIN")}');
 function showImageThumbnail(fileInput){
  file = fileInput.files[0];
  reader = new FileReader();
  
  reader.onload = function(e){
   $('#thumbnail').attr('src',e.target.result);
  };
  reader.readAsDataURL(file);
  
 }

 $(document).ready(function() {

  $('#fileImage').change(function(){
   showImageThumbnail(this);
  });
  
  
 });


</script>
</body>
</html>