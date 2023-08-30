<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<!--   <link rel="pet" sizes="76x76" href="/images/logo3.png"> -->
  <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/images/favicon-32x32.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>ProductDetail</title>
  <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
  <!--     Fonts and icons     -->
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200|Open+Sans+Condensed:700" rel="stylesheet">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" rel="stylesheet" />
  <!-- CSS Files -->
  <link href="${pageContext.request.contextPath}/usercss/bootstrap.min.css" rel="stylesheet" />
  <link href="${pageContext.request.contextPath}/usercss/now-ui-kit.css?v=1.3.1" rel="stylesheet" />
  
  <!--jquery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
        integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

  <!--loadmore 返回top  -->
  <style>
    .totop {
    position: fixed;
    bottom: 10px;
    right: 20px;
    opacity: 0.5;
    }
    .totop a {
/*     display: none; */
    }
/*  	a:hover {  */
/*      text-decoration: none;  */
/*  	}  */

  </style>
  
  <!-- 圖片移上放大 -->
  <style>
  .card-image{width:500px; height:350px;overflow:hidden;}
  .card-image img{transform:scale(1,1);transition: all 0.5s ease-out;}
  .card-image img:hover{transform:scale(1.2,1.2);}
  </style>
</head>
<body class="product-page sidebar-collapse">

  <!-- Navbar -->
  <jsp:include page="../UserNavBar.jsp"></jsp:include>
  <!-- End Navbar -->
  
  <div class="wrapper">
    <div class="page-header page-header-mini"> <!-- 背景牆 -->
      <div class="page-header-image" data-parallax="true" style="background-image: url('${pageContext.request.contextPath}/images/大背景2.jpg');">
      </div>
    </div>
    <div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-5">
            <div id="productCarousel" class="carousel slide" data-ride="carousel" data-interval="8000"> <!-- 輪播圖 -->
              <ol class="carousel-indicators">
                <li data-target="#productCarousel" data-slide-to="0" class="active"></li>
<!--                 <li data-target="#productCarousel" data-slide-to="1"></li> -->
<!--                 <li data-target="#productCarousel" data-slide-to="2"></li> -->
<!--                 <li data-target="#productCarousel" data-slide-to="3"></li> -->
              </ol>
              <div class="carousel-inner" role="listbox">
                <div class="carousel-item active">
                  <img class="d-block img-raised" src="${product.prodImg}" alt="First slide">
                </div>
<!--                 <div class="carousel-item"> -->
<!--                   <img class="d-block img-raised" src="../assets/img/pp-2.jpg" alt="Second slide"> -->
<!--                 </div> -->
<!--                 <div class="carousel-item"> -->
<!--                   <img class="d-block img-raised" src="../assets/img/pp-3.jpg" alt="Third slide"> -->
<!--                 </div> -->
<!--                 <div class="carousel-item"> -->
<!--                   <img class="d-block img-raised" src="../assets/img/pp-4.jpg" alt="Third slide"> -->
<!--                 </div> -->
              </div>
              <a class="carousel-control-prev" href="#productCarousel" role="button" data-slide="prev">
                <button type="button" class="btn btn-primary btn-icon btn-round btn-sm" name="button">
                  <i class="now-ui-icons arrows-1_minimal-left"></i>
                </button>
              </a>
              <a class="carousel-control-next" href="#productCarousel" role="button" data-slide="next">
                <button type="button" class="btn btn-primary btn-icon btn-round btn-sm" name="button">
                  <i class="now-ui-icons arrows-1_minimal-right"></i>
                </button>
              </a>
            </div>
            <p class="blockquote blockquote-primary" style="text-align:center">

              快速出貨<i class="now-ui-icons shopping_delivery-fast"></i>
              <br>
              七天鑑賞期<i class="now-ui-icons ui-1_zoom-bold"></i>
              <br>
              品質保證<i class="now-ui-icons ui-2_like"></i>
              <br>
              <br>
              <small>本產品適用優惠券</small>
            </p>
          </div>
          <div class="col-md-6 ml-auto mr-auto">
            <h2 class="title"> ${product.prodName } </h2>
            <h5 class="category">${product.category }</h5>
            <h2 class="main-price" style="color: #f96332">NT ${product.price }</h2>
            <div id="accordion" role="tablist" aria-multiselectable="true" class="card-collapse">
              <div class="card card-plain">
                <div class="card-header" role="tab" id="headingOne">
                  <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                    商品介紹
                    <i class="now-ui-icons arrows-1_minimal-down"></i>
                  </a>
                </div>
                <div id="collapseOne" class="collapse show" role="tabpanel" aria-labelledby="headingOne">
                  <div class="card-body">
                    <p>${product.descript }</p>
                  </div>
                </div>
              </div>
              <div class="card card-plain">
                <div class="card-header" role="tab" id="headingTwo">
                  <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                    目前存貨
                    <i class="now-ui-icons arrows-1_minimal-down"></i>
                  </a>
                </div>
                <div id="collapseTwo" class="collapse" role="tabpanel" aria-labelledby="headingTwo">
                  <div class="card-body">
                    <p>${product.stock}</p>
                  </div>
                </div>
              </div>
<!--               <div class="card card-plain"> -->
<!--                 <div class="card-header" role="tab" id="headingThree"> -->
<!--                   <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree"> -->
<!--                     Details and Care -->
<!--                     <i class="now-ui-icons arrows-1_minimal-down"></i> -->
<!--                   </a> -->
<!--                 </div> -->
<!--                 <div id="collapseThree" class="collapse" role="tabpanel" aria-labelledby="headingThree"> -->
<!--                   <div class="card-body"> -->
<!--                     <ul> -->
<!--                       <li>Storm and midnight-blue stretch cotton-blend</li> -->
<!--                       <li>Notch lapels, functioning buttoned cuffs, two front flap pockets, single vent, internal pocket</li> -->
<!--                       <li>Two button fastening</li> -->
<!--                       <li>84% cotton, 14% nylon, 2% elastane</li> -->
<!--                       <li>Dry clean</li> -->
<!--                     </ul> -->
<!--                   </div> -->
<!--                 </div> -->
<!--               </div> -->
            </div>
