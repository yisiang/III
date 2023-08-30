<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-1.10.2.js"
	type="text/javascript"></script>

<title>註冊表單</title>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
  <!--     Fonts and icons     -->
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
  <!-- CSS Files -->
  <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" />
  <link href="${pageContext.request.contextPath}/css/now-ui-dashboard.css?v=1.6.0" rel="stylesheet" />
  <!-- CSS Just for demo purpose, don't include it in your project -->
  <link href="${pageContext.request.contextPath}/demo/demo.css" rel="stylesheet" />
</head>

</head>
<body>
<body class="register-page sidebar-mini ">
  <!-- Navbar -->
  <nav class="navbar navbar-expand-lg navbar-transparent  bg-primary  navbar-absolute">
    <div class="container-fluid">
      <div class="navbar-wrapper">
        <a class="navbar-brand" href="#pablo">Register Page</a>
      </div>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navigation" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-bar navbar-kebab"></span>
        <span class="navbar-toggler-bar navbar-kebab"></span>
        <span class="navbar-toggler-bar navbar-kebab"></span>
      </button>
      <div class="collapse navbar-collapse justify-content-end" id="navigation">
        <ul class="navbar-nav">
          <li class="nav-item  active ">
            <a href="register.html" class="nav-link">
              <i class="now-ui-icons tech_mobile"></i>
              註冊
            </a>
          </li>
          <li class="nav-item ">
            <a href="showMyLoginPage" class="nav-link">
              <i class="now-ui-icons users_circle-08"></i>
              登入
            </a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
  <!-- End Navbar -->
  <div class="wrapper wrapper-full-page ">
    <div class="full-page register-page section-image" filter-color="black" data-image="${pageContext.request.contextPath}/img/bg16.jpg">
      <div class="content">
        <div class="container">
          <div class="row">
            <div class="col-md-5 ml-auto">
              <div class="info-area info-horizontal mt-5">
                <div class="icon icon-primary">
                </div>
                <div class="description">
                  <h5 class="info-title"></h5>

                </div>
              </div>
              <div class="info-area info-horizontal">
                <div class="icon icon-primary">
                </div>
                <div class="description">
                  <h5 class="info-title"></h5>

                </div>
              </div>
              <div class="info-area info-horizontal">
                <div class="icon icon-info">
                </div>
                <div class="description">
                  <h5 class="info-title"></h5>

                </div>
              </div>
            </div>
            <div class="col-md-4 mr-auto">
              <div class="card card-signup text-center">
                <div class="card-header ">
                  <h4 class="card-title">恭喜信箱認證成功</h4>
                  <div class="social">
                    <button class="btn btn-icon btn-round btn-twitter">
                      <i class="fab fa-twitter"></i>
                    </button>
                    <button class="btn btn-icon btn-round btn-dribbble">
                      <i class="fab fa-dribbble"></i>
                    </button>
                    <button class="btn btn-icon btn-round btn-facebook">
                      <i class="fab fa-facebook-f"></i>
                    </button>
                    <h5 class="card-description" style="color:green">${NOTIFICATION}</h5>
                  </div>
                </div>
                <div class="card-body ">
                    

					<a href="${pageContext.request.contextPath}/showMyLoginPage">點此登入帳號密碼</a>
                    <div id="msg"></div>
                    <div id="msg2"></div>
                </div>
                <div class="card-footer ">
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <footer class="footer">
        <div class="container-fluid ">
          <nav>
            <ul>
              <li>
                <a href="https://www.creative-tim.com">
                  Creative Tim
                </a>
              </li>
              <li>
                <a href="http://presentation.creative-tim.com">
                  About Us
                </a>
              </li>
              <li>
                <a href="http://blog.creative-tim.com">
                  Blog
                </a>
              </li>
            </ul>
          </nav>
          <div class="copyright" id="copyright">
            &copy; <script>
              document.getElementById('copyright').appendChild(document.createTextNode(new Date().getFullYear()))
            </script>, Designed by <a href="https://www.invisionapp.com" target="_blank">Invision</a>. Coded by <a href="https://www.creative-tim.com" target="_blank">Creative Tim</a>.
          </div>
        </div>
      </footer>
    </div>
  </div>



<%-- 	<jsp:include page="../common/header.jsp"></jsp:include> --%>
<!-- 	<div class="container"> -->

<!-- 		<h2>註冊表單</h2> -->
<!-- 		<div class="col-md-6 col-md-offset-3"> -->
<!-- 			<div class="alert alert-success center" role="alert"> -->
<%-- 				<p>${NOTIFICATION}</p> --%>
<!-- 			</div> -->

<!-- 			<!-- 		<form action="register" method="GET" name="userForm" onSubmit="return validateForm()"> --> -->
<!-- 			<form action="users.registercheck" method="post"> -->



<!-- 				<div class="form-group"> -->
<!-- 					<label for="uname">姓名:</label> <input type="text" -->
<!-- 						class="form-control" id="name" placeholder="姓名" name="name" -->
<!-- 						required> -->
<!-- 				</div> -->

