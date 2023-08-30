<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.dinero.model.MessageRepository"%>
<%@page import="org.hibernate.Session"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <meta charset="utf-8" />
  <link rel="apple-touch-icon" sizes="76x76" href="${pageContext.request.contextPath}/user-img/apple-icon.png">
  <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/user-img/favicon.png">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>寵物分類文章</title>
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

	<!-- Back To Index -->
<%-- <form action="user/articles" method="get" --%>
<%-- 			style="display: inline; width: 104px; float: right"> --%>
<!-- 			<input type="hidden" name="todo" value="1"> -->
<!-- 			<button type="submit" class="btn btn-outline-dark" -->
<!-- 				style="margin-bottom: 10px">Back</button> -->
<%-- 			</form> --%>
			
 <div class="wrapper">
    <div class="page-header page-header-small">
      <div class="page-header-image" data-parallax="true" style="background-image: url('${pageContext.request.contextPath}/images/pet-girl.jpeg');">
      </div>
      <div class="content-center">
        <div class="row">
          <div class="col-md-8 ml-auto mr-auto text-center" >
            <h2 class="title" ></h2>
            <h4>Since 2022</h4>
          </div>
        </div>
      </div>
    </div>
    <div class="section">
      <div class="container">
        <div class="row">
            <div class="button-container">
              <a href="#pablo" class="btn btn-primary btn-round btn-lg">
                <i class="now-ui-icons text_align-left"></i> 文章分類
              </a>
              <a href="#pablo" class="btn btn-icon btn-lg btn-twitter btn-round">
                <i class="fab fa-twitter"></i>
              </a>
              <a href="#pablo" class="btn btn-icon btn-lg btn-facebook btn-round">
                <i class="fab fa-facebook-square"></i>
              </a>
              <a href="#pablo" class="btn btn-icon btn-lg btn-google btn-round">
                <i class="fab fa-google"></i>
              </a>
            </div>
         <c:forEach var="message" items="${category}" >
          <div class="col-md-12">
          </div>
        </div>
      </div>
      <div class="section">
        <div class="container">
          <div class="row">
            <div class="col-md-8 ml-auto mr-auto">
              <h3 class="title"><c:out value="${message.messagetitle}" /></h3>
              <p>${message.message}</p>
                <br />
                <br /> 
				 <img class="img rounded img-raised" src="<c:out value="${message.picBase64}"/>" />
                </p>
              <p class="blockquote blockquote-primary">
                <span>
                <c:forEach var="res" items="${message.responses}">
                	${res.rcontent}<hr>
                </c:forEach>
                
                </span>
                <span>
                <a href="${pageContext.request.contextPath}/addResponse?messageId=${message.messageId}" class="response-href">請輸入留言...</a>
                <span class="error"></span>
                <input type="hidden" value="${message.messageId}"/>
                <input class="response-text"style="border:0px orange dashed;"/>
                </span>
                <br>
                <br>
                <small>
                  
                </small>
              </p>
            </div>
          </c:forEach>
          </div>
        </div>
      </div>
<!--  <div class="section section-blog col-md-10 ml-auto mr-auto"> -->
<!--         <div class="container"> -->
<!--           <div class="section-story-overview"> -->
<!--             <div class="row"> -->
<!--               <div class="col-md-6"> -->
<!--                 <div class="image-container image-left" style="background-image: url('../assets/img/bg35.jpg')"> -->
<!--                   First image on the left side -->
<!--                   <p class="blockquote blockquote-primary">"Over the span of the satellite record, Arctic sea ice has been declining significantly, while sea ice in the Antarctichas increased very slightly" -->
<!--                     <br> -->
<!--                     <br> -->
<!--                     <small>-NOAA</small> -->
<!--                   </p> -->
<!--                 </div> -->
<!--                 Second image on the left side of the article -->
<!--                 <div class="image-container image-left-bottom" style="background-image: url('../assets/img/bg29.jpg')"> -->
<!--                 </div> -->
<!--               </div> -->
<!--               <div class="col-md-5"> -->
<!--                 First image on the right side, above the article -->
<!--                 <div class="image-container image-right" style="background-image: url('../assets/img/project16.jpg')"> -->
<!--                 </div> -->
<!--                 <h3>So what does the new record for the lowest level of winter ice actually mean</h3> -->
<!--                 <p>The Arctic Ocean freezes every winter and much of the sea-ice then thaws every summer, and that process will continue whatever happens with climate change. Even if the Arctic continues to be one of the fastest-warming regions of the world, it will always be plunged into bitterly cold polar dark every winter. And year-by-year, for all kinds of natural reasons, there’s huge variety of the state of the ice. -->
<!--                 </p> -->
<!--                 <p> -->
<!--                   For a start, it does not automatically follow that a record amount of ice will melt this summer. More important for determining the size of the annual thaw is the state of the weather as the midnight sun approaches and temperatures rise. But over the more than 30 years of satellite records, scientists have observed a clear pattern of decline, decade-by-decade. -->
<!--                 </p> -->
<!--                 <p>The Arctic Ocean freezes every winter and much of the sea-ice then thaws every summer, and that process will continue whatever happens with climate change. Even if the Arctic continues to be one of the fastest-warming regions of the world, it will always be plunged into bitterly cold polar dark every winter. And year-by-year, for all kinds of natural reasons, there’s huge variety of the state of the ice. -->
<!--                 </p> -->
              </div>
            </div>            
          </div>
        </div>
      </div>
	
<!-- 	 <!--   新增文章  --> -->
<!-- 	<div class="d-grid gap-2 d-md-flex justify-content-md-end"> -->
<!-- 		<a href="createArticle" "class="btn btn-primary btn-sm"> -->
<!-- 			<button class="btn btn-primary btn-sm">新增</button> -->
<!-- 		</a> -->
<!-- 	</div> -->
	
























<<!--   Core JS Files   -->
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

<script type="text/javascript">
$(".response-href").on("click",function(e){
	e.preventDefault();
});
$(".response-text").on("keydown",function(e){
	if(e.keyCode==13){
		console.log($(this).val());
		let click = $(this);
		let responsetext = click.val();
		let messageId = click.prev().val();
		$.ajax({
			type:"get",
			url:"/dinero/addResponse/"+messageId,
			contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
			data:{"responsetext":responsetext},
			success:function(msg){

				if(msg === 'success'){
					click.val("");
					click.parent().prev().append(responsetext+"<hr>");
				}else {
					$(".error").text("需先登入才可進行留言")
				}
			},
			error:function(){
				$(".error").text("需先登入才可進行留言")
			}
			
		}); 
		
		
	}
	
});


</script>

</body>

</html>
</body>
</html>