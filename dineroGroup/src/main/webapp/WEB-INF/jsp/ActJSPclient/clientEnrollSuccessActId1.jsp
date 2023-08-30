<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <link rel="apple-touch-icon" sizes="76x76" href="${pageContext.request.contextPath}/img/apple-icon.png">
  <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/img/favicon.png">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <title>
    活動報名結果
  </title>
  <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
  <!--     Fonts and icons     -->
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200|Open+Sans+Condensed:700" rel="stylesheet">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
  <!-- CSS Files -->
  <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" />
  <link href="${pageContext.request.contextPath}/css/now-ui-kit.css?v=1.3.1" rel="stylesheet" />
  <!-- CSS Just for demo purpose, don't include it in your project -->
  <link href="${pageContext.request.contextPath}/demo/demo.css" rel="stylesheet" />
</head>

<body class="contact-page sidebar-collapse">
  <!-- Navbar -->
<!--   <nav class="navbar navbar-expand-lg bg-white fixed-top "> -->
<!--     <div class="container"> -->
<!--       <div class="dropdown button-dropdown"> -->
<!--         <a href="#pablo" class="dropdown-toggle" id="navbarDropdown" data-toggle="dropdown"> -->
<!--           <span class="button-bar"></span> -->
<!--           <span class="button-bar"></span> -->
<!--           <span class="button-bar"></span> -->
<!--         </a> -->
<!--         <div class="dropdown-menu" aria-labelledby="navbarDropdown"> -->
<!--           <a class="dropdown-header">Dropdown header</a> -->
<!--           <a class="dropdown-item" href="#">Action</a> -->
<!--           <a class="dropdown-item" href="#">Another action</a> -->
<!--           <a class="dropdown-item" href="#">Something else here</a> -->
<!--           <div class="dropdown-divider"></div> -->
<!--           <a class="dropdown-item" href="#">Separated link</a> -->
<!--           <div class="dropdown-divider"></div> -->
<!--           <a class="dropdown-item" href="#">One more separated link</a> -->
<!--         </div> -->
<!--       </div> -->
<!--       <div class="navbar-translate"> -->
<!--         <a class="navbar-brand" href="https://demos.creative-tim.com/now-ui-kit-pro/index.html" rel="tooltip" title="Designed by Invision. Coded by Creative Tim" data-placement="bottom" target="_blank"> -->
<!--           Now Ui Kit Pro -->
<!--         </a> -->
<!--         <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navigation" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation"> -->
<!--           <span class="navbar-toggler-bar top-bar"></span> -->
<!--           <span class="navbar-toggler-bar middle-bar"></span> -->
<!--           <span class="navbar-toggler-bar bottom-bar"></span> -->
<!--         </button> -->
<!--       </div> -->
      <div class="collapse navbar-collapse" data-nav-image="${pageContext.request.contextPath}/img//blurred-image-1.jpg" data-color="orange">
        <ul class="navbar-nav ml-auto">
