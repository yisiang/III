<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
<!--   <link rel="pet" sizes="76x76" href="/images/logo3.png"> -->
  <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/images/favicon-32x32.png">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>ProductUserForm</title>
  <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
  <!--     Fonts and icons     -->
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200|Open+Sans+Condensed:700" rel="stylesheet">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" rel="stylesheet" />
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
  <!-- CSS Files -->
  <link href="${pageContext.request.contextPath}/usercss/bootstrap.min.css" rel="stylesheet" />
   <link href="${pageContext.request.contextPath}/css/animate.css" rel="stylesheet" />
  <link href="${pageContext.request.contextPath}/usercss/now-ui-kit.css?v=1.3.1" rel="stylesheet" />
  
  <!--jquery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
        integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!-- sweetalert2 -->
<!-- <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script> -->



  
  <!-- 自定義中間背景紗窗 -->
  <style type="text/css"> 
  	.card-background:after {
  		width:0%;
  	}
  </style>
  
  <!-- 條件篩選字體 -->
  <style>
  h6, .h6 {
    font-size: 1.3em;
    font-weight: 700;
    text-transform: uppercase;
  }
  </style>
  
  <!--loadmore 返回top  -->
  <style>
    .productcard{
 		display:none;    
    }
    .totop {
    position: fixed;
    bottom: 10px;
    right: 20px;
    opacity: 0.5;
    }
    .totop a {
/*     display: none; */
    }
	a:hover {
    text-decoration: none;
	}

  </style>
  
  <!-- 圖片移上放大 -->
  <style>
  .card-image{width:500px; height:350px;overflow:hidden;}
  .card-image img{transform:scale(1,1);transition: all 0.5s ease-out;}
  .card-image img:hover{transform:scale(1.2,1.2);}

  </style>
  
  <style>
/*   #preloader {/*   這是整個會蓋住畫面的底色色塊  */ */
/*   position: fixed; */
/*   width: 100%; */
/*   height: 100%; */
/*   left: 0%; */
/*   top: 0%; */
/*   background-color: #fff; */
/*   z-index: 9999; */
/* } */
/* #status {/*   這是中間loading的gif坐標css,我們盡量讓他畫面置中  */ */
/*   position: fixed; */
/*   width: 218px; */
/*   height: 419px; */
/*   margin-left: -140px; */
/*   margin-top: -160px; */
/*   left: 50%; */
/*   top: 50%; */
/* } */
  </style>
</head>

<body class="ecommerce-page sidebar-collapse">

<div id="preloader">
  
<!-- <div class="animateContainer"> -->
<!-- 			<div class="animateWrapper"> -->
<!-- 				<div class="ballons"> -->
<!-- 					<div class="heart"> -->
<!-- 						<span></span> -->
<!-- 						<span></span> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<div class="animal"> -->
<!-- 					<div class="ears"></div> -->
<!-- 					<div class="animatebody"> -->
<!-- 						<div class="eyes"></div> -->
<!-- 						<div class="nose"> -->
<!-- 							<span></span> -->
<!-- 							<span></span> -->
<!-- 						</div> -->
<!-- 						<div class="hands"> -->
<!-- 							<div class="left_hand"> -->
<!-- 								<span></span> -->
<!-- 								<span></span> -->
<!-- 							</div> -->
<!-- 							<div class="right_hand"> -->
<!-- 								<span></span> -->
<!-- 								<span></span> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					<div class="legs"> -->
<!-- 						<span></span> -->
<!-- 						<span></span> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
    
