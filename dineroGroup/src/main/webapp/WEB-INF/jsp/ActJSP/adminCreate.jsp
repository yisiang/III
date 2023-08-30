<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> -->
<title>新增活動</title>
<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
  <!--     Fonts and icons     -->
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" rel="stylesheet" />
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
  <!-- CSS Files -->
  <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" />
  <link href="${pageContext.request.contextPath}/css/now-ui-dashboard.css?v=1.6.0" rel="stylesheet" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>      .background-image_container{
     	min-height: 100%;
     	width: 100%;
    	background-image: url(${pageContext.request.contextPath}/images/背景2.jpg);
    	background-position: center;    
	}</style>
</head>

<body class=" sidebar-mini ">
 
     <div class="wrapper ">

          <jsp:include page="../testSideBar.jsp"></jsp:include>  
					        <div class="panel-header">
        		<div class="background-image_container">
            </div>
        </div>
        <div class="main-panel" id="main-panel">
          
           <jsp:include page="../testNavBar.jsp"></jsp:include>
          
            <div class="panel-header panel-header-sm"></div>

			<div class="content">
				<div class="col-md-10 mr-auto ml-auto">
					<!--      Wizard container        -->
					<div class="wizard-container">
						<div class="card card-wizard" data-color="primary" id="wizardProfile">
								<form:form action="${pageContext.request.contextPath}/activities/activity.insert" method="post" modelAttribute="commandCreate" enctype="multipart/form-data">
								<!--        You can switch " data-color="primary" "  with one of the next bright colors: "green", "orange", "red", "blue"       -->
									<div class="card-header text-center" data-background-color="orange">
										<h3 class="card-title">新增活動</h3>
<!--                   						<h3 class="description">活動資訊</h3> -->
						                    <div class="wizard-navigation">
						                      <ul class="nav nav-pills">
						                        <li class="nav-item">
						                          <a class="nav-link active" href="#about" data-toggle="tab" role="tab" aria-controls="about" aria-selected="true">
<!-- 						                            <i class="fas fa-solid fa-file-signature"></i> -->
						                            活動資訊
						                            </a>
						                        </li>
						                       </ul>
						                     </div>
						                 </div>
						                 <div class="card-body">
						                  <div class="tab-content">
						                    <div class="tab-pane show active" id="about">
						                      <h5 class="info-text"></h5>  
						                    
				                          <div class="col-sm-12">
				                          <div class="row">
                     	    				<label class="col-sm-2 col-form-label" style="font-size: 16px; color: black;">活動類型</label>
                     	    
                    		  				 <div class="form-check form-check-radio">
                        	    			    <label class="form-check-label" style="font-size: 16px; color: black;">
				                                  <form:radiobutton class="form-check-input" path="actType" id="exampleRadios1" value="餐飲" />
				                                  <span class="form-check-sign"></span>
				                                  餐飲
				                        	    </label>
				                      	     </div>
				                      	      
				                      	     <div class="form-check form-check-radio">
				                        	    <label class="form-check-label" style="font-size: 16px; color: black;">
				                                  <form:radiobutton class="form-check-input" path="actType" id="exampleRadios1" value="娛樂" />
				                              	  <span class="form-check-sign"></span>
				                                  娛樂
				                        	    </label>
				                      	     </div>
				                      	    
				                      	     <div class="form-check form-check-radio">
				                        	    <label class="form-check-label" style="font-size: 16px; color: black;">
				                                  <form:radiobutton class="form-check-input" path="actType" id="exampleRadios1" value="知性"/>
				                                  <span class="form-check-sign"></span>
				                                  知性
				                        	    </label>
				                      	     </div>
				                      	     
				                      	     <div class="form-check form-check-radio">
                        	    			    <label class="form-check-label" style="font-size: 16px; color: black;">
				                                  <form:radiobutton class="form-check-input" path="actType" id="exampleRadios1" value="競賽" />
				                                  <span class="form-check-sign"></span>
				                                  競賽
				                        	    </label>
				                      	     </div>
                     	
				                           </div>
				                          <div class="row">
			                    			<label class="col-sm-2 col-form-label" style="font-size: 16px; color: black;">活動名稱</label>
			                   				  <div class="col-sm-10">
			                      		  		<div class="form-group">
			                        			  <form:input type="text" class="form-control" path="actName"/>
			                      	      		</div>
			                    			  </div>
			                     	      </div>
			                     	      
										  <div class="row">
											<label class="col-sm-2 col-form-label" style="font-size: 16px; color: black;">活動內容</label>
											  <div class="col-sm-10">
												<div class="form-group">
												  <form:textarea row="10" type="text" class="form-control" path="actContent"/>
												</div>
											  </div>
										  </div>
				                     	  
				                     	  <div class="row">
				                    		<label class="col-sm-2 col-form-label" style="font-size: 16px; color: black;">報名人數餘額</label>
				                   			  <div class="col-sm-10">
				                      		    <div class="form-group">
				                        		  <form:input type="text" class="form-control" path="memberRemain"/>
				                      	        </div>
				                    		  </div>
				                     	  </div>
				                     	  
						                      <div class="row justify-content-center">
						                        <div class="col-sm-4">
						                          <div class="picture-container">
						                          
				                            	  <div class="picture" style="width:150px; height:150px"> 
				                              		<img src="" class="picture-src" id="imgUploadShow" title="" />
				                              		  <input type="file" id="imgUploadFile" multiple="multiple"/>
				                              		  <input type="hidden" name="imgUploadBase" id="imgUploadBase"/>													

<!-- 														<img src="actImg" alt="no image" width="auto"> -->
<!-- 				                              		  <input type="file" id="actImg" name="actImg"> -->
													  
<!-- 													  <input class="form-control uploadImages" type="file" id="actImg" name="actImg" path="actImg" /> -->
<!-- 													  <input type="hidden" id="imgBase64" name="imgBase64" value="" path="imgBase64" /> -->
				                            	    </div>
				                            	  <h6 class="description" style="color: black;">選擇圖片</h6>
				                          	  </div>
				                            </div>
				                     	 
				                    		<label class="col-sm-2 col-form-label" style="font-size: 16px; color: black;">報名截止日期</label>
				                   			  <div class="col-sm-6">
				                      		    <div class="form-group">
				                        		  <form:input type="text" class="form-control" path="endDate"/>
				                      	      </div>
				                    		</div>
				                     	  
				                     </div>
				                   </div>
				                 </div>
				                 <div class="card-footer">
				                  <div class="pull-right" style="font-size: 16px;">
				<!--                     <input type='button' class='btn btn-next btn-fill btn-rose btn-wd' name='next' value='Next' /> -->
				                    <input type='submit' class='btn btn-finish btn-fill btn-rose btn-wd' name='create' value='確定新增' />
				                  </div>
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
  <script src="${pageContext.request.contextPath}/js/now-ui-dashboard.min.js?v=1.6.0" type="text/javascript"></script><!-- Now Ui Dashboard DEMO methods, don't include it in your project! -->
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
		$("#imgUploadFile").change(function() {
			var file = this.files[0];
			var reader = new FileReader();
			reader.readAsDataURL(file);//呼叫自帶方法進行轉換 
			reader.onload = function(e) {
				$("#imgUploadShow").attr("src", this.result);//將轉換後的編碼存入src完成預覽 
				$("#imgUploadBase").val(this.result);//將轉換後的編碼儲存到input供後臺使用 
			};
		});
	</script>

</body>
</html>