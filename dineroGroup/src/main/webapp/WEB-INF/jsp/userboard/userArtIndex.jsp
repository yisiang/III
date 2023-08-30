<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.dinero.model.MessageRepository"%>
<%@page import="org.hibernate.Session"%>
<!DOCTYPE html>
<html lang="en">

<head>
<link href="${pageContext.request.contextPath}/css-self/collapse.css" rel="stylesheet">
<style></style>

  <meta charset="utf-8" />
  <link rel="apple-touch-icon" sizes="76x76" href="${pageContext.request.contextPath}/user-img/apple-icon.png">
  <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/user-img/favicon.png">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>Dinero留言板</title>
<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
  <!--     Fonts and icons     -->
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200|Open+Sans+Condensed:700" rel="stylesheet">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
  <!-- CSS Files -->
  <link href="${pageContext.request.contextPath}/user-css/bootstrap.min.css" rel="stylesheet" />
  <link href="${pageContext.request.contextPath}/user-css/now-ui-kit.css?v=1.3.1" rel="stylesheet" />
  <!-- CSS Just for demo purpose, don't include it in your project -->
  <link href="${pageContext.request.contextPath}/user-demo/demo.css" rel="stylesheet" />
</head>
  
<body class="product-page sidebar-collapse">
  <!-- Navbar -->
<jsp:include page="../UserNavBar.jsp"></jsp:include>
<!-- End Navbar -->

<div class="wrapper">
    <div class="page-header page-header-small">
      <div class="page-header-image" data-parallax="true" style="background-image: url('${pageContext.request.contextPath}/user-img/dog-and-cat.jpeg');">
      </div>
      <div class="content-center">
        <div class="row">
          <div class="col-md-8 ml-auto mr-auto text-center">
            <h2 class="title">寵物留言板</h2>
            <a href="#button" class="btn btn-primary btn-round  btn-icon">
              <i class="fab fa-twitter"></i>
            </a>
            <a href="#button" class="btn btn-primary btn-round  btn-icon">
              <i class="fab fa-instagram"></i>
            </a>
          </div>
        </div>
      </div>
    </div>
    <div class="projects-4">
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-6 px-0">
            <div class="card card-fashion card-background" style="background-image: url('${pageContext.request.contextPath}/images/pet-therapy.jpeg')">
              <div class="card-body">
                <div class="card-title text-left">
                  <h2>
                    <a href="${pageContext.request.contextPath}/category?category=寵物醫療保健">
                      寵物醫療保健
                    </a>
                  </h2>
                </div>
                <div class="card-footer text-left">
                  <div class="stats">
                    <span>
                      <i class="now-ui-icons users_circle-08"></i>Ethan Wang
                    </span>
                    <span>
                      <i class="now-ui-icons tech_watch-time"></i>May 20, 2022 
                    </span>
                  </div>
                  <div class="stats-link pull-right">
                    <a href="#pablo" class="footer-link"></a>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-md-3 px-0">
            <div class="card card-fashion">
              <div class="card-title">
                <a href="#pablo">
                  <h2>
                    <a href="${pageContext.request.contextPath}/category?category=寵物認領養">
                     寵物認領養
                    </a>
                  </h2>
                </a>
              </div>
              <div class="card-body">
                <div class="card-footer">
                  <div class="stats">
                    <span>
                      <i class="now-ui-icons users_circle-08"></i>
                    </span>
                    <span>
                      <i class="now-ui-icons tech_watch-time"></i> 
                    </span>
                  </div>
                  <div class="stats-link pull-right">
                    <a href="#pablo">Sea</a>&sbquo;
                    <a href="#pablo">Magazine</a>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-md-3 px-0">
            <div class="card card-fashion card-background" style="background-image: url('${pageContext.request.contextPath}/images/pets-adoption.jpeg')">
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-3 px-0">
            <div class="card card-fashion card-background" style="background-image: url('${pageContext.request.contextPath}/images/emotions2.jpeg')">
            </div>
          </div>
          <div class="col-md-3 px-0">
            <div class="card card-fashion arrow-left">
              <div class="card-title">
                <h2>
                  <a href="${pageContext.request.contextPath}/category?category=寵物心情">
                    寵物心情
                  </a>
                </h2>
              </div>
              <div class="card-body">
                <div class="card-footer">
                  <div class="stats">
                    <span>
                      <i class="now-ui-icons users_circle-08"></i>
                    </span>
                    <span>
                      <i class="now-ui-icons tech_watch-time"></i> 
                    </span>
                  </div>
                  <div class="stats-link pull-right">
                    <a href="#pablo">Opinion</a>&sbquo;
                    <a href="#pablo">Outdoor</a>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-md-6 px-0">
            <div class="card card-fashion card-background" style="background-image: url('${pageContext.request.contextPath}/images/nutrition.jpeg')">
              <div class="card-body">
                <div class="card-title text-left">
                  <h2>
                    <a href="${pageContext.request.contextPath}/category?category=寵物營養">
                    寵物營養
                    </a>
                  </h2>
                </div>
                <div class="card-footer text-left">
                  <div class="stats">
                    <span>
                      <i class="now-ui-icons users_circle-08"></i>Ethan Wang
                    </span>
                    <span>
                      <i class="now-ui-icons tech_watch-time"></i> May 20, 2022
                    </span>
                  </div>
                  <div class="stats-link pull-right">
                    <a href="#pablo" class="footer-link">People</a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="main">
      <div class="container">
        <div class="section">
          <h4 class="title text-center">相關文章</h4>
          <br />
          <div class="row">
          <c:forEach var="message" items="${messages}" begin="1" end="9" step="3">
            <div class="col-md-4">
              <div class="card card-plain card-blog">
                <div class="card-image">
                  <a href="#pablo">
                    <img class="img rounded img-raised" src="<c:out value="${message.picBase64}"/>" />
                  </a>
                </div>
                <div class="card-body">
                  
                  <h6 class="category text-info"><c:out value="${message.category}" /></h6>
                  <h4 class="card-title">
                
                    <a href="#pablo"><c:out value="${message.messagetitle}" /></a>
                  </h4>
                  <p class="card-description">
                  <div id="module" class="container"> 
                  	<p class="collapse" id="collapseExample${message.messageId }" aria-expanded="false">
                   <c:out value="${message.message}" />
                   	 </p> 
                   	  <a role="button" class="collapsed" data-toggle="collapse" href="#collapseExample${message.messageId }" aria-expanded="false" aria-controls="collapseExample${message.messageId }"></a>
                   	  </div>