<!--   </div> -->

  <!-- Navbar -->
	<jsp:include page="UserNavBar.jsp"></jsp:include>
  <!-- End Navbar -->
  
  <div class="wrapper">
    <div id="carouselExampleIndicators" style="height:500px" class="carousel slide"> <!-- 圖片牆 -->
      <ol class="carousel-indicators">
        <li data-target="#carouselExampleIndicators" data-slide-to="0" class=""></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="1" class="active"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="2" class=""></li>
      </ol>
      <div class="carousel-inner" role="listbox">
        <div class="carousel-item">
          <div class="page-header header-filter">
            <div class="page-header-image" style="background-image: url('${pageContext.request.contextPath}/images/nutrition.jpeg');height:500px"></div>
            <div class="content-center text-center">
              <div class="row">
                <div class="col-md-8 ml-auto mr-auto">
                <a href="${pageContext.request.contextPath}/articles"><h1 class="title">寵物奶對貓狗有哪些好處</h1></a>
                  
                  <h4 class="description text-white"></h4>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="carousel-item active">
          <div class="page-header header-filter">
          	<a href="${pageContext.request.contextPath}/activities/activity.bulletin">
            <div class="page-header-image" style="background-image: url('${pageContext.request.contextPath}/img/ActImg/img8.jpg');height:500px"></div>
            <div class="content-center">
              <div class="row">
                <div class="col-md-8 ml-auto mr-auto text-center">
                  <h1 class="title">毛孩與我 寵物拍攝活動</h1>
                  <h4 class="description text-white"></h4>
                </div>
              </div>
            </div>
            </a>
          </div>
        </div>
        <div class="carousel-item">
          <div class="page-header header-filter">
            <div class="page-header-image" style="background-image: url('${pageContext.request.contextPath}/img/ActImg/img14.jpg');height:500px"></div>
            <div class="content-center text-center">
              <div class="row">
                <div class="col-md-8 ml-auto mr-auto">
                  
                  <h4 class="description text-white"></h4>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
        <i class="now-ui-icons arrows-1_minimal-left"></i>
      </a>
      <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
        <i class="now-ui-icons arrows-1_minimal-right"></i>
      </a>
    </div>
    
  <!-- ======================================================================== -->   
    <div class="main"> 
      <div class="section">
        <div class="container">
          <div class="row">
<!--             <div class="col-md-3"> 條件篩選 -->
              <div class="collapse-panel">
                <div class="card-body">
                
<!--                   <div class="card card-refine card-plain"> -->
<!--                     <h4 class="card-title"> -->
<!--                       Refine -->
<!--                       <button class="btn btn-default btn-icon btn-neutral pull-right" rel="tooltip" title="Reset Filter"> -->
<!--                         <i class="arrows-1_refresh-69 now-ui-icons"></i> -->
<!--                       </button> -->
<!--                     </h4> -->
<!--                     <div class="card-header" role="tab" id="headingOne"> -->
<!--                       <h6 class="mb-0"> -->
<!--                         <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne"> -->
<!--                           價格範圍 -->
<!--                           <i class="now-ui-icons arrows-1_minimal-down"></i> -->
<!--                         </a> -->
<!--                       </h6> -->
<!--                     </div> -->
<!--                     <div id="collapseOne" class="collapse show" role="tabpanel" aria-labelledby="headingOne"> -->
<!--                       <div class="card-body"> -->
<!--                         <span id="price-left" class="price-left pull-left" data-currency="NT">100</span> -->
<!--                         <span id="price-right" class="price-right pull-right" data-currency="NT">850</span> -->
<!--                         <div class="clearfix"></div> -->
<!--                         <div id="sliderRefine" class="slider slider-refine"></div> -->
<!--                       </div> -->
<!--                     </div> -->
<!--                   </div> -->

                  <!-- ================ -->
				  <!-- Filter Controls -->
<!-- 						<span data-filter>All</span> -->
<!-- 						<span data-filter="飼料">飼料</span> -->
<!-- 						<span data-filter="狗">狗</span> -->
<!-- 						<span data-filter="貓">貓</span> -->
<!-- 						<span data-filter="罐頭">罐頭</span> -->
<!-- 						<span data-filter="零食">零食</span> -->
<!-- 						<span data-filter="用品">用品</span> -->
						<!-- Filterable Items -->
