<%@page import="com.dinero.model.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UpdateProduct</title>

<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
  <!--     Fonts and icons     -->
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" rel="stylesheet" />
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
  <!-- CSS Files -->
  <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" />
  <link href="${pageContext.request.contextPath}/css/now-ui-dashboard.css?v=1.6.0" rel="stylesheet" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!-- 修改label文字大小 -->
<style type="text/css">
.card label {
    font-size: 1.3em;
    margin-bottom: 5px;
    color: black;
}
</style>

</head>
<body class=" sidebar-mini ">

<%-- 	<jsp:include page="../dineroNavBar.jsp"></jsp:include> --%>

<!-- enctype="multipart/form-data" -->
	<div class="wrapper ">
	
<jsp:include page="../testSideBar.jsp"></jsp:include> <!-- 動態匯入 sidebarjsp -->
     
<!--      ============================================= -->

<div class="main-panel" id="main-panel"> 
    
<jsp:include page="../testNavBar.jsp"></jsp:include> <!-- 動態匯入 navbarjsp-->
    
    <!-- ========================================== -->
	  <div class="panel-header panel-header-sm">  <!-- 上面背景牆 -->
      </div>
        <div class="content">
        <div class="col-md-10 mr-auto ml-auto">
          <!--      Wizard container        -->
          <div class="wizard-container">
            <div class="card card-wizard" data-color="primary" id="wizardProfile">
              <form:form action="${pageContext.request.contextPath}/updateproduct.controller" method="post" modelAttribute="product" enctype="multipart/form-data">
                <!--        You can switch " data-color="primary" "  with one of the next bright colors: "green", "orange", "red", "blue"       -->
                <div class="card-header text-center" data-background-color="orange">
                  <h3 class="card-title">
                    修改商品資料
                  </h3>
                  <h3 class="description">This information about product.</h3>
                    <div class="wizard-navigation">
                      <ul class="nav nav-pills">
                        <li class="nav-item">
                          <a class="nav-link active" href="#about" data-toggle="tab" role="tab" aria-controls="about" aria-selected="true">
                            <i class="fas fa-solid fa-screwdriver-wrench"></i>
                            About
                          </a>
                        </li>
                       </ul>
                     </div>
                 </div>
                 <div class="card-body">
                  <div class="tab-content">
                    <div class="tab-pane show active" id="about">
                      <h5 class="info-text"> Let's start with the basic information (with validation)</h5>
                      <div class="row justify-content-center">
                        <div class="col-sm-4">
                          <div class="picture-container">
                            <div class="picture" style="border-radius: 10%;width:180px;height:180px"> <!-- 上傳圖片 -->
                              <img src="${product.prodImg }" class="picture-src" id="img_upload_show" title="" />
                              <input type="file" id="img_upload_file" value="${product.prodImg }" multiple="multiple">
                              <input type="hidden" name="img_upload_base" value="${product.prodImg }" id="img_upload_base" />
                            </div>
                            <h6 class="description">Choose Picture</h6>
                          </div>
                        </div>
                        <div class="col-sm-6">
                          <div class="row">
                          
                    		<label class="col-sm-2 col-form-label" style="white-space:nowrap">欲修改的Id</label>
                   			<div class="col-sm-10">
                      		  <div class="form-group">
                        		<form:input type="text" class="form-control" path="prodId" readonly="true"/>
                        		
                      	      </div>
                    		</div>
                     	  </div>
                          
                          <div class="row">
                    		<label class="col-sm-2 col-form-label" style="white-space:nowrap">產品名稱</label>
                   			<div class="col-sm-10">
                      		  <div class="form-group">
                        		<form:input type="text" class="form-control" path="prodName"/>
                        		
                      	      </div>
                    		</div>
                     	  </div>
                     	  <div class="row">
                    		<label class="col-sm-2 col-form-label" style="white-space:nowrap">產品價格</label>
                   			<div class="col-sm-10">
                      		  <div class="form-group">
                        		<form:input type="text" class="form-control" path="price"/>
                        		
                      	      </div>
                    		</div>
                     	  </div>
                     	  <div class="row">
                    		<label class="col-sm-2 col-form-label" style="white-space:nowrap">產品描述</label>
                   			<div class="col-sm-10">
                      		  <div class="form-group">
                        		<form:input type="text" class="form-control" path="descript"/>
                        		
                      	      </div>
                    		</div>
                     	  </div>
                     	  <div class="row">
                    		<label class="col-sm-2 col-form-label" style="white-space:nowrap">產品庫存</label>
                   			<div class="col-sm-10">
                      		  <div class="form-group">
                        		<form:input type="text" class="form-control" path="stock"/>
                        		
                      	      </div>
                    		</div>
                     	  </div>
                     	  
                     	  <div class="row">
                     	  <label class="col-sm-2 col-form-label" style="white-space:nowrap">產品類型</label>
                    		<div class="form-check form-check-radio">
                        	  <label class="form-check-label">
                              <form:radiobutton class="form-check-input" path="category" id="exampleRadios1" value="飼料"/>
                              <span class="form-check-sign"></span>
                              飼料
                        	  </label>
                      	    </div>
                      	    <div class="form-check form-check-radio">
                        	  <label class="form-check-label">
                              <form:radiobutton class="form-check-input" path="category" id="exampleRadios1" value="罐頭" />
                              <span class="form-check-sign"></span>
                              罐頭
                        	  </label>
                      	    </div>
                      	    <div class="form-check form-check-radio">
                        	  <label class="form-check-label">
                              <form:radiobutton class="form-check-input" path="category" id="exampleRadios1" value="零食"/>
                              <span class="form-check-sign"></span>
                              零食
                        	  </label>
                      	    </div>
                      	    <div class="form-check form-check-radio">
                        	  <label class="form-check-label">
                              <form:radiobutton class="form-check-input" path="category" id="exampleRadios1" value="用品"/>
                              <span class="form-check-sign"></span>
                              用品
                        	  </label>
                      	    </div>
                     	  </div>
                     	  
                     	  <div class="row">
                    		<label class="col-sm-2 col-form-label" style="white-space:nowrap">寵物類型</label>
                   			<div class="form-check form-check-radio">
                        	  <label class="form-check-label">
                              <form:radiobutton class="form-check-input" path="petkind" id="exampleRadios1" value="狗"/>
                              <span class="form-check-sign"></span>
                              狗
                        	  </label>
                      	    </div>
                      	    <div class="form-check form-check-radio">
                        	  <label class="form-check-label">
                              <form:radiobutton class="form-check-input" path="petkind" id="exampleRadios1" value="貓"/>
                              <span class="form-check-sign"></span>
                              貓
                        	  </label>
                      	    </div>
                     	  </div>
                          