<!--                     <a href="#pablo"> Read More </a> -->
                    <div class="author">
                      <img src="${pageContext.request.contextPath}/img/olivia.jpg" alt="..." class="avatar img-raised">
                      <span>Anna Spark</span>
                    </div>
                  </p>
                </div>
              </div>
            </div>
            
<!--             <div id="module" class="container"> -->
<!--   				<h3>Bacon Ipsum</h3> -->
<!--  		 		<p class="collapse" id="collapseExample" aria-expanded="false"> -->
<!-- 			    Bacon ipsum dolor amet doner picanha tri-tip biltong leberkas salami meatball tongue filet mignon landjaeger tail. Kielbasa salami tenderloin picanha spare ribs, beef ribs strip steak jerky cow. Pork chop chicken ham hock beef ribs turkey jerky. Shoulder -->
<!-- 			    beef capicola doner, tongue tail sausage short ribs andouille. Rump frankfurter landjaeger t-bone, kielbasa doner ham hock shankle venison. Cupim capicola kielbasa t-bone, ball tip chicken andouille venison pork chop doner bacon beef ribs kevin shankle. -->
<!-- 			    Short loin leberkas tenderloin ground round shank, brisket strip steak ham hock ham. -->
<!-- 			  </p> -->
<!-- 			  <a role="button" class="collapsed" data-toggle="collapse" href="#collapseExample" aria-expanded="false" aria-controls="collapseExample"> -->
<!--  			 </a> -->
<!-- 		</div> -->
            
