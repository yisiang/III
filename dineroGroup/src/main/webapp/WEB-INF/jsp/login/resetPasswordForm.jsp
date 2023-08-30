<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <link rel="apple-touch-icon" sizes="76x76" href="${pageContext.request.contextPath}/img/apple-icon.png">
  <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/img/favicon.png">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <title>
    Dinero Login
  </title>
  <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
  <!--     Fonts and icons     -->
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
  <!-- CSS Files -->
  <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" />
  <link href="${pageContext.request.contextPath}/css/now-ui-dashboard.css?v=1.6.0" rel="stylesheet" />
  <!-- CSS Just for demo purpose, don't include it in your project -->
  <link href="${pageContext.request.contextPath}/demo/demo.css" rel="stylesheet" />
  <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
</head>
<body>
<body class="login-page sidebar-mini ">
  <!-- Navbar -->
  <nav class="navbar navbar-expand-lg navbar-transparent  bg-primary  navbar-absolute">
    <div class="container-fluid">
      <div class="navbar-wrapper">
        <a class="navbar-brand" href="#pablo">Dinero</a>
      </div>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navigation" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-bar navbar-kebab"></span>
        <span class="navbar-toggler-bar navbar-kebab"></span>
        <span class="navbar-toggler-bar navbar-kebab"></span>
      </button>
      <div class="collapse navbar-collapse justify-content-end" id="navigation">
        <ul class="navbar-nav">
          <li class="nav-item ">
            <a href="${pageContext.request.contextPath}/showmemberregist" class="nav-link">
              <i class="now-ui-icons tech_mobile"></i>
              註冊
            </a>
          </li>
          <li class="nav-item  active ">
            <a href="${pageContext.request.contextPath}/showMyLoginPage" class="nav-link">
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
    <div class="full-page login-page section-image" filter-color="black" data-image="${pageContext.request.contextPath}/img/bg14.jpg">
      <!--   you can change the color of the filter page using: data-color="blue | purple | green | orange | red | rose " -->
      <div class="content">
        <div class="container">
          <div class="col-md-4 ml-auto mr-auto">

            <form:form class="form" method="post" action="${pageContext.request.contextPath}/resetPassword">
            <input id="token" type="hidden" name="token"  value= "${token}" />
              <div class="card card-login card-plain">
                <div class="card-header ">
                  <div class="logo-container">
                    <img src="${pageContext.request.contextPath}/img/now-logo.png" alt="">
                  </div>
         <c:if test="${error != null}">
		<p class = "text-danger">${error}</p>
		</c:if>
		
		<p class = "text-success">${message}</p>
                </div>
                <div class="card-body ">
                  <div class="input-group no-border form-control-lg">
                    <div class="input-group-prepend">
                      <div class="input-group-text">
                        <i class="now-ui-icons text_caps-small"></i>
                      </div>
                    </div>
                    <input type="password" name="password" id="password" required autofocus placeholder="請輸入您要更改的密碼" class="form-control"/>
                  </div>
                    <div class="input-group no-border form-control-lg">
                    <div class="input-group-prepend">
                      <div class="input-group-text">
                        <i class="now-ui-icons text_caps-small"></i>
                      </div>
                    </div>
                    <input type="password" name="confirmPassword" required autofocus  placeholder="請再次輸入密碼" class="form-control"  oninput=checkPasswordMatch(this)  />
                  </div>
                </div>
                <div class="card-footer ">
                  <button type="submit"  class="btn btn-primary btn-round btn-lg btn-block mb-3" >送出</button>
                  </div>
                </div>
              </div>
            </form:form>
          </div>
        </div>
      </div>
      <footer class="footer">
        <div class=" container-fluid ">
          <nav>
            <ul>
            </ul>
          </nav>

        </div>
      </footer>
    </div>
  </div>
  <!--   Core JS Files   -->
  <script src="${pageContext.request.contextPath}/js/core/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/core/popper.min.js"></script>
<!--   <script src="/js/core/bootstrap.min.js"></script> -->
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
  <script src=${pageContext.request.contextPath}/js/plugins/nouislider.min.js"></script>
  <!--  Google Maps Plugin    -->
<!--   <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script> -->
  <!-- Chart JS -->
  <script src="${pageContext.request.contextPath}/js/plugins/chartjs.min.js"></script>
  <!--  Notifications Plugin    -->
  <script src="${pageContext.request.contextPath}/js/plugins/bootstrap-notify.js"></script>
  <!-- Control Center for Now Ui Dashboard: parallax effects, scripts for the example pages etc -->
<!--   <script src="/js/now-ui-dashboard.min.js?v=1.6.0" type="text/javascript"></script>Now Ui Dashboard DEMO methods, don't include it in your project! -->
  <script src="${pageContext.request.contextPath}/demo/demo.js"></script>
  <script>
    $(document).ready(function() {
      demo.checkFullPageBackgroundImage();
    });
    
       
  </script>
  
    <script>
  
      function checkPasswordMatch(fieldConfirmPassword){
    	if(fieldConfirmPassword.value != $("#password").val()){
    		fieldConfirmPassword.setCustomValidity("您輸入的兩者密碼不吻合");
    	}else{
    		fieldConfirmPassword.setCustomValidity("");
    	}
    }
      
      

 </script>     
</body>

</body>
</html>