<!--           <li class="nav-item dropdown"> -->
<!--             <a href="#" class="nav-link dropdown-toggle" id="navbarDropdownMenuLink1" data-toggle="dropdown"> -->
<!--               <i class="now-ui-icons design_app"></i> -->
<!--               <p>Components</p> -->
<!--             </a> -->
<!--             <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink1"> -->
<!--               <a class="dropdown-item" href="../index.html"> -->
<!--                 <i class="now-ui-icons business_chart-pie-36"></i> All components -->
<!--               </a> -->
<!--               <a class="dropdown-item" target="_blank" href="https://demos.creative-tim.com/now-ui-kit-pro/docs/1.0/getting-started/introduction.html"> -->
<!--                 <i class="now-ui-icons design_bullet-list-67"></i> Documentation -->
<!--               </a> -->
<!--             </div> -->
<!--           </li> -->
<!--           <li class="nav-item dropdown"> -->
<!--             <a href="#" class="nav-link dropdown-toggle" id="navbarDropdownMenuLink" data-toggle="dropdown"> -->
<!--               <i class="now-ui-icons files_paper" aria-hidden="true"></i> -->
<!--               <p>Sections</p> -->
<!--             </a> -->
<!--             <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink"> -->
<!--               <a class="dropdown-item" href="../sections.html#headers"> -->
<!--                 <i class="now-ui-icons shopping_box"></i> Headers -->
<!--               </a> -->
<!--               <a class="dropdown-item" href="../sections.html#features"> -->
<!--                 <i class="now-ui-icons ui-2_settings-90"></i> Features -->
<!--               </a> -->
<!--               <a class="dropdown-item" href="../sections.html#blogs"> -->
<!--                 <i class="now-ui-icons text_align-left"></i> Blogs -->
<!--               </a> -->
<!--               <a class="dropdown-item" href="../sections.html#teams"> -->
<!--                 <i class="now-ui-icons sport_user-run"></i> Teams -->
<!--               </a> -->
<!--               <a class="dropdown-item" href="../sections.html#projects"> -->
<!--                 <i class="now-ui-icons education_paper"></i> Projects -->
<!--               </a> -->
<!--               <a class="dropdown-item" href="../sections.html#pricing"> -->
<!--                 <i class="now-ui-icons business_money-coins"></i> Pricing -->
<!--               </a> -->
<!--               <a class="dropdown-item" href="../sections.html#testimonials"> -->
<!--                 <i class="now-ui-icons ui-2_chat-round"></i> Testimonials -->
<!--               </a> -->
<!--               <a class="dropdown-item" href="../sections.html#contactus"> -->
<!--                 <i class="now-ui-icons tech_mobile"></i> Contact Us -->
<!--               </a> -->
<!--             </div> -->
<!--           </li> -->
<!--           <li class="nav-item dropdown"> -->
<!--             <a href="#" class="nav-link dropdown-toggle" id="navbarDropdownMenuLink" data-toggle="dropdown"> -->
<!--               <i class="now-ui-icons design_image" aria-hidden="true"></i> -->
<!--               <p>Examples</p> -->
<!--             </a> -->
<!--             <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink"> -->
<!--               <a class="dropdown-item" href="../examples/about-us.html"> -->
<!--                 <i class="now-ui-icons business_bulb-63"></i> About-us -->
<!--               </a> -->
<!--               <a class="dropdown-item" href="../examples/blog-post.html"> -->
<!--                 <i class="now-ui-icons text_align-left"></i> Blog Post -->
<!--               </a> -->
<!--               <a class="dropdown-item" href="../examples/blog-posts.html"> -->
<!--                 <i class="now-ui-icons design_bullet-list-67"></i> Blog Posts -->
<!--               </a> -->
<!--               <a class="dropdown-item" href="../examples/contact-us.html"> -->
<!--                 <i class="now-ui-icons location_pin"></i> Contact Us -->
<!--               </a> -->
<!--               <a class="dropdown-item" href="../examples/landing-page.html"> -->
<!--                 <i class="now-ui-icons education_paper"></i> Landing Page -->
<!--               </a> -->
<!--               <a class="dropdown-item" href="../examples/login-page.html"> -->
<!--                 <i class="now-ui-icons users_circle-08"></i> Login Page -->
<!--               </a> -->
<!--               <a class="dropdown-item" href="../examples/pricing.html"> -->
<!--                 <i class="now-ui-icons business_money-coins"></i> Pricing -->
<!--               </a> -->
<!--               <a class="dropdown-item" href="../examples/ecommerce.html"> -->
<!--                 <i class="now-ui-icons shopping_shop"></i> Ecommerce Page -->
<!--               </a> -->
<!--               <a class="dropdown-item" href="../examples/product-page.html"> -->
<!--                 <i class="now-ui-icons shopping_bag-16"></i> Product Page -->
<!--               </a> -->
<!--               <a class="dropdown-item" href="../examples/profile-page.html"> -->
<!--                 <i class="now-ui-icons users_single-02"></i> Profile Page -->
<!--               </a> -->
<!--               <a class="dropdown-item" href="../examples/signup-page.html"> -->
<!--                 <i class="now-ui-icons tech_mobile"></i> Signup Page -->
<!--               </a> -->
<!--             </div> -->
<!--           </li> -->
<!--           <li class="nav-item"> -->
<!--             <a class="nav-link btn btn-primary" href="https://www.creative-tim.com/product/now-ui-kit-pro" target="_blank"> -->
<!--               <p>Buy Now</p> -->
<!--             </a> -->
<!--           </li> -->
        </ul>
      </div>
    </div>
  </nav>
  <!-- End Navbar -->
  <div class="wrapper">
    <div class="page-header page-header-small">
      <div class="page-header-image" data-parallax="true" style="background-image: url('${pageContext.request.contextPath}/img/ActImg/wp1.jpg');">
      </div>
    </div>
    <div class="main">
      <div class="contact-content">
        <div class="container">
          <div class="row justify-content-center">
            <div class="col-md-5 ml-auto mr-auto">
              <h2 class="title">報名成功</h2>
              <p class="description">恭喜您已報名成功，活動前三天將會寄 E-mail 通知，如有任何問題，請直接聯絡我們，聯絡資訊如下：
                <br>
                <br>
              </p>
             
              <div class="info info-horizontal mt-5">
                <div class="icon icon-primary">
                  <i class="now-ui-icons location_pin"></i>
                </div>
				<div class="description">
                  <h4 class="info-title">我們的地址</h4>
                  <p> 桃園市中壢區新生路二段421號
                    <br> （聖德基督學院）
                    <br> 
                  </p>
                </div>
              </div>
               <div class="info info-horizontal">
                <div class="icon icon-primary">
                  <i class="now-ui-icons tech_mobile"></i>
                </div>
                <div class="description">
                  <h4 class="info-title">客服電話</h4>
                  <p> (03) 453-3013
                    <br> 週一至週五 09：00～16：30
                    <br> 
                  </p>
                </div>
              </div>
              <div class="info info-horizontal">
                <div class="icon icon-primary">
                  <i class="business_briefcase-24 now-ui-icons"></i>
                </div>
                <div class="description">
                  <h4 class="info-title">客服信箱</h4>
                  <p> iservice@ispan.com.tw
                    <br> 
                    <br> 
                  </p>
                </div>
              </div>
            </div>
            
            <div class="col-md-6 ml-auto mr-auto text-center"><br>
              <ul class="nav nav-pills nav-pills-primary justify-content-center" role="tablist">
                <li class="nav-item">&ensp;
                    <a class="nav-link" data-toggle="" href="${pageContext.request.contextPath}/activities/activity.bulletin" role="tablist">
                      回活動首頁
                    </a>
                </li>&nbsp;
                    <a href="https://www.facebook.com/sharer.php?u＝http://dinerocom.eastasia.cloudapp.azure.com/dinero/" class="btn btn-icon btn-lg btn-facebook btn-round">
                      <i class="fab fa-facebook-square"></i>
                    </a>
                
              </ul>
            </div>
          </div>
            
          </div>
        </div>
      </div>
    </div>
    
<!--               <div class="row justify-content-center"> -->

    
<!--   </div> -->
  <!--   Core JS Files   -->
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