<!--             <div class="col-md-4"> -->
<!--               <div class="card card-plain card-blog"> -->
<!--                 <div class="card-image"> -->
<!--                   <a href="#pablo"> -->
<!--                     <img class="img rounded img-raised" src="../assets/img/bg27.jpg" /> -->
<!--                   </a> -->
<!--                 </div> -->
<!--                 <div class="card-body"> -->
<!--                   <h6 class="category text-success"> -->
<!--                     Startups -->
<!--                   </h6> -->
<!--                   <h4 class="card-title"> -->
<!--                     <a href="#pablo">Lyft launching cross-platform service this week</a> -->
<!--                   </h4> -->
<!--                   <p class="card-description"> -->
<!--                     Like so many organizations these days, Autodesk is a company in transition. It was until recently a traditional boxed software company selling licenses. -->
<!--                     <a href="#pablo"> Read More </a> -->
<!--                     <div class="author"> -->
<!--                       <img src="../assets/img/michael.jpg" alt="..." class="avatar img-raised"> -->
<!--                       <span>John Black</span> -->
<!--                     </div> -->
<!--                   </p> -->
<!--                 </div> -->
<!--               </div> -->
<!--             </div> -->
<!--             <div class="col-md-4"> -->
<!--               <div class="card card-plain card-blog"> -->
<!--                 <div class="card-image"> -->
<!--                   <a href="#pablo"> -->
<!--                     <img class="img rounded img-raised" src="../assets/img/bg21.jpg" /> -->
<!--                   </a> -->
<!--                 </div> -->
<!--                 <div class="card-body"> -->
<!--                   <h6 class="category text-danger"> -->
<!--                     <i class="now-ui-icons media-2_sound-wave"></i> Enterprise -->
<!--                   </h6> -->
<!--                   <h4 class="card-title"> -->
<!--                     <a href="#pablo">6 insights into the French Fashion landscape</a> -->
<!--                   </h4> -->
<!--                   <p class="card-description"> -->
<!--                     Like so many organizations these days, Autodesk is a company in transition. It was until recently a traditional boxed software company selling licenses. -->
<!--                     <a href="#pablo"> Read More </a> -->
<!--                     <div class="author"> -->
<!--                       <img src="../assets/img/james.jpg" alt="..." class="avatar img-raised"> -->
<!--                       <span>James Newman</span> -->
<!--                     </div> -->
<!--                   </p> -->
<!--                 </div> -->
<!--               </div> -->
<!--             </div> -->
           </c:forEach>
          </div>
        </div>
      </div>
      
     <!--   新增文章  -->
	<div class="d-grid gap-2 d-md-flex justify-content-md-end">
		<a href="${pageContext.request.contextPath}/ucreateArticle" "class="btn btn-primary btn-sm">
			<button class="btn btn-primary btn-sm">新增</button>
		</a>
	</div>
      
<!--      
      <div class="subscribe-line subscribe-line-white">
        <div class="container">
          <div class="row">
            <div class="col-md-6">
              <h4 class="title">Get Tips &amp; Tricks every Week!</h4>
              <p class="description">
                Join our newsletter and get news in your inbox every week! We hate spam too, so no worries about this.
              </p>
            </div>
            <div class="col-md-6">
              <div class="card card-plain card-form-horizontal">
                <div class="card-content">
                  <form method="" action="">
                    <div class="row">
                      <div class="col-sm-8">
                        <div class="input-group">
                          <div class="input-group-prepend">
                            <span class="input-group-text"><i class="now-ui-icons ui-1_email-85"></i></span>
                          </div>
                          <input type="text" class="form-control" placeholder="Email Name...">
                        </div>
                      </div>
                      <div class="col-sm-4">
                        <button type="button" class="btn btn-primary btn-round btn-block">Subscribe</button>
                      </div>
                    </div>
                  </form>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <footer class="footer" data-background-color="black">
      <div class="container">
        <div class="content">
          <div class="row">
            <div class="col-md-2">
              <h5>About Us</h5>
              <ul class="links-vertical">
                <li>
                  <a href="#pablo" class="text-muted">
                    Blog
                  </a>
                </li>
                <li>
                  <a href="#pablo" class="text-muted">
                    About Us
                  </a>
                </li>
                <li>
                  <a href="#pablo" class="text-muted">
                    Presentation
                  </a>
                </li>
                <li>
                  <a href="#pablo" class="text-muted">
                    Contact Us
                  </a>
                </li>
              </ul>
            </div>
            <div class="col-md-2">
              <h5>Market</h5>
              <ul class="links-vertical">
                <li>
                  <a href="#pablo" class="text-muted">
                    Sales FAQ
                  </a>
                </li>
                <li>
                  <a href="#pablo" class="text-muted">
                    How to Register
                  </a>
                </li>
                <li>
                  <a href="#pablo" class="text-muted">
                    Sell Goods
                  </a>
                </li>
                <li>
                  <a href="#pablo" class="text-muted">
                    Receive Payment
                  </a>
                </li>
                <li>
                  <a href="#pablo" class="text-muted">
                    Transactions Issues
                  </a>
                </li>
                <li>
                  <a href="#pablo" class="text-muted">
                    Affiliates Program
                  </a>
                </li>
              </ul>
            </div>
            <div class="col-md-4">
              <h5>Social Feed</h5>
              <div class="social-feed">
                <div class="feed-line">
                  <i class="fab fa-twitter"></i>
                  <p>How to handle ethical disagreements with your clients.</p>
                </div>
                <div class="feed-line">
                  <i class="fab fa-twitter"></i>
                  <p>The tangible benefits of designing at 1x pixel density.</p>
                </div>
                <div class="feed-line">
                  <i class="fab fa-facebook-square"></i>
                  <p>A collection of 25 stunning sites that you can use for inspiration.</p>
                </div>
              </div>
            </div>
            <div class="col-md-4">
              <h5>Follow Us</h5>
              <ul class="social-buttons">
                <li>
                  <a href="#pablo" class="btn btn-icon btn-neutral btn-twitter btn-round">
                    <i class="fab fa-twitter"></i>
                  </a>
                </li>
                <li>
                  <a href="#pablo" class="btn btn-icon btn-neutral btn-facebook btn-round">
                    <i class="fab fa-facebook-square"></i>
                  </a>
                </li>
                <li>
                  <a href="#pablo" class="btn btn-icon btn-neutral btn-dribbble btn-round">
                    <i class="fab fa-dribbble"></i>
                  </a>
                </li>
                <li>
                  <a href="#pablo" class="btn btn-icon btn-neutral btn-google btn-round">
                    <i class="fab fa-google-plus"></i>
                  </a>
                </li>
                <li>
                  <a href="#pablo" class="btn btn-icon btn-neutral btn-instagram btn-round">
                    <i class="fab fa-instagram"></i>
                  </a>
                </li>
              </ul>
              <h5>
                <small>Numbers Don't Lie</small>
              </h5>
              <h5>14.521
                <small class="text-muted">Freelancers</small>
              </h5>
              <h5>1.423.183
                <small class="text-muted">Transactions</small>
              </h5>
            </div>
          </div>
        </div>
        <hr />
        <div class="copyright" id="copyright">
          &copy;
          <script>
            document.getElementById('copyright').appendChild(document.createTextNode(new Date().getFullYear()))
          </script>, Designed by
          <a href="https://www.invisionapp.com" target="_blank">Invision</a>. Coded by
          <a href="https://www.creative-tim.com" target="_blank">Creative Tim</a>.
        </div>
      </div>
    </footer>
  </div>


