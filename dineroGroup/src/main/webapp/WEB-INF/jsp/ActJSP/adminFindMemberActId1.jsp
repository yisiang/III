<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> -->
<title>會員活動報名管理系統</title>
<link rel="apple-touch-icon" sizes="76x76"	href="${pageContext.request.contextPath}/img/apple-icon.png">
<link rel="icon" type="image/png" href="${pageContext.request.contextPath}/img/favicon.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no'	name='viewport' />
<!--     Fonts and icons     -->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200"	rel="stylesheet" />
<link rel="stylesheet"	href="https://use.fontawesome.com/releases/v5.7.1/css/all.css"	integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr"	crossorigin="anonymous">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" rel="stylesheet" />
<!-- CSS Files -->
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/now-ui-dashboard.css?v=1.6.0" rel="stylesheet" />
<!-- CSS Just for demo purpose, don't include it in your project -->
<link href="${pageContext.request.contextPath}/demo/demo.css" rel="stylesheet" />
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

        <div class="main-panel" id="main-panel">
          
           <jsp:include page="../testNavBar.jsp"></jsp:include>
          			        <div class="panel-header">
        		<div class="background-image_container">
            </div>
        </div>
           
			<div class="content">
				<div class="row">
					<div class="col-md-12">
						<div class="card">
							<div class="card-header">
								<h4 class="card-title">會員活動報名管理系統</h4>
								
									<!-- 新增按鈕 -->
<%-- 									<form style="display:inline;" action="${pageContext.request.contextPath}/activities/activity.insert1" method="get" enctype="multipart/form-data">   --%>
<!-- 									<button type="submit" class="btn btn-round btn-info btn-icon btn-sm like" name="create" value=""><i class="fas fa-solid fa-plus"></i></button> -->

<%-- 								<c:url var="newLink" value="/users.new"><c:param name="action" value="new" /></c:url> --%>
<!-- 								<a href="/activities/activity.info/" class="btn btn-primary">回活動管理首頁</a>						 -->
							</div>

								<a href="${pageContext.request.contextPath}/activities/activity.info/" class="btn btn-primary">回活動管理首頁</a>						

							<table id="datatable" class="table table-striped table-bordered" cellspacing="0" width="100%">
								<thead>
									<tr>
										<th style="text-align: center; vertical-align: middle">會員編號</th>
										<th style="text-align: center; vertical-align: middle">會員姓名</th>
										<th style="text-align: center; vertical-align: middle">報名活動的時間</th>
																				
										<th class="disabled-sorting text-center">刪除會員報名資料</th>
									</tr>
								</thead>
								<tfoot>
									<tr>
										<th style="text-align: center; vertical-align: middle">會員編號</th>
										<th style="text-align: center; vertical-align: middle">會員姓名</th>
										<th style="text-align: center; vertical-align: middle">報名活動的時間</th>
										
										<th class="disabled-sorting text-center">刪除會員報名資料</th>
									</tr>
								</tfoot>
								
								<style>.td{width:20px; height:20px}</style>
								<tbody>
									<tr>
										<td style="text-align: center; vertical-align: middle; font-size:18px;">4569</td>
										<td style="text-align: center; vertical-align: middle; font-size:18px;">劉德華</td>
										<td style="text-align: center; vertical-align: middle; font-size:18px;">2022-03-26</td>										

										<td style="text-align: center; vertical-align: middle;">
 											<button class="btn btn-round btn-danger btn-icon btn-sm remove"><i class="fas fa-times"></i></button>											
										</td>	
									</tr>
									
									<tr>
										<td style="text-align: center; vertical-align: middle; font-size:18px;">4570</td>
										<td style="text-align: center; vertical-align: middle; font-size:18px;">陳奕迅</td>
										<td style="text-align: center; vertical-align: middle; font-size:18px;">2022-03-29</td>										

										<td style="text-align: center; vertical-align: middle;">
 											<button class="btn btn-round btn-danger btn-icon btn-sm remove"><i class="fas fa-times"></i></button>											
										</td>	
									</tr>
									
									<tr>
										<td style="text-align: center; vertical-align: middle; font-size:18px;">4578</td>
										<td style="text-align: center; vertical-align: middle; font-size:18px;">周杰倫</td>
										<td style="text-align: center; vertical-align: middle; font-size:18px;">2022-03-30</td>										

										<td style="text-align: center; vertical-align: middle;">
 											<button class="btn btn-round btn-danger btn-icon btn-sm remove"><i class="fas fa-times"></i></button>											
										</td>	
									</tr>
									
									<tr>
										<td style="text-align: center; vertical-align: middle; font-size:18px;">4580</td>
										<td style="text-align: center; vertical-align: middle; font-size:18px;">鄧紫棋</td>
										<td style="text-align: center; vertical-align: middle; font-size:18px;">2022-04-03</td>										

										<td style="text-align: center; vertical-align: middle;">
 											<button class="btn btn-round btn-danger btn-icon btn-sm remove"><i class="fas fa-times"></i></button>											
										</td>	
									</tr>
									
									<tr>
										<td style="text-align: center; vertical-align: middle; font-size:18px;">4581</td>
										<td style="text-align: center; vertical-align: middle; font-size:18px;">田馥甄</td>
										<td style="text-align: center; vertical-align: middle; font-size:18px;">2022-04-03</td>										

										<td style="text-align: center; vertical-align: middle;">
 											<button class="btn btn-round btn-danger btn-icon btn-sm remove"><i class="fas fa-times"></i></button>											
										</td>	
									</tr>
									
									<tr>
										<td style="text-align: center; vertical-align: middle; font-size:18px;">4582</td>
										<td style="text-align: center; vertical-align: middle; font-size:18px;">楊丞琳</td>
										<td style="text-align: center; vertical-align: middle; font-size:18px;">2022-04-10</td>										

										<td style="text-align: center; vertical-align: middle;">
 											<button class="btn btn-round btn-danger btn-icon btn-sm remove"><i class="fas fa-times"></i></button>											
										</td>	
									</tr>
									
									<tr>
										<td style="text-align: center; vertical-align: middle; font-size:18px;">4583</td>
										<td style="text-align: center; vertical-align: middle; font-size:18px;">張國榮</td>
										<td style="text-align: center; vertical-align: middle; font-size:18px;">2022-04-22</td>										

										<td style="text-align: center; vertical-align: middle;">
 											<button class="btn btn-round btn-danger btn-icon btn-sm remove"><i class="fas fa-times"></i></button>											
										</td>	
									</tr>
									
									<tr>
										<td style="text-align: center; vertical-align: middle; font-size:18px;">4584</td>
										<td style="text-align: center; vertical-align: middle; font-size:18px;">周潤發</td>
										<td style="text-align: center; vertical-align: middle; font-size:18px;">2022-05-03</td>										

										<td style="text-align: center; vertical-align: middle;">
 											<button class="btn btn-round btn-danger btn-icon btn-sm remove"><i class="fas fa-times"></i></button>											
										</td>	
									</tr>
									
									<tr>
										<td style="text-align: center; vertical-align: middle; font-size:18px;">4568</td>
										<td style="text-align: center; vertical-align: middle; font-size:18px;">陳革維</td>
										<td style="text-align: center; vertical-align: middle; font-size:18px;">2022-05-17</td>										

										<td style="text-align: center; vertical-align: middle;">
 											<button class="btn btn-round btn-danger btn-icon btn-sm remove"><i class="fas fa-times"></i></button>											
										</td>	
									</tr>
								</tbody>
								
							</table>
						</div>
						<!-- end content-->
					</div>
					<!--  end card  -->
				</div>
				<!-- end col-md-12 -->
			</div>
			<!-- end row -->