<!-- 						<div data-tags="js,css"><a href="https://www.jqueryscript.net/tags.php?/Bootstrap/">Bootstrap</a></div> -->
<!-- 						<div data-tags="js">Angular</div> -->
<!-- 						<div data-tags="html,css">TailwindCSS</div> -->
<!-- 						<div data-tags="js">jQuery</div> -->
<!-- 						<div data-tags="js,html">React.js</div> -->
<!-- 						<div data-tags="js">Vue.js</div> -->
                </div>
              </div>
            </div>
<!-- ======================================================================== -->              
<!--             <div class="col-md-9"> -->
<!--               <div class="row"> -->
      <div class="section">
        <div class="container">
          <h2 class="section-title">熱門商品</h2>
          <div class="row">
          <c:forEach items="${hot }" var="hotpd">
            <div class="col-md-4">
              <div class="card card-product card-plain" style="border:1px #FFAC55 solid;border-radius: 10%">
                <div class="card-image" style="height: 210px">
                  <a href="${pageContext.request.contextPath}/productdetail?prodId=${hotpd.product.prodId}&category=${hotpd.product.category}&petkind=${hotpd.product.petkind}">
                   <img class="img rounded" src="${hotpd.product.prodImg }" />
                  </a>
                </div>
                <div class="card-body">
                <h6 class="category text-danger">Trending</h6>
                  <h4 class="card-title" style="height: 52px">
                    <a href="${pageContext.request.contextPath}/productdetail?prodId=${hotpd.product.prodId}&category=${hotpd.product.category}&petkind=${hotpd.product.petkind}">
                    ${hotpd.product.prodName }
                    </a>
                  </h4>
                  <p class="card-description"></p>
                  <div class="card-footer" style="text-align:center">
                    <div class="price-container">
<!--                       <span class="price price-old"> &euro;1,430</span> -->
                      <span class="price price-new"> NT ${hotpd.product.price }</span>
                    </div>
<!--                     <div class="stats stats-right"> -->
<!--                       <button type="button" rel="tooltip" title="" class="btn btn-icon btn-neutral" data-original-title="Saved to Wishlist"> -->
<!--                         <i class="now-ui-icons ui-2_favourite-28"></i> -->
<!--                       </button> -->
<!--                     </div> -->
                  </div>
                </div>
              </div>
            </div>
<!--             <div class="col-md-4"> -->
<!--               <div class="card card-product card-plain"> -->
<!--                 <div class="card-image"> -->
<%--                   <img class="img rounded" src="${pageContext.request.contextPath}/img/saint-laurent.jpg" /> --%>
<!--                 </div> -->
<!--                 <div class="card-body"> -->
<!--                   <h4 class="card-title"> -->
<!--                     <h4 class="card-title">Saint Laurent</h4> -->
<!--                   </h4> -->
<!--                   <p class="card-description">The structured shoulders and sleek detailing ensure a sharp silhouette. Team it with a silk pocket square and leather loafers.</p> -->
<!--                   <div class="card-footer"> -->
<!--                     <div class="price-container"> -->
<!--                       <span class="price price-old"> &euro;1,430</span> -->
<!--                       <span class="price price-new">&euro;743</span> -->
<!--                     </div> -->
<!--                     <div class="stats stats-right"> -->
<!--                       <button type="button" rel="tooltip" title="" class="btn btn-icon btn-neutral" data-original-title="Saved to Wishlist"> -->
<!--                         <i class="now-ui-icons ui-2_favourite-28"></i> -->
<!--                       </button> -->
<!--                     </div> -->
<!--                   </div> -->
<!--                 </div> -->
<!--               </div> -->
<!--             </div> -->
<!--             <div class="col-md-4"> -->
<!--               <div class="card card-product card-plain"> -->
<!--                 <div class="card-image"> -->
<%--                   <img class="img rounded" src="${pageContext.request.contextPath}/img/gucci.jpg" /> --%>
<!--                 </div> -->
<!--                 <div class="card-body"> -->
<!--                   <h4 class="card-title"> -->
<!--                     <h4 class="card-title">Gucci</h4> -->
<!--                   </h4> -->
<!--                   <p class="card-description">The smooth woven-wool is water resistant to ensure you stay pristine after a long-haul flight. Cut in a trim yet comfortable regular fit.</p> -->
<!--                   <div class="card-footer"> -->
<!--                     <div class="price-container"> -->
<!--                       <span class="price price-old"> &euro;2,430</span> -->
<!--                       <span class="price price-new">&euro;890</span> -->
<!--                     </div> -->
<!--                     <div class="stats stats-right"> -->
<!--                       <button type="button" rel="tooltip" title="" class="btn btn-icon btn-neutral btn-default" data-original-title="Add to Wishlist"> -->
<!--                         <i class="now-ui-icons ui-2_favourite-28"></i> -->
<!--                       </button> -->
<!--                     </div> -->
<!--                   </div> -->
<!--                 </div> -->
<!--               </div> -->
<!--             </div> -->
			</c:forEach>
          </div>
        </div>
      </div>
