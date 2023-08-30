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
<title>ProductLike</title>

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
</head>
<body class="product-page sidebar-collapse">

  <!-- Navbar -->
  <jsp:include page="../UserNavBar.jsp"></jsp:include>
  <!-- End Navbar -->
     
      
  <div class="wrapper">
    <div class="page-header page-header-mini"> <!-- 背景牆 -->
      <div class="page-header-image" data-parallax="true" style="background-image: url('${pageContext.request.contextPath}/images/大背景2.jpg');">
      </div>
            <div class="content-center text-center">
              <div class="row">
                <div class="col-md-8 ml-auto mr-auto">
                  <h1 class="title">我的收藏</h1>
                  <h4 class="description text-white"></h4>
                </div>
              </div>
            </div>
    </div>
     <div class="section">
          <div class="team-4">
        <div class="container">
<!--           <div class="row"> -->
<!--             <div class="col-md-8 ml-auto mr-auto text-center"> -->
<!--               <h2 class="title">The Executive Team 4</h2> -->
<!--               <h4 class="description">This is the paragraph where you can write more details about your team. Keep you user engaged by providing meaningful information.</h4> -->
<!--             </div> -->
<!--           </div> -->
          <div class="row">
          <c:forEach items="${likeList }" var="likelists">
            <div class="col-md-6">
              <div class="card card-profile card-plain">
                <div class="row">
                  <div class="col-md-5">
                    <div class="card-image">
                      <a href="${pageContext.request.contextPath}/productdetail?prodId=${likelists.prodId}&category=${likelists.category}&petkind=${likelists.petkind}">
                        <img class="img img-raised rounded" src="${likelists.prodImg }" />
                      </a>
                    </div>
                  </div>
                  <div class="col-md-7">
                    <div class="card-body">
                      <h4 class="card-title">${likelists.prodName }</h4>
                      <h6 class="category">${likelists.category }</h6>
                      <p class="card-description" style = " overflow : hidden ; text-overflow : ellipsis ; display : -webkit-box ; -webkit-line-clamp : 2 ; -webkit-box-orient : vertical ; ">
                        ${likelists.descript }
                      </p>
                      <div class="card-footer">
                        <span class="price text-info"> NT ${likelists.price }</span>
<!--                         <a href="#pablo" class="btn btn-icon btn-neutral btn-twitter"><i class="fab fa-twitter"></i></a> -->
<!--                         <a href="#pablo" class="btn btn-icon btn-neutral btn-facebook"><i class="fab fa-facebook-square"></i></a> -->
<!--                         <a href="#pablo" class="btn btn-icon btn-neutral btn-google"><i class="fab fa-google"></i></a> -->
						<!-- 加入購物車 -->
                        <form action="${pageContext.request.contextPath}/shop/insertIntoCart" method="post">
                        <input type="hidden" name="qty" value="1"/>
                         <input type="hidden" name="price" value="${likelists.price}" />
                         <input type="hidden" name="from" value="productUserForm" />
	 					<input type="hidden" name="prodId" value="${likelists.prodId}" />
                        <button class="btn btn-danger btn-neutral btn-round btn-icon pull-right addcart" type="submit">
       				       <i class="now-ui-icons shopping_cart-simple"></i>
                        </button>
                         </form>
                        
                        <!-- 刪除收藏 -->
                        <form action="${pageContext.request.contextPath}/dislike">
                          <input type="hidden" name="prodId" value="${likelists.prodId }" />
                          <button class="btn btn-danger btn-neutral btn-icon btn-round pull-right like" type="submit" rel="tooltip" data-placement="left">
                            <i class="now-ui-icons ui-1_simple-remove"></i>
                          </button>
                        </form>
                      </div>
                    </div>
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
  <script src="${pageContext.request.contextPath}/userjs/now-ui-kit.js?v=1.3.1" type="text/javascript"></script>\
  
  <!--  Plugin for Sweet Alert -->
  <script src="${pageContext.request.contextPath}/js/plugins/sweetalert2.min.js"></script>
  
  <script>
  $('.addcart').click(function(e){
//		event.preventDefault();
//		let formid=$(this).parent();
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

  </script>
  
</body>
</html>