<!--                           <div class="input-group form-control-lg"> -->
<!--                             <div class="input-group-prepend"> -->
<!--                               <div class="input-group-text"> -->
<!--                                 <i class="now-ui-icons users_circle-08"></i> -->
<!--                               </div> -->
<!--                             </div> -->
<!--                             <input type="text" class="form-control" placeholder="產品名稱 (required)" name="prodName"> -->
<!--                           </div> -->
<!--                           <div class="input-group form-control-lg"> -->
<!--                             <div class="input-group-prepend"> -->
<!--                               <div class="input-group-text"> -->
<!--                                 <i class="now-ui-icons text_caps-small"></i> -->
<!--                               </div> -->
<!--                             </div> -->
<!--                             <input type="text" placeholder="產品價格 (required)" class="form-control" name="price" /> -->
<!--                           </div> -->
<!--                           <div class="input-group form-control-lg"> -->
<!--                             <div class="input-group-prepend"> -->
<!--                               <div class="input-group-text"> -->
<!--                                 <i class="now-ui-icons text_caps-small"></i> -->
<!--                               </div> -->
<!--                             </div> -->
<!--                             <input type="text" placeholder="產品描述 (required)" class="form-control" name="descript" /> -->
<!--                           </div> -->
<!--                           <div class="input-group form-control-lg"> -->
<!--                             <div class="input-group-prepend"> -->
<!--                               <div class="input-group-text"> -->
<!--                                 <i class="now-ui-icons text_caps-small"></i> -->
<!--                               </div> -->
<!--                             </div> -->
<!--                             <input type="text" placeholder="產品庫存 (required)" class="form-control" name="stock" /> -->
<!--                           </div> -->
<!--                           <div class="input-group form-control-lg"> -->
<!--                             <div class="input-group-prepend"> -->
<!--                               <div class="input-group-text"> -->
<!--                                 <i class="now-ui-icons text_caps-small"></i> -->
<!--                               </div> -->
<!--                             </div> -->
<!--                             <input type="text" placeholder="產品種類 (required)" class="form-control" name="price" /> -->
<!--                           </div> -->
<!--                           <div class="input-group form-control-lg"> -->
<!--                             <div class="input-group-prepend"> -->
<!--                               <div class="input-group-text"> -->
<!--                                 <i class="now-ui-icons text_caps-small"></i> -->
<!--                               </div> -->
<!--                             </div> -->
<!--                             <input type="text" placeholder="適合寵物類型 (required)" class="form-control" name="price" /> -->
<!--                           </div> -->
<!--                         </div> -->
<!--                         <div class="col-lg-10 mt-3"> -->
<!--                           <div class="input-group form-control-lg"> -->
<!--                             <div class="input-group-prepend"> -->
<!--                               <div class="input-group-text"> -->
<!--                                 <i class="now-ui-icons text_caps-small"></i> -->
<!--                               </div> -->
<!--                             </div> -->
<!--                             <input type="email" placeholder="Email (required)" class="form-control" name="email" /> -->
<!--                           </div> -->
<!--                         </div> -->
                      </div>
                    </div>
                   </div>
                  </div>
                  </div>
                 <div class="card-footer">
                  <div class="pull-right">