<!-- 				<div class="form-group"> -->
<!-- 					<label for="uname">信箱:</label> <input type="text" -->
<!-- 						class="form-control" id="email" placeholder="信箱" name="email" -->
<!-- 						required> -->
<!-- 				</div> -->

<!-- 				<div class="form-group"> -->
<!-- 					<label for="uname">帳號:</label> <input type="text" -->
<!-- 						class="form-control" id="username" placeholder="帳號" -->
<!-- 						name="username" required> -->
<!-- 				<span id="available" class="form-group">test</span> -->
<!-- 				</div> -->
				
<!-- 					<div class="form-group"> -->
<!-- 						<label for="uname">密碼:</label> <input type="password" -->
<!-- 							class="form-control" id="password" placeholder="密碼" -->
<!-- 							name="password" required> -->
<!-- 					</div> -->

<!-- 		<button type="submit" value="Save" class="btn btn-primary">提交</button> -->
<!-- 		</form> -->
<!-- 	</div> -->
<!-- 	</div> -->
<%-- 	<jsp:include page="../common/footer.jsp"></jsp:include> --%>


<!--   Core JS Files   -->
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
 <script src="${pageContext.request.contextPath}/js/core/jquery.min.js"></script>
 <script src="${pageContext.request.contextPath}/js/core/popper.min.js"></script>
<!--   <script src="${pageContext.request.contextPath}/js/core/bootstrap.min.js"></script> -->
 <script src="${pageContext.request.contextPath}/js/plugins/perfect-scrollbar.jquery.min.js"></script>
 <script src="${pageContext.request.contextPath}/js/plugins/moment.min.js"></script>
 <!--  Plugin for Switches, full documentation here: http://www.jque.re/plugins/version3/bootstrap.switch/ -->
 <script src="${pageContext.request.contextPath}/js/plugins/bootstrap-switch.js"></script>
 <!--  Plugin for Sweet Alert -->
 <script src="${pageContext.request.contextPath}/js/plugins/sweetalert2.min.js"></script>
 <!-- Forms Validations Plugin -->
 <script src="${pageContext.request.contextPath}/js/plugins/jquery.validate.min.js"></script>
 <!--  Plugin for the Wizard, full documentation here: https://github.com/VinceG/twitter-bootstrap-wizard -->
 <script src="${pageContext.request.contextPath}/js/plugins/jquery.bootstrap-wizard.js"></script>
 <!--	Plugin for Select, full documentation here: http://silviomoreto.github.io/bootstrap-select -->
 <script src="${pageContext.request.contextPath}/js/plugins/bootstrap-selectpicker.js"></script>
 <!--  Plugin for the DateTimePicker, full documentation here: https://eonasdan.github.io/bootstrap-datetimepicker/ -->
 <script src="${pageContext.request.contextPath}/js/plugins/bootstrap-datetimepicker.js"></script>
 <!--  DataTables.net Plugin, full documentation here: https://datatables.net/    -->
 <script src="${pageContext.request.contextPath}/js/plugins/jquery.dataTables.min.js"></script>
 <!--	Plugin for Tags, full documentation here: https://github.com/bootstrap-tagsinput/bootstrap-tagsinputs  -->
 <script src="${pageContext.request.contextPath}/js/plugins/bootstrap-tagsinput.js"></script>
 <!-- Plugin for Fileupload, full documentation here: http://www.jasny.net/bootstrap/javascript/#fileinput -->
 <script src="${pageContext.request.contextPath}/js/plugins/jasny-bootstrap.min.js"></script>
 <!--  Full Calendar Plugin, full documentation here: https://github.com/fullcalendar/fullcalendar    -->
 <script src="${pageContext.request.contextPath}/js/plugins/fullcalendar.min.js"></script>
 <!-- Vector Map plugin, full documentation here: http://jvectormap.com/documentation/ -->
 <script src="${pageContext.request.contextPath}/js/plugins/jquery-jvectormap.js"></script>
 <!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
 <script src="${pageContext.request.contextPath}/js/plugins/nouislider.min.js"></script>
 <!--  Google Maps Plugin    -->
<!--   <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script> -->
 <!-- Chart JS -->
 <script src="${pageContext.request.contextPath}/js/plugins/chartjs.min.js"></script>
 <!--  Notifications Plugin    -->
 <script src="${pageContext.request.contextPath}/js/plugins/bootstrap-notify.js"></script>
 <!-- Control Center for Now Ui Dashboard: parallax effects, scripts for the example pages etc -->
<!--   <script src="${pageContext.request.contextPath}/js/now-ui-dashboard.min.js?v=1.6.0" type="text/javascript"></script>Now Ui Dashboard DEMO methods, don't include it in your project! -->
 <script src="${pageContext.request.contextPath}/demo/demo.js"></script>
 <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
 
	<script type="text/javascript">

	
	
	$(document).ready(function() {
	    demo.checkFullPageBackgroundImage();
	    
	    
	  });
	


	 
	  
	</script>


</body>
</html>