<!--                 <div class="col-lg-4 col-md-6"> -->
<!--                   <div class="card card-product card-plain"> -->
<!--                     <div class="card-image"> -->
<!--                       <a href="#"> -->
<!--                         <img src="../assets/img/tom-ford.jpg" alt="..." /> -->
<!--                       </a> -->
<!--                     </div> -->
<!--                     <div class="card-body"> -->
<!--                       <a href="#"> -->
<!--                         <h4 class="card-title">Tom Ford</h4> -->
<!--                       </a> -->
<!--                       <p class="card-description"> -->
<!--                         Immaculate tailoring is TOM FORD's forte. -->
<!--                       </p> -->
<!--                       <div class="card-footer"> -->
<!--                         <div class="price-container"> -->
<!--                           <span class="price"> &euro; 879</span> -->
<!--                         </div> -->
<!--                         <button class="btn btn-neutral btn-icon btn-round pull-right" rel="tooltip" title="Add to wishlist" data-placement="left"> -->
<!--                           <i class="now-ui-icons ui-2_favourite-28"></i> -->
<!--                         </button> -->
<!--                       </div> -->
<!--                     </div> -->
<!--                   </div> -->
<!--                   end card -->
<!--                 </div> -->
<!--                 <div class="col-lg-4 col-md-6"> -->
<!--                   <div class="card card-product card-plain"> -->
<!--                     <div class="card-image"> -->
<!--                       <a href="#"> -->
<!--                         <img src="../assets/img/wooyoungmi.jpg" alt="..." /> -->
<!--                       </a> -->
<!--                     </div> -->
<!--                     <div class="card-body"> -->
<!--                       <a href="#"> -->
<!--                         <h4 class="card-title">Wooyoungmi</h4> -->
<!--                       </a> -->
<!--                       <p class="card-description"> -->
<!--                         Dark-grey slub wool, pintucked notch lapels. -->
<!--                       </p> -->
<!--                       <div class="card-footer"> -->
<!--                         <div class="price-container"> -->
<!--                           <span class="price">&euro; 555</span> -->
<!--                         </div> -->
<!--                         <button class="btn btn-neutral btn-icon btn-round pull-right" rel="tooltip" title="Add to wishlist" data-placement="left"> -->
<!--                           <i class="now-ui-icons ui-2_favourite-28"></i> -->
<!--                         </button> -->
<!--                       </div> -->
<!--                     </div> -->
<!--                   </div> -->
<!--                   end card -->
<!--                 </div> -->
<!--                 <div class="col-lg-4 col-md-6"> -->
<!--                   <div class="card card-product card-plain"> -->
<!--                     <div class="card-image"> -->
<!--                       <a href="#"> -->
<!--                         <img src="../assets/img/sweeney.jpg" alt="..." /> -->
<!--                       </a> -->
<!--                     </div> -->
<!--                     <div class="card-body"> -->
<!--                       <a href="#"> -->
<!--                         <h4 class="card-title">Thom Sweeney</h4> -->
<!--                       </a> -->
<!--                       <p class="card-description"> -->
<!--                         It's made from lightweight grey wool woven. -->
<!--                       </p> -->
<!--                       <div class="card-footer"> -->
<!--                         <div class="price-container"> -->
<!--                           <span class="price"> &euro; 680</span> -->
<!--                         </div> -->
<!--                         <button class="btn btn-neutral btn-icon btn-round pull-right" rel="tooltip" title="Add to wishlist" data-placement="left"> -->
<!--                           <i class="now-ui-icons ui-2_favourite-28"></i> -->
<!--                         </button> -->
<!--                       </div> -->
<!--                     </div> -->
<!--                   </div> -->
<!--                   end card -->
<!--                 </div> -->
<!--                 <div class="col-lg-4 col-md-6"> -->
<!--                   <div class="card card-product card-plain"> -->
<!--                     <div class="card-image"> -->
<!--                       <a href="#"> -->
<!--                         <img src="../assets/img/kingsman.jpg" alt="..." /> -->
<!--                       </a> -->
<!--                     </div> -->
<!--                     <div class="card-body"> -->
<!--                       <a href="#"> -->
<!--                         <h4 class="card-title">Kingsman</h4> -->
<!--                       </a> -->
<!--                       <p class="card-description"> -->
<!--                         Crafted from khaki cotton and fully canvassed. -->
<!--                       </p> -->
<!--                       <div class="card-footer"> -->
<!--                         <div class="price-container"> -->
<!--                           <span class="price"> &euro; 725</span> -->
<!--                         </div> -->
<!--                         <button class="btn btn-neutral btn-icon btn-round pull-right" rel="tooltip" title="Remove from wishlist" data-placement="left"> -->
<!--                           <i class="now-ui-icons ui-2_favourite-28"></i> -->
<!--                         </button> -->
<!--                       </div> -->
<!--                     </div> -->
<!--                   </div> -->
<!--                   end card -->
<!--                 </div> -->
<!--                 <div class="col-lg-4 col-md-6"> -->
<!--                   <div class="card card-product card-plain"> -->
<!--                     <div class="card-image"> -->
<!--                       <a href="#"> -->
<!--                         <img src="../assets/img/boglioli.jpg" alt="..." /> -->
<!--                       </a> -->
<!--                     </div> -->
<!--                     <div class="card-body"> -->
<!--                       <a href="#"> -->
<!--                         <h4 class="card-title">Boglioli</h4> -->
<!--                       </a> -->
<!--                       <p class="card-description"> -->
<!--                         Masterfully crafted in Northern Italy. -->
<!--                       </p> -->
<!--                       <div class="card-footer"> -->
<!--                         <div class="price-container"> -->
<!--                           <span class="price">&euro; 699</span> -->
<!--                         </div> -->
<!--                         <button class="btn btn-neutral btn-icon btn-round pull-right" rel="tooltip" title="Add to wishlist" data-placement="left"> -->
<!--                           <i class="now-ui-icons ui-2_favourite-28"></i> -->
<!--                         </button> -->
<!--                       </div> -->
<!--                     </div> -->
<!--                   </div> -->
<!--                   end card -->
                </div>
