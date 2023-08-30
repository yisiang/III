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
</head>

<body class="ecommerce-page sidebar-collapse">

  <!-- Navbar -->
	<jsp:include page="../UserNavBar.jsp"></jsp:include>
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
            <div class="page-header-image" style="background-image: url('${pageContext.request.contextPath}/images/大背景4.jpg');height:500px"></div>
            <div class="content-center text-center">
              <div class="row">
                <div class="col-md-8 ml-auto mr-auto">
                  <h1 class="title">最舒適的用品都在這裡</h1>
                  <h4 class="description text-white"></h4>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="carousel-item active">
          <div class="page-header header-filter">
            <div class="page-header-image" style="background-image: url('${pageContext.request.contextPath}/images/大背景2.jpg');height:500px"></div>
            <div class="content-center">
              <div class="row">
                <div class="col-md-8 ml-auto mr-auto text-center">
                  <h1 class="title">尋找最新鮮的食物</h1>
                  <h4 class="description text-white"></h4>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="carousel-item">
          <div class="page-header header-filter">
            <div class="page-header-image" style="background-image: url('${pageContext.request.contextPath}/images/大背景3.jpg');height:500px"></div>
            <div class="content-center text-center">
              <div class="row">
                <div class="col-md-8 ml-auto mr-auto">
                  <h1 class="title">最精美的產品</h1>
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
          <h2 class="section-title">找找看你想要些什麼</h2>
          <form action="${pageContext.request.contextPath}/searchproduct">
          <div style="display: flex; justify-content:flex-end;">
          	<input type="text" placeholder="請輸入關鍵字" name="prodName"/>
          	<button type="submit">搜尋</button>
          </div>
          </form>
          <div class="row">
            <div class="col-md-3"> <!-- 條件篩選 -->
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

                    <div class="card-header" role="tab" id="headingfour" style="background-color:#F19A87">
                      <h6>
                        <a class="collapsed" style="color:white;font-size:1.1em">
                          狗狗商品
<!--                           <i class="now-ui-icons arrows-1_minimal-down pull-right"></i> -->
                        </a>
                      </h6>
                    </div>

                  <div class="card card-refine card-plain" >  <!-- 每一個card-refine -->
                    <div class="card-header" role="tab" id="headingTwo">
                      <h6>
                        <a class="collapsed" href="${pageContext.request.contextPath}/productlist?category=飼料&petkind=狗">
                          狗狗飼料
						<i class="now-ui-icons arrows-1_minimal-right pull-right"></i>
                        </a>
                      </h6>
                    </div>
                  </div>
                  <div class="card card-refine card-plain">
                    <div class="card-header" role="tab" id="headingThree">
                      <h6>
                        <a class="collapsed" href="${pageContext.request.contextPath}/productlist?category=罐頭&petkind=狗">
                          狗狗罐頭
                          <i class="now-ui-icons arrows-1_minimal-right pull-right"></i>
                        </a>
                      </h6>
                    </div>
                  </div>
                  <div class="card card-refine card-plain">
                    <div class="card-header" role="tab" id="headingfour">
                      <h6>
                        <a class="collapsed" href="${pageContext.request.contextPath}/productlist?category=零食&petkind=狗">
                          狗狗零食
                          <i class="now-ui-icons arrows-1_minimal-right pull-right"></i>
                        </a>
                      </h6>
                    </div>
                  </div>
                  <div class="card card-refine card-plain">
                    <div class="card-header" role="tab" id="headingfour">
                      <h6>
                        <a class="collapsed" href="${pageContext.request.contextPath}/productlist?category=用品&petkind=狗">
                          狗狗用品
                          <i class="now-ui-icons arrows-1_minimal-right pull-right"></i>
                        </a>
                      </h6>
                    </div>
                  </div>
                  
                  <div class="card-header" role="tab" id="headingfour" style="background-color:#F19A87">
                      <h6>
                        <a class="collapsed" style="color:white;font-size:1.1em">
                          貓貓商品
