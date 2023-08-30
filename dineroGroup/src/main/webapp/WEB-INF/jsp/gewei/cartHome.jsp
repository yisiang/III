<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>geweiHomePage</title>
<!-- <link -->
<!-- 	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" -->
<!-- 	rel="stylesheet" -->
<!-- 	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" -->
<!-- 	crossorigin="anonymous"> -->
  <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200|Open+Sans+Condensed:700" rel="stylesheet">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
  <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" />
  <link href="${pageContext.request.contextPath}/css/now-ui-kit.css?v=1.3.1" rel="stylesheet" />
  <link href="${pageContext.request.contextPath}/demo/demo.css" rel="stylesheet" />
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
.
</style>
</head>

<body class="product-page sidebar-collapse">
	<jsp:include page="../UserNavBar.jsp"></jsp:include>
	 <div class="page-header page-header-mini" style="min-height: 10vh">
      <div class="page-header-image" data-parallax="true" style="background-image: url('${pageContext.request.contextPath}/img/pp-cov.jpg');">
      </div>
    </div>
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
	
	  <script src="${pageContext.request.contextPath}/js/core/jquery.min.js" type="text/javascript"></script>
  <script src="${pageContext.request.contextPath}/js/core/popper.min.js" type="text/javascript"></script>
  <script src="${pageContext.request.contextPath}/js/core/bootstrap.min.js" type="text/javascript"></script>
  <!--  Plugin for Switches, full documentation here: http://www.jque.re/plugins/version3/bootstrap.switch/ -->
  <script src="${pageContext.request.contextPath}/js/plugins/bootstrap-switch.js"></script>
  <!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
  <script src="${pageContext.request.contextPath}/js/plugins/nouislider.min.js" type="text/javascript"></script>
  <!--  Plugin for the DatePicker, full documentation here: https://github.com/uxsolutions/bootstrap-datepicker -->
  <script src="${pageContext.request.contextPath}/js/plugins/moment.min.js"></script>
  <!--	Plugin for Tags, full documentation here: https://github.com/bootstrap-tagsinput/bootstrap-tagsinputs  -->
  <script src="${pageContext.request.contextPath}/js/plugins/bootstrap-tagsinput.js"></script>
  <!--	Plugin for Select, full documentation here: http://silviomoreto.github.io/bootstrap-select -->
  <script src="${pageContext.request.contextPath}/js/plugins/bootstrap-selectpicker.js" type="text/javascript"></script>
  <!--  Plugin for the DateTimePicker, full documentation here: https://eonasdan.github.io/bootstrap-datetimepicker/ -->
  <script src="${pageContext.request.contextPath}/js/plugins/bootstrap-datetimepicker.js" type="text/javascript"></script>
  <!--  Google Maps Plugin    -->
  <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
  <!-- Control Center for Now Ui Kit: parallax effects, scripts for the example pages etc -->
  <script src="${pageContext.request.contextPath}/js/now-ui-kit.js?v=1.3.1" type="text/javascript"></script>
</body>

</html>