<!--             <div class="row pick-size"> -->
<!--               <div class="col-lg-6 col-md-8 col-sm-6"> -->
<!--                 <label>Select color</label> -->
<!--                 <select class="selectpicker" data-style="select-with-transition btn btn-block" data-size="7"> -->
<!--                   <option value="1">Black</option> -->
<!--                   <option value="2">Gray</option> -->
<!--                   <option value="3">White</option> -->
<!--                 </select> -->
<!--               </div> -->
<!--               <div class="col-lg-6 col-md-8 col-sm-6"> -->
<!--                 <label>Select size</label> -->
<!--                 <select class="selectpicker" data-style="select-with-transition btn btn-block" data-size="7"> -->
<!--                   <option value="1">Small </option> -->
<!--                   <option value="2">Medium</option> -->
<!--                   <option value="3">Large</option> -->
<!--                 </select> -->
<!--               </div> -->
<!--             </div> -->
<!--             <div class="row justify-content-end"> -->
<!--               <button class="btn btn-primary mr-3">Add to Cart &nbsp;<i class="now-ui-icons shopping_cart-simple"></i></button> -->
<!--             </div> -->
            
            <!-- 加入購物車 -->
            <form action="${pageContext.request.contextPath}/shop/insertIntoCart" method="post">
					<div class="pull-right">
                       <button type="button" class="btn btn-info btn-sm" id="minus" style="height: 38px"> <i class="now-ui-icons ui-1_simple-delete"></i> </button>
                       <input type="text" id="qty" style="width: 45px;height: 38px;text-align:center" name="qty" value="1"/>
                       <button type="button" class="btn btn-info btn-sm" id="plus" style="height: 38px"> <i class="now-ui-icons ui-1_simple-add"></i> </button>
                        <input type="hidden" name="from" value="productDetail" />
                       <input type="hidden" name="custId" value="123"/>
	 			   	<input type="hidden" name="price" value="${product.price}" />
	 				<input type="hidden" name="prodId" value="${product.prodId}" />
				
	 				<button type="submit" class="btn btn-primary mr-3">Add to Cart &nbsp;<i class="now-ui-icons shopping_cart-simple"></i></button>
					</div>
	 			

	 		</form>
	 		
	 		
	 		
          </div>
        </div>
      </div>
    </div>
        <!-- =============== -->
        <!-- 推薦相關商品 -->
        <div class="section related-products" style="background-color:#FFBFBF" data-background-color="">
      <div class="container">
        <h3 class="title text-center">你可能也感興趣的商品</h3>
        <div class="row">
        <c:forEach items="${productsug}" var="productsugg">
        	<c:if test="${productsugg.prodName != product.prodName }"> <!-- 不是同商品才顯示 -->
        <div class="col-sm-6 col-md-3">
            <div class="card card-product">
              <div class="card-image" style="width:225px;height:225px;margin:0 auto">
                <a href="${pageContext.request.contextPath}/productdetail?prodId=${productsugg.prodId }&category=${productsugg.category}&petkind=${productsugg.petkind}">
                  <img class="img rounded" src="${productsugg.prodImg }" />
                </a>
              </div>
              <div class="card-body">
                <h6 class="category text-danger">Try it</h6>
                <h4 class="card-title" style="height: 82px"> <!-- 固定高度 -->
                  <a href="${pageContext.request.contextPath}/productdetail?prodId=${productsugg.prodId }&category=${productsugg.category}&petkind=${productsugg.petkind}" class="card-link">${productsugg.prodName}</a>
                </h4>
                <div class="card-description">
                  
                </div>
                <div class="card-footer">
                  <div class="price-container">
                    <span class="price">NT ${productsugg.price }</span>
                  </div>
                  <button class="btn btn-neutral btn-icon btn-round pull-right like" rel="tooltip" data-placement="left">
                    <i class="now-ui-icons ui-2_favourite-28"></i>
                  </button>
                </div>
              </div>
            </div>
          </div>
          	</c:if>
          </c:forEach>

                  
                  <!--go top  -->
            	  <p class="totop"> 
   	        	    <a class="btn btn-icon btn-round" href="#top"><i class="now-ui-icons arrows-1_minimal-up"></i></a> 
		    	  </p>
<!--                 </div> -->
<!--               </div> -->
<!--             </div> -->
<!--           </div> -->
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
  <script src="${pageContext.request.contextPath}/userjs/now-ui-kit.js?v=1.3.1" type="text/javascript"></script>\
  
  <!--  Plugin for Sweet Alert -->
  <script src="${pageContext.request.contextPath}/js/plugins/sweetalert2.min.js"></script>
  
  <script>
	$(document).ready(function(){

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

    //addlike
    $('.like').click(function(e){
// 		event.preventDefault();
// 		let formid=$(this).parent();
		Swal.fire({
			  icon: 'success',
			  title: '已加入收藏'
			});

    });

    //增加減少數量
    $('#plus').click(function(e){
    	  $('#qty').val(parseInt($('#qty').val())+1);  
    })
    $('#minus').click(function(e){
        if(parseInt($('#qty').val())>0){
		  $('#qty').val(parseInt($('#qty').val())-1);
        }
    })
  </script>
</body>
</html>