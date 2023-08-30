<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CreateProduct</title>
<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
  <!--     Fonts and icons     -->
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" rel="stylesheet" />
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
  <!-- CSS Files -->
  <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" />
  <link href="${pageContext.request.contextPath}/css/now-ui-dashboard.css?v=1.6.0" rel="stylesheet" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

</head>
<body class=" sidebar-mini " >

<div class="wrapper ">

<jsp:include page="../testSideBar.jsp"></jsp:include> <!-- 動態匯入 sidebarjsp -->
     
<!--      ============================================= -->

<div class="main-panel" id="main-panel"> 
    
<jsp:include page="../testNavBar.jsp"></jsp:include> <!-- 動態匯入 navbarjsp-->
    
<!-- ============================================================ -->
	  <div class="panel-header panel-header-sm">  <!-- 上面背景牆 -->
      </div>
        <div class="content">
        <div class="col-md-10 mr-auto ml-auto">
          <!--      Wizard container        -->
          <div class="wizard-container">
            <div class="card card-wizard" data-color="primary" id="wizardProfile">
		<form action="${pageContext.request.contextPath}/users.insertadmin" method="POST" name="userForm" onSubmit="return validateForm()" enctype="multipart/form-data">
                <!--        You can switch " data-color="primary" "  with one of the next bright colors: "green", "orange", "red", "blue"       -->
                <div class="card-header text-center" data-background-color="orange">
                  <h3 class="card-title">
                    建立會員資料
                  </h3>
                  <h3 class="description">This information about product.</h3>
                    <div class="wizard-navigation">
                      <ul class="nav nav-pills">
                        <li class="nav-item">
                          <a class="nav-link active" href="#about" data-toggle="tab" role="tab" aria-controls="about" aria-selected="true">
                            <i class="fas fa-solid fa-file-signature"></i>
                            會員基本資料
                          </a>
                        </li>
                       </ul>
                     </div>
                 </div>
                 <div class="card-body">
                  <div class="tab-content">
                    <div class="tab-pane show active" id="about">
                      <h5 class="info-text"> </h5>
                      <div class="row justify-content-center">
                        <div class="col-sm-4">
                          <div class="picture-container">
                            <div class="picture" style="width:180px;height:180px"> <!-- 上傳圖片 -->
							<img id="thumbnail" alt="Photo Preview"/>
                              <input type="hidden" name="img_upload_base" id="img_upload_base" />
                              	<input type="file"name="fileImage" id="fileImage" accept="image/png , image/jpeg , image/jpg">	
                              
                              
                            </div>
                            <h6 class="description">請選擇照片</h6>
                          </div>
                        </div>
                        <div class="col-sm-6">
                          
                     <fieldset class="form-group">
					<label>帳號</label> <input type="text"
						 class="form-control"
						name="username" required="required" minlength="1">
				</fieldset>
				<fieldset class="form-group">
					<label>密碼</label> <input type="text"
						 class="form-control"
						name="password" minlength="1">
				</fieldset>
				<fieldset class="form-group">
					<label>姓名</label> <input type="text"
						 class="form-control"
						name="name"  minlength="1">
				</fieldset>
					<fieldset class="form-group">
					<label>信箱</label> <input type="text"
						 class="form-control"
						name="email" minlength="1">
						</fieldset>
					<fieldset class="form-group">
					<label>地址</label> <input type="text"
						 class="form-control"
						name="address"  minlength="1">
						</fieldset>

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
                    <input type='submit' class='btn btn-finish btn-fill btn-rose btn-wd' name='create' value='提交' />
                  </div>
<!--                   <div class="pull-left"> -->
<!--                     <input type='button' class='btn btn-previous btn-fill btn-default btn-wd' name='previous' value='Previous' /> -->
<!--                   </div> -->
                  <div class="clearfix"></div>
                </div>
                 
                 
                 </form>
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

		<script type="text/javascript">
		
		function showImageThumbnail(fileInput){
			file = fileInput.files[0];
			reader = new FileReader();
			
			reader.onload = function(e){
				$('#thumbnail').attr('src',e.target.result);
			};
			reader.readAsDataURL(file);
			
		}
		
		
			$(document).ready(function() {

				$('#fileImage').change(function(){
					showImageThumbnail(this);
				});
				
				
			});
		</script>

</body>
</html>