<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
				<script
					src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
				<script
					src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
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
				<!-- Chart JS -->
				<script src="${pageContext.request.contextPath}/js/plugins/chartjs.min.js"></script>
				<!--  Notifications Plugin    -->
				<script src="${pageContext.request.contextPath}/js/plugins/bootstrap-notify.js"></script>
				<!-- Control Center for Now Ui Dashboard: parallax effects, scripts for the example pages etc -->
				<script src="${pageContext.request.contextPath}/js/now-ui-dashboard.min.js?v=1.6.0"
					type="text/javascript"></script>
				<!-- Now Ui Dashboard DEMO methods, don't include it in your project! -->
				<script src="${pageContext.request.contextPath}/demo/demo.js"></script>

			<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.all.min.js"></script>
			<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
			<script src="sweetalert2.all.min.js"></script>

			<script type="text/javascript">
// 			   import Swal from 'sweetalert2/dist/sweetalert2.js'
// 			   import 'sweetalert2/src/sweetalert2.scss'
			  
// 			   $(".remove").on('click',function(e){  // . 是找class； # 是找 id
// 			 	    e.preventDefault();
				    
// 			 	    let id=$(this).parent().children(":eq(0)").text(); //兩個parent()找到tr，children()往下找td的所有物件， 
// 			 	    console.log(id);
				      
// 			 	    Swal.fire({
// 			 	        title: 'Are you sure?',
// 			 	        text: "You won't be able to revert this!",
// 			 	        icon: 'warning',
// 			 	        showCancelButton: true,
// 			 	        confirmButtonColor: '#3085d6',
// 			 	        cancelButtonColor: '#d33',
// 			 	        confirmButtonText: 'Yes, delete it!'
// 			 	      }).then((result) => {
// 			 	        if (result.isConfirmed) {
// 			 	          Swal.fire(
// 			 	            'Deleted!',
// 			 	            'Your file has been deleted.',
// 			 	            'success'
// 			 	          )
// 			 	          window.location='activity.delete/'id;
// 			 	        }
// 			 	      })
 			</script> 

			<script>
				  		// 模糊查詢
					    $(document).ready(function() {
					      $('#datatable').DataTable({
					        "pagingType": "full_numbers",
					        "lengthMenu": [
					          [10, 25, 50, -1],
					          [10, 25, 50, "All"]
					        ],
					        responsive: true,
					        language: {
					          search: "_INPUT_",
					          searchPlaceholder: "搜尋關鍵字",
					        }
					
					      });
					
					      var table = $('#datatable').DataTable();
					
					      // Edit record
					      table.on('click', '.edit', function() {
					        $tr = $(this).closest('tr');
					        if ($($tr).hasClass('child')) {
					          $tr = $tr.prev('.parent');
					        }
					
					        var data = table.row($tr).data();
// 					        alert('You press on Row: ' + data[0] + ' ' + data[1] + ' ' + data[2] + '\'s row.');
					        alert('確認編輯編號為「' + data[0] + '」的「' + data[2] + '」活動嗎？');
					      });
					
					      // Delete a record
						  table.on('click', '.remove', function(e) {
					      $tr = $(this).closest('tr');
					      if ($($tr).hasClass('child')) {
					        $tr = $tr.prev('.parent');
					      }
					        var data = table.row($tr).data();
//					        alert('You press on Row: ' + data[0] + ' ' + data[1] + ' ' + data[2] + '\'s row.');
					        alert('確認刪除編號為「' + data[0] + '」的「' + data[1] + '」會員嗎？');
	 						  $(this).parent().parent().remove();
						        
					      });


					
					      //Like record 加到我的最愛
					      table.on('click', '.like', function() {
					        alert('You clicked on Like button');
					      });
					    });
					    
  				</script>
</body>
</html>