<!-- Collapse Bootstrap -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<!--   Core JS Files   -->
  <script src="${pageContext.request.contextPath}/user-js/core/jquery.min.js" type="text/javascript"></script>
  <script src="${pageContext.request.contextPath}/user-js/core/popper.min.js" type="text/javascript"></script>
  <script src="${pageContext.request.contextPath}/user-js/core/bootstrap.min.js" type="text/javascript"></script>
  <!--  Plugin for Switches, full documentation here: http://www.jque.re/plugins/version3/bootstrap.switch/ -->
  <script src="${pageContext.request.contextPath}/user-js/plugins/bootstrap-switch.js"></script>
  <!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
  <script src="${pageContext.request.contextPath}/user-js/plugins/nouislider.min.js" type="text/javascript"></script>
  <!--  Plugin for the DatePicker, full documentation here: https://github.com/uxsolutions/bootstrap-datepicker -->
  <script src="${pageContext.request.contextPath}/user-js/plugins/moment.min.js"></script>
  <!--	Plugin for Tags, full documentation here: https://github.com/bootstrap-tagsinput/bootstrap-tagsinputs  -->
  <script src="${pageContext.request.contextPath}/user-js/plugins/bootstrap-tagsinput.js"></script>
  <!--	Plugin for Select, full documentation here: http://silviomoreto.github.io/bootstrap-select -->
  <script src="${pageContext.request.contextPath}/user-js/plugins/bootstrap-selectpicker.js" type="text/javascript"></script>
  <!--  Plugin for the DateTimePicker, full documentation here: https://eonasdan.github.io/bootstrap-datetimepicker/ -->
  <script src="${pageContext.request.contextPath}/user-js/plugins/bootstrap-datetimepicker.js" type="text/javascript"></script>
  <!--  Google Maps Plugin    -->
  <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
  <!-- Control Center for Now Ui Kit: parallax effects, scripts for the example pages etc -->
  <script src="${pageContext.request.contextPath}/user-js/now-ui-kit.js?v=1.3.1" type="text/javascript"></script>
</body>
</html>