<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@page
import="com.dinero.model.CartBean,com.dinero.model.OrderStatus"%> <%@page
import="com.dinero.model.CartItemBean,java.util.List"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />

    <!--   <link rel="pet" sizes="76x76" href="/images/logo3.png"> -->
    <link
      rel="icon"
      type="image/png"
      href="${pageContext.request.contextPath}/images/favicon-32x32.png"
    />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>歷史訂單</title>
    <meta
      content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no"
      name="viewport"
    />
    <!--     Fonts and icons     -->
    <link
      href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200|Open+Sans+Condensed:700"
      rel="stylesheet"
    />
    <link
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
      rel="stylesheet"
    />
    <link
      rel="stylesheet"
      href="https://use.fontawesome.com/releases/v5.7.1/css/all.css"
      integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr"
      crossorigin="anonymous"
    />
    <!-- CSS Files -->
    <link
      href="${pageContext.request.contextPath}/usercss/bootstrap.min.css"
      rel="stylesheet"
    />
    <link
      href="${pageContext.request.contextPath}/usercss/now-ui-kit.css?v=1.3.1"
      rel="stylesheet"
    />

    <!--jquery -->
    <script
      src="https://code.jquery.com/jquery-3.6.0.min.js"
      integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
      crossorigin="anonymous"
    ></script>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

    <!--font-->
    <link
      href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC:wght@300;400&display=swap"
      rel="stylesheet"
    />

    <style>
          .divmargincontrol {
            margin-top: 20px;
          }

          .centercontainer {
            margin: 30px auto;
            width: 1000px;
           
            border-radius: 10px;
            padding-top: 5px;
      		padding-bottom: 18px;
      		
      		display: flex;
      		align-items: center;
      		 
          }
			
		.box{
      			 margin: 0 auto;
    			}


          .whitefontStyle {
            color: black;
            font-size: 10px;
            font-family: "Noto Sans TC";
          }

          .widthControll{
      width:30%;
       }
       .picBoundary {
      width: 80%; <!--
      border-style: dashed; --> <!--
      border-width: 0.2em; -->
      height: 80%;
      }
      
      .final{
      text-align:center;
       color: #FF5607;
            font-size: 18px;
            font-family: "Noto Sans TC";
      }
    </style>

    <script>
      $(function () {
        $(".divmargincontrol").css({ "margin-top": "30px" });
      });
    </script>
  </head>
  <body>
    <jsp:include page="../UserNavBar.jsp"></jsp:include>

    <div class="page-header page-header-mini" style="min-height: 10vh">
      <div
        class="page-header-image"
        data-parallax="true"
        style="
          background-image: url('${pageContext.request.contextPath}/images/大背景2.jpg');
        "
      ></div>
    </div>
    <!--分隔線 -->
    <div class="final">
    <h4 class="box">${notloginerror.message}</h4>
    <div class="centercontainer">
 		
 		<img alt="not log in alert" src="${pageContext.request.contextPath}/img/cute-cat.gif" class="box">
    </div>
	</div>
    <script
      src="${pageContext.request.contextPath}/userjs/core/jquery.min.js"
      type="text/javascript"
    >
      </scrip>
          <script
            src="${pageContext.request.contextPath}/userjs/core/popper.min.js"
            type="text/javascript"
          >
    </script>
    <script
      src="${pageContext.request.contextPath}/userjs/core/bootstrap.min.js"
      type="text/javascript"
    ></script>
    <!--  Plugin for Switches, full documentation here: http://www.jque.re/plugins/version3/bootstrap.switch/ -->
    <script src="${pageContext.request.contextPath}/userjs/plugins/bootstrap-switch.js"></script>
    <!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
    <script
      src="${pageContext.request.contextPath}/userjs/plugins/nouislider.min.js"
      type="text/javascript"
    ></script>
    <!--  Plugin for the DatePicker, full documentation here: https://github.com/uxsolutions/bootstrap-datepicker -->
    <script src="${pageContext.request.contextPath}/userjs/plugins/moment.min.js"></script>
    <!--	Plugin for Tags, full documentation here: https://github.com/bootstrap-tagsinput/bootstrap-tagsinputs  -->
    <script src="${pageContext.request.contextPath}/userjs/plugins/bootstrap-tagsinput.js"></script>
    <!--	Plugin for Select, full documentation here: http://silviomoreto.github.io/bootstrap-select -->
    <script
      src="${pageContext.request.contextPath}/userjs/plugins/bootstrap-selectpicker.js"
      type="text/javascript"
    ></script>
    <!--  Plugin for the DateTimePicker, full documentation here: https://eonasdan.github.io/bootstrap-datetimepicker/ -->
    <script
      src="${pageContext.request.contextPath}/userjs/plugins/bootstrap-datetimepicker.js"
      type="text/javascript"
    ></script>
    <!--  Google Maps Plugin    -->
    <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
    <!-- Control Center for Now Ui Kit: parallax effects, scripts for the example pages etc -->
    <script
      src="${pageContext.request.contextPath}/userjs/now-ui-kit.js?v=1.3.1"
      type="text/javascript"
    ></script>

    <!--  Plugin for Sweet Alert -->
    <script src="${pageContext.request.contextPath}/js/plugins/sweetalert2.min.js"></script>
    <!-- filter -->
    <script src="${pageContext.request.contextPath}/userjs/autofilter.js"></script>

    <script
      src="https://code.jquery.com/jquery-3.6.0.min.js"
      integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
      crossorigin="anonymous"
    ></script>

  </body>
</html>