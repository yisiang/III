<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
<meta charset="UTF-8">
<title>User Management Application</title>
<script src="http://code.jquery.com/jquery-1.10.2.js"
	type="text/javascript"></script>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

</head>

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

            			新增會員
					</h2>
				</caption>


		<form action="${pageContext.request.contextPath}/users.insertadmin" method="POST" name="userForm" onSubmit="return validateForm()" enctype="multipart/form-data">
		<input type="hidden" name="action" value="insert" />

				<fieldset class="form-group">
					<label>帳號</label> <input type="text"
						 class="form-control"
						name="username" required="required" minlength="1">
				</fieldset>
				<fieldset class="form-group">
					<label>密碼</label> <input type="text"
						 class="form-control"
						name="password" minlength="1">
				</fieldset>
				<fieldset class="form-group">
					<label>姓名</label> <input type="text"
						 class="form-control"
						name="name" minlength="1">
					<span id="available" class="form-group">test</span>
				</fieldset>
					<fieldset class="form-group">
					<label>信箱</label> <input type="text"
						 class="form-control"
						name="email" minlength="1">
						</fieldset>
					<fieldset class="form-group">
					<label>地址</label> <input type="text"
						 class="form-control"
						name="address" minlength="1">
						</fieldset>
						
						
				<fieldset class="form-group">		
					<label>照片</label>
					 <input type="file"
						 class="form-control"
						name="fileImage" id="fileImage" accept="image/png , image/jpeg , image/jpg">		
						</fieldset>
				<p>
					<img id="thumbnail" alt="Photo Preview"/>
				</p>
				<button type="submit" value="Save" class="btn btn-success">新增</button>
				</form>
				
			</div>
		</div>
	</div>


		<script type="text/javascript">
		
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
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>