<!--                 <div class="col-md-3 ml-auto mr-auto"> -->
<!--                   <button rel="tooltip" class="btn btn-primary btn-round">Load more...</button> -->
<!--                 </div> -->

                <!-- load more -->
                <div   class="col-md-3 ml-auto mr-auto">
                  <button style="margin-left : 82.356px"  onclick="location.href='${pageContext.request.contextPath}/productuserform.controller'"class="btn btn-primary btn-round">查看更多商品...</button>
                </div>
                
                <!-- go top -->
                <p class="totop"> 
   				  <a class="btn btn-icon btn-round" href="#top"><i class="now-ui-icons arrows-1_minimal-up"></i></a> 
				</p>
				
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- section -->
<!--       <div class="container"> -->
<!--         <h2 class="section-title">News in fashion</h2> -->
<!--       </div> -->
      <div class="projects-4"> <!-- 中間廣告 -->
        <div class="container-fluid">
          <div class="row">
            <div class="col-md-6 px-0">
              <div class="card card-fashion card-background" style="background-image: url('${pageContext.request.contextPath}/images/廣告.jpg')">
<!--                 <div class="card-body"> -->
<!--                   <div class="card-title text-left"> -->
<!--                     <h2> -->
<!--                       <a href="#pablo"> -->
<!--                         The New York Times Todd Snyder and Raf Simons Party During Men’s Fashion Week -->
<!--                       </a> -->
<!--                     </h2> -->
<!--                   </div> -->
<!--                   <div class="card-footer text-left"> -->
<!--                     <div class="stats"> -->
<!--                       <span> -->
<!--                         <i class="now-ui-icons users_circle-08"></i>Emy Grace -->
<!--                       </span> -->
<!--                       <span> -->
<!--                         <i class="now-ui-icons tech_watch-time"></i> June 6, 2017 -->
<!--                       </span> -->
<!--                     </div> -->
<!--                     <div class="stats-link pull-right"> -->
<!--                       <a href="#pablo" class="footer-link">Fashion Week</a> -->
<!--                     </div> -->
<!--                   </div> -->
<!--                 </div> -->
              </div>
            </div>
            <div class="col-md-6 px-0">