<!--                           <i class="now-ui-icons arrows-1_minimal-down"></i> -->
                        </a>
                      </h6>
                    </div>
                  <div class="card card-refine card-plain">
                    <div class="card-header" role="tab" id="headingfour">
                      <h6>
                        <a class="collapsed" href="${pageContext.request.contextPath}/productlist?category=飼料&petkind=貓">
                          貓貓飼料
                          <i class="now-ui-icons arrows-1_minimal-right pull-right"></i>
                        </a>
                      </h6>
                    </div>
                  </div>
                  <div class="card card-refine card-plain">
                    <div class="card-header" role="tab" id="headingfour">
                      <h6>
                        <a class="collapsed" href="${pageContext.request.contextPath}/productlist?category=罐頭&petkind=貓">
                          貓貓罐頭
                          <i class="now-ui-icons arrows-1_minimal-right pull-right"></i>
                        </a>
                      </h6>
                    </div>
                  </div>
                  <div class="card card-refine card-plain">
                    <div class="card-header" role="tab" id="headingfour">
                      <h6>
                        <a class="collapsed" href="${pageContext.request.contextPath}/productlist?category=零食&petkind=貓">
                          貓貓零食
                          <i class="now-ui-icons arrows-1_minimal-right pull-right"></i>
                        </a>
                      </h6>
                    </div>
                  </div>
                  <div class="card card-refine card-plain">
                    <div class="card-header" role="tab" id="headingfour">
                      <h6>
                        <a class="collapsed" href="${pageContext.request.contextPath}/productlist?category=用品&petkind=貓">
                          貓貓用品
                          <i class="now-ui-icons arrows-1_minimal-right pull-right"></i>
                        </a>
                      </h6>
                    </div>
                  </div>
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
            <div class="col-md-9">
              <div class="row">
            <c:forEach items="${productList}" var="products">
                <div class="col-lg-4 col-md-6 productcard" data-tags=${products.category},${products.petkind}>                <!-- 每一個產品 -->
                  <div class="card card-product card-plain" style="border-radius: 10%;box-shadow:0px 0px 4px #FFAC55"> <!-- border:1px #FFAC55 solid;border-radius: 10%; -->
                    <div class="card-image"  style="width:180px;height:180px">
                      <a href="${pageContext.request.contextPath}/productdetail?prodId=${products.prodId}&category=${products.category}&petkind=${products.petkind}">
                        <img src="${products.prodImg }" alt="..." />
                      </a>
                    </div>
                    <div class="card-body">
                      <a href="${pageContext.request.contextPath}/productdetail?prodId=${products.prodId}&category=${products.category}&petkind=${products.petkind}">
                        <h4 class="card-title" style="height:78.75px">${products.prodName }</h4> <!-- 固定高度 -->
                      </a>
<!--                       <p class="card-description"> -->
<%--                         ${products.descript } --%>
<!--                       </p> -->
                      <div class="card-footer" style="text-align: center">
                        <div class="price-container">
                          <span class="price text-info"> NT ${products.price }</span>
                        </div>
                        
                        <!-- 加入購物車 -->
                        <form action="${pageContext.request.contextPath}/shop/insertIntoCart" method="post">
                        <input type="hidden" name="qty" value="1"/>
                         <input type="hidden" name="price" value="${products.price}" />
                         <input type="hidden" name="from" value="productUserForm" />
	 					<input type="hidden" name="prodId" value="${products.prodId}" />
                        <button class="btn btn-danger btn-neutral btn-round btn-icon pull-right addcart" type="submit">
       				       <i class="now-ui-icons shopping_cart-simple"></i>
                        </button>
                         </form>
                        
                        <!-- 加入收藏 -->
                        <form action="${pageContext.request.contextPath}/clicklike">
                          <input type="hidden" name="prodId" value="${products.prodId }" />
                          <button class="btn btn-danger btn-neutral btn-icon btn-round pull-right like" type="submit" rel="tooltip" data-placement="left">
                            <i class="now-ui-icons ui-2_favourite-28"></i>
                          </button>
                        </form>
                        
<%--                        <form action="insertIntoCart" method="post"> --%>
	 					
<!-- 	 					<input type="hidden" name="custId" value="123"/> -->
<%-- 	 					<input type="hidden" name="price" value="${product.price}" /> --%>
<%-- 	 					<input type="hidden" name="prodId" value="${product.prodId}" /> --%>
			
<!-- 	 					<button type="submit" class="btn btn-primary mr-3 btn-neutral">加入購物車 &nbsp;<i class="now-ui-icons shopping_cart-simple"></i></button> -->
	 		           
<%-- 	 		           </form> --%>
<%-- 	 		           <form action="insertIntoCart" method="post"> --%>
	 					
<!-- 	 					<input type="hidden" name="custId" value="123"/> -->
<%-- 	 					<input type="hidden" name="price" value="${product.price}" /> --%>
<%-- 	 					<input type="hidden" name="prodId" value="${product.prodId}" /> --%>
			
<!-- 	 					<button type="submit" class="btn btn-primary mr-3 btn-neutral">立即結帳 &nbsp;<i class="now-ui-icons shopping_cart-simple"></i></button> -->
<%-- 	 		           </form> --%>
                      </div>
                    </div>
                  </div>
                  <!-- end card -->
                </div>
                </c:forEach>

                </div>
<!--                 <div class="col-md-3 ml-auto mr-auto"> -->
<!--                   <button rel="tooltip" class="btn btn-primary btn-round">Load more...</button> -->
<!--                 </div> -->

                <!-- load more -->
                <div class="col-md-3 ml-auto mr-auto">
                  <button href="#" id="loadMore" rel="tooltip" class="btn btn-primary btn-round">點擊讀取更多...</button>
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
      <div class="section">
        <div class="container">
          <h2 class="section-title">熱門商品</h2>
          <div class="row">
          <c:forEach items="${hot }" var="hotpd">
            <div class="col-md-4">
              <div class="card card-product card-plain" style="border:1px #FFAC55 solid;border-radius: 10%;box-shadow:0px 0px 4px #FFAC55">
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

			</c:forEach>
          </div>
        </div>
      </div>
    </div>
  </div>
  
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
		e.preventDefault();
		let formid =$(this).parent();
			Swal.fire({
				  icon: 'success',
				  title: '已加入購物車'
				}).then(function(){
				$(formid).submit();
					});
    });
    

    //addlike
    $('.like').click(function(e){


		e.preventDefault();
		let formid =$(this).parent();
			Swal.fire({
				  icon: 'success',
				  title: '已加入收藏'
				}).then(function(){
				$(formid).submit();
					});


    });

    
  </script>

</body>
</html>