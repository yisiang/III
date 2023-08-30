<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>geweiHomePage</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<style>
.suwaStyle {
	font-size: 30px;
	font-family: Microsoft JhengHei;
	background-color: #FFDA29;
	text-align: center;
	border-radius: 40px 10px;
}

a {
	color: #263056;
	text-decoration: none;
}

.upperMargin {
	margin-top: 30px;
}

.col-md-auto {
	width: 15%;
	border-radius: 40px 10px;
}

 input[type=submit] {
    	
    	background:#ccc; 
    	border:0 none;
    	background-color: transparent;
	}
</style>
</head>

<body>
	<nav class="navbar navbar-light navbar-expand-lg"
		style="background-color: coral;">
		<div class="container-fluid">
			<a class="navbar-brand"
				href="${pageContext.request.contextPath}/">dinero</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="${pageContext.request.contextPath}/shop/toCartHome"
						style="color: midnightblue;">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/shop/geShowProductList"
						style="color: midnightblue;">購物</a></li>
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/shop/shoppingList"
						style="color: midnightblue;">我的訂單</a></li>
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/cart"
						style="color: midnightblue;">訂單管理</a></li>
					<li class="nav-item"><a class="nav-link" href="#"
						style="color: midnightblue;">上架商品</a></li>


				</ul>
				<form class="d-flex">
					<input class="form-control me-2" type="search" placeholder="Search"
						aria-label="Search">
					<button class="btn btn-outline-success" type="submit">Search</button>
				</form>
			</div>
		</div>
	</nav>

	<div class="container">
		<div class="row justify-content-md-center">

			<div
				class="col-md-auto list-group-item list-group-item-action list-group-item-dark suwaStyle upperMargin">
				<form action="<%=request.getContextPath()%>/shop/geShowProductList"
					method="get">
					
						<input type="submit" value="開始購物" />
				</form>
			</div>

		</div>
		<div class="row justify-content-md-center">

			<div
				class="col-md-auto list-group-item list-group-item-action list-group-item-dark suwaStyle upperMargin">
				<a href="#">我的訂單</a>
			</div>

		</div>
		<div class="row justify-content-md-center">

			<div
				class="col-md-auto  list-group-item list-group-item-action list-group-item-dark suwaStyle upperMargin">
				<a href="${pageContext.request.contextPath}/cart">管理者介面</a>
			</div>

		</div>
		<div class="row justify-content-md-center">

			<div
				class="col-md-auto list-group-item list-group-item-action list-group-item-dark suwaStyle upperMargin">
				<a href="http://localhost:8080/dinero/gewei/CreateProduct.jsp">商品上架</a>
			</div>

		</div>
	</div>
</body>

</html>