<!--                     <input type='button' class='btn btn-next btn-fill btn-rose btn-wd' name='next' value='Next' /> -->
                    <input type='submit' class='btn btn-finish btn-fill btn-rose btn-wd bg-info' name='create' value='提交' />
                  </div>
                  <div class="pull-right">
                    	<button type="button" id="oneinput" style="margin-right:20px">一鍵輸入</button>
                  </div>
<!--                   <div class="pull-left"> -->
<!--                     <input type='button' class='btn btn-previous btn-fill btn-default btn-wd' name='previous' value='Previous' /> -->
<!--                   </div> -->
                  <div class="clearfix"></div>
                </div>
                 
                 
                 </form:form>
                </div>
               </div>



</div>
</div>
</div>
</div>

<!--   Core JS Files   -->
  <script src="${pageContext.request.contextPath}/js/core/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/core/popper.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/core/bootstrap.min.js"></script>
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
  <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
  <!-- Chart JS -->
  <script src="${pageContext.request.contextPath}/js/plugins/chartjs.min.js"></script>
  <!--  Notifications Plugin    -->
  <script src="${pageContext.request.contextPath}/js/plugins/bootstrap-notify.js"></script>
  <!-- Control Center for Now Ui Dashboard: parallax effects, scripts for the example pages etc -->
  <script src="${pageContext.request.contextPath}/js/now-ui-dashboard.min.js?v=1.6.0" type="text/javascript"></script>
  <!-- Now Ui Dashboard DEMO methods, don't include it in your project! -->
  <script src="${pageContext.request.contextPath}/demo/demo.js"></script>
  <script>
    $(document).ready(function() {
      // Initialise the wizard
      demo.initNowUiWizard();
      setTimeout(function() {
        $('.card.card-wizard').addClass('active');
      }, 600);
    });
  </script>

<script>

$("#img_upload_file").change(function() {
    var file = this.files[0];
    var reader = new FileReader();
    reader.readAsDataURL(file);//呼叫自帶方法進行轉換
    reader.onload = function(e) {
        $("#img_upload_show").attr("src", this.result);//將轉換後的編碼存入src完成預覽
        $("#img_upload_base").val(this.result);//將轉換後的編碼儲存到input供後臺使用
    }; 
});
</script>

<!-- 一鍵輸入 -->		
<script> 
	$('#oneinput').click(function(e){
		$('#prodName').val("Fandora 名畫寵物帽 戴帽子的男人帽(頭圍31公分)");
		$('#price').val("150");
		$('#descript').val("商品特色＊因為布料有彈性，誤差1~2公分皆屬正常＊有伸縮扣設計，使用時可調節成適合寵物的長度。＊給寵物配戴時請主人一定要在現場，避免寵物誤食。商品照有些微色差屬正常，實際以商品顏色為準。");
		$('#stock').val("30");
		});
</script>		

</body>
</html>