<!--               <div class="card-container"> -->
<!--                 <div class="card card-fashion"> -->
<!--                   <div class="card-title"> -->
<!--                     <a href="#pablo"> -->
<!--                     </a> -->
<!--                     <h4> -->
<!--                       <a href="#pablo"> -->
<!--                       </a> -->
<!--                       <a href="#pablo"> -->
<!--                         Valentina Garavani Holds a Summer Lunch in Honor of Sofia Coppola... -->
<!--                       </a> -->
<!--                     </h4> -->
<!--                   </div> -->
<!--                   <div class="card-body"> -->
<!--                     <div class="card-footer text-left"> -->
<!--                       <div class="stats"> -->
<!--                         <span> -->
<!--                           <i class="now-ui-icons users_circle-08"></i>Jerry McGregor -->
<!--                         </span> -->
<!--                         <span> -->
<!--                           <i class="now-ui-icons tech_watch-time"></i> June 10, 2017 -->
<!--                         </span> -->
<!--                       </div> -->
<!--                     </div> -->
<!--                   </div> -->
<!--                 </div> -->
                <div class="card card-fashion card-background" style="background-image: url('${pageContext.request.contextPath}/images/廣告2.jpg')">
                </div>
<!--               </div> -->
            </div>
          </div>
        </div>
      </div>
<!-- ======================================================================== -->    



<!--   Core JS Files   -->
  <script src="${pageContext.request.contextPath}/userjs/core/jquery.min.js" type="text/javascript"></script>
  <script src="${pageContext.request.contextPath}/userjs/core/popper.min.js" type="text/javascript"></script>
  <script src="${pageContext.request.contextPath}/userjs/core/bootstrap.min.js" type="text/javascript"></script>
  <!--  Plugin for Switches, full documentation here: http://www.jque.re/plugins/version3/bootstrap.switch/ -->
  <script src="${pageContext.request.contextPath}/userjs/plugins/bootstrap-switch.js"></script>
  <!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
  <script src="${pageContext.request.contextPath}/userjs/plugins/nouislider.min.js" type="text/javascript"></script>
  <!--  Plugin for the DatePicker, full documentation here: https://github.com/uxsolutions/bootstrap-datepicker -->
  <script src="${pageContext.request.contextPath}/userjs/plugins/moment.min.js"></script>
  <!--	Plugin for Tags, full documentation here: https://github.com/bootstrap-tagsinput/bootstrap-tagsinputs  -->
  <script src="${pageContext.request.contextPath}/userjs/plugins/bootstrap-tagsinput.js"></script>
  <!--	Plugin for Select, full documentation here: http://silviomoreto.github.io/bootstrap-select -->
  <script src="${pageContext.request.contextPath}/userjs/plugins/bootstrap-selectpicker.js" type="text/javascript"></script>
  <!--  Plugin for the DateTimePicker, full documentation here: https://eonasdan.github.io/bootstrap-datetimepicker/ -->
  <script src="${pageContext.request.contextPath}/userjs/plugins/bootstrap-datetimepicker.js" type="text/javascript"></script>
  <!--  Google Maps Plugin    -->
  <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
  <!-- Control Center for Now Ui Kit: parallax effects, scripts for the example pages etc -->
  <script src="${pageContext.request.contextPath}/userjs/now-ui-kit.js?v=1.3.1" type="text/javascript"></script>
  
    <!--  Plugin for Sweet Alert -->
  <script src="${pageContext.request.contextPath}/js/plugins/sweetalert2.min.js"></script>
<!-- filter -->
<script src="${pageContext.request.contextPath}/userjs/autofilter.js"></script>
  <script>
  var domainName = '/dinero';
  
    $(document).ready(function() {

//     	//價格篩選
//       var slider2 = document.getElementById('sliderRefine');

//       noUiSlider.create(slider2, {
//         start: [42, 880],
//         connect: true,
//         range: {
//           'min': [30],
//           'max': [900]
//         }
//       });

//       var limitFieldMin = document.getElementById('price-left');
//       var limitFieldMax = document.getElementById('price-right');

//       slider2.noUiSlider.on('update', function(values, handle) {
//         if (handle) {
//           limitFieldMax.innerHTML = $('#price-right').data('currency') + Math.round(values[handle]);
//         } else {
//           limitFieldMin.innerHTML = $('#price-left').data('currency') + Math.round(values[handle]);
//         }
//       });

// Load more
      $(function () {
    	    $(".productcard").slice(0, 6).show();
    	    $("#loadMore").on('click', function (e) {
    	        e.preventDefault();
    	        $(".productcard:hidden").slice(0, 3).slideDown();
    	        if ($(".productcard:hidden").length == 0) {
    	            $("#load").fadeOut('slow');
    	        }
//     	        $('html,body').animate({
//     	            scrollTop: $(this).offset().top
//     	        }, 1500);
    	    });
    	});

//go top
    	$('a[href=#top]').click(function () {
    	    $('body,html').animate({
    	        scrollTop: 0
    	    }, 600);
    	    return false;
    	});

    	$(window).scroll(function () {
    	    if ($(this).scrollTop() > 50) {
    	        $('.totop a').fadeIn();
    	    } else {
    	        $('.totop a').fadeOut();
    	    }
    	});


    });
  //filter
	$(function($) {
		  $.autofilter({
			  subString:false
				
			});

    });

    //addcart
    $('.addcart').click(function(e){
// 		event.preventDefault();
// 		let formid=$(this).parent();
		console.log($(this));
		/* $.ajax({
			type:'GET',
			url : domainName + '/shop/insertIntoCart',
			contentType:'text/plain ;charset=UTF-8',
			data : {
				"prodId":,
				"price":,
				"qty":1,
			},
			success:function(returnData){

				}
			}) */

			Swal.fire({
				  icon: 'success',
				  title: '已加入購物車'
				});
    });

    //addlike
    $('.like').click(function(e){
// 		event.preventDefault();
// 		let formid=$(this).parent();
		Swal.fire({
			  icon: 'success',
			  title: '已加入收藏'
			});

    });
//     $(window).load(function() { // 確認整個頁面讀取完畢再將這三個div隱藏起來
//         $("#status").delay(5000).fadeOut(3000); //delay --> 延遲幾秒才fadeOut
//         $("#preloader").delay(7000).fadeOut(3000);
//     })
	//$("#status").delay(2000).fadeOut(3000); //delay --> 延遲幾秒才fadeOut
      //  $("#preloader").delay(2000).fadeOut(2000);
    
  </script>

</body>
</html>