<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>User Management Application</title>
<link rel="apple-touch-icon" sizes="76x76"
	href="../../assets/img/apple-icon.png">
<link rel="icon" type="image/png" href="../../assets/img/favicon.png">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
  <!--     Fonts and icons     -->
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
  <!-- CSS Files -->
  <link href="/css/bootstrap.min.css" rel="stylesheet" />
  <link href="/css/now-ui-dashboard.css?v=1.6.0" rel="stylesheet" />
  <!-- CSS Just for demo purpose, don't include it in your project -->
  <link href="/demo/demo.css" rel="stylesheet" />
  
</head>
<body class=" sidebar-mini ">
	
	    <div class="wrapper ">

          <jsp:include page="../testSideBar.jsp"></jsp:include>  

        <div class="main-panel" id="main-panel">
          
          	<jsp:include page="../testNavBar.jsp"></jsp:include>
          
<!--             <div class="panel-header panel-header-sm"> -->
<!--             </div> -->
<!--       <div class="panel-header"> -->
<!--       </div> -->
<!--       <div class="content"> -->
<!--         <div class="row"> -->
<!--           <div class="col-md-12"> -->
<!--             <div class="card"> -->
<!--               <div class="card-header"> -->
<!--                 <h4 class="card-title">inside table</h4> -->
<!--               </div> -->
<!--               <div class="card-body"> -->
<!--                 <div class="toolbar"> -->
	                  <!--        Here you can write extra buttons/actions for the toolbar              -->
                </div>
<!--                 <table id="datatable" class="table table-striped table-bordered" cellspacing="0" width="100%"> -->
<!--                   <thead> -->
<!--                     <tr> -->
<!--                       <th>ID</th> -->
<!--                       <th>姓名</th> -->
<!--                       <th>信箱</th> -->
<!--                       <th>帳號</th> -->
<!--                       <th>角色</th> -->
<!--                       <th class="disabled-sorting text-right">Actions</th> -->
<!--                     </tr> -->
<!--                   </thead> -->
<!--                   <tfoot> -->
<!--                     <tr> -->
<!--                       <th>ID</th> -->
<!--                       <th>姓名</th> -->
<!--                       <th>信箱</th> -->
<!--                       <th>帳號</th> -->
<!--                       <th>角色</th> -->
<!--                       <th class="disabled-sorting text-right">Actions</th> -->
<!--                     </tr> -->
<!--                   </tfoot> -->
<!-- 				<tbody> -->
<%-- 					<c:forEach var="user" items="${listUser}" > --%>
<%-- 						<c:url var="loadLink" value="/users.load"> --%>
<%-- 							<c:param name="action" value="load" /> --%>
<%-- 							<c:param name="userId" value="${user.userId}" /> --%>
<%-- 						</c:url> --%>
<%-- 						<c:url var="deleteLink" value="/users.delete"> --%>
<%-- 							<c:param name="action" value="delete" /> --%>
<%-- 							<c:param name="userId" value="${user.userId}" /> --%>
<%-- 						</c:url> --%>
<!-- 						<tr> -->
<%-- 							<td><c:out value="${user.userId}" /></td> --%>
<%-- 							<td><c:out value="${user.name}" /></td> --%>
<%-- 							<td><c:out value="${user.email}" /></td> --%>
<%-- 							<td><c:out value="${user.username}" /></td> --%>
<%-- 							<td><c:out value="${user.roles}" /></td> --%>
<!-- 							<td class="text-right">							 -->
<%-- 							<a href="${loadLink}" class="btn btn-round btn-warning btn-icon btn-sm edit"><i class="far fa-calendar-alt"></i></a>							 --%>
<%-- 							<a href="${deleteLink}" class="btn btn-round btn-danger btn-icon btn-sm remove"><i class="fas fa-times"></i></a> --%>
<!-- 							</td> -->
<!-- 						</tr> -->
<%-- 					</c:forEach> --%>
<!-- 				</tbody> -->
<!--                 </table> -->
              </div><!-- end content-->
            </div><!--  end card  -->
          </div> <!-- end col-md-12 -->
        </div> <!-- end row -->
      </div>
</div>
</div>
<!-- 	<header> -->
<!-- 		<nav class="navbar navbar-expand-md navbar-dark" -->
<!-- 			style="background-color: tomato"> -->
<!-- 			<div> -->
<%-- 				<a href="${pageContext.request.contextPath}/" --%>
<!-- 					class="navbar-brand"> dinero </a> -->

<!-- 			</div> -->
<!-- 			<ul class="navbar-nav navbar-collapse justify-content-end"> -->
<%-- 				<a href="<%=request.getContextPath()%>/logout"">登出</a> --%>
<!-- 		</nav> -->
<!-- 	</header> -->
	
<!-- 		<p> -->
<%-- 		User: <security:authentication property="principal.username" /> --%>
<!-- 		<br><br> -->
<%-- 		Role(s): <security:authentication property="principal.authorities" /> --%>
<!-- 	</p> -->
<!-- 	<div class="row"> -->
<!-- 		<!-- <div class="alert alert-success" *ngIf='message'>{{message}}</div> --> -->
<!-- 		<div class="container"> -->
<!-- 			<h3 class="text-center">List of User</h3> -->
<!-- 			<hr> -->
<!-- 			<div class="container text-left"> -->
<%-- 				<c:url var="newLink" value="/users.new"> --%>
<%-- 					<c:param name="action" value="new" /> --%>
<%-- 				</c:url> --%>
<%-- 				<a href="${newLink}" class="btn btn-success">新增會員</a> --%>
<%-- 				<c:url var="listLink" value="/users"> --%>
<%-- 				<c:param name="action" value="list" /> --%>
<%-- 				</c:url> --%>
<%-- 				<a href="${listLink}" class="btn btn-success">查詢所有會員</a> <br> <br> --%>
<!-- 				<input type="search" class="light-table-filter" -->
<!-- 					data-table="table table-bordered" placeholder="請輸入關鍵字"> -->
<!-- 			</div> -->
<!-- 			<br> -->
<!-- 			<table class="table table-bordered"> -->
<!-- 				<thead> -->
<!-- 					<tr> -->
<!-- 						<th>ID</th> -->
<!-- 						<th>姓名</th> -->
<!-- 						<th>信箱</th> -->
<!-- 						<th>帳號</th> -->
<!-- 						<th>密碼</th> -->
<!-- 					</tr> -->
<!-- 				</thead> -->
<!-- 				<tbody> -->
<%-- 					<c:forEach var="user" items="${listUser}" > --%>
<%-- 						<c:url var="loadLink" value="/users.load"> --%>
<%-- 							<c:param name="action" value="load" /> --%>
<%-- 							<c:param name="userId" value="${user.userId}" /> --%>
<%-- 						</c:url> --%>
<%-- 						<c:url var="deleteLink" value="/users.delete"> --%>
<%-- 							<c:param name="action" value="delete" /> --%>
<%-- 							<c:param name="userId" value="${user.userId}" /> --%>
<%-- 						</c:url> --%>
<!-- 						<tr> -->
<%-- 							<td><c:out value="${user.userId}" /></td> --%>
<%-- 							<td><c:out value="${user.name}" /></td> --%>
<%-- 							<td><c:out value="${user.email}" /></td> --%>
<%-- 							<td><c:out value="${user.username}" /></td> --%>
<%-- 							<td><c:out value="${user.roles}" /></td> --%>
<!-- 							<td class="text-right">							 -->
<%-- 							<a href="${loadLink}" class="btn btn-round btn-warning btn-icon btn-sm edit"><i class="far fa-calendar-alt"></i></a>							 --%>
<%-- 							<a href="${deleteLink}" class="btn btn-round btn-danger btn-icon btn-sm remove"><i class="fas fa-times"></i></a> --%>
<!-- 							</td> -->
<!-- 						</tr> -->
<%-- 					</c:forEach> --%>
<!-- 					} -->
<!-- 				</tbody> -->
<!-- 			</table> -->
<!-- 		</div> -->
		
<!-- 	</div> -->
	
	<!--   Core JS Files   -->
<!--  <script src="/js/core/jquery.min.js"></script> -->
<!--  <script src="/js/core/popper.min.js"></script> -->
<!-- <!--   <script src="/js/core/bootstrap.min.js"></script> --> -->
<!--  <script src="/js/plugins/perfect-scrollbar.jquery.min.js"></script> -->
<!--  <script src="/js/plugins/moment.min.js"></script> -->
<!--  <!--  Plugin for Switches, full documentation here: http://www.jque.re/plugins/version3/bootstrap.switch/ --> -->
<!--  <script src="/js/plugins/bootstrap-switch.js"></script> -->
<!--  <!--  Plugin for Sweet Alert --> -->
<!--  <script src="/js/plugins/sweetalert2.min.js"></script> -->
<!--  <!-- Forms Validations Plugin --> -->
<!--  <script src="/js/plugins/jquery.validate.min.js"></script> -->
<!--  <!--  Plugin for the Wizard, full documentation here: https://github.com/VinceG/twitter-bootstrap-wizard --> -->
<!--  <script src="/js/plugins/jquery.bootstrap-wizard.js"></script> -->
<!--  <!--	Plugin for Select, full documentation here: http://silviomoreto.github.io/bootstrap-select --> -->
<!-- <!--  <script src="/js/plugins/bootstrap-selectpicker.js"></script> --> -->
<!--  <!--  Plugin for the DateTimePicker, full documentation here: https://eonasdan.github.io/bootstrap-datetimepicker/ --> -->
<!--  <script src="/js/plugins/bootstrap-datetimepicker.js"></script> -->
<!--  <!--  DataTables.net Plugin, full documentation here: https://datatables.net/    --> -->
<!--  <script src="/js/plugins/jquery.dataTables.min.js"></script> -->
<!--  <!--	Plugin for Tags, full documentation here: https://github.com/bootstrap-tagsinput/bootstrap-tagsinputs  --> -->
<!--  <script src="/js/plugins/bootstrap-tagsinput.js"></script> -->
<!--  <!-- Plugin for Fileupload, full documentation here: http://www.jasny.net/bootstrap/javascript/#fileinput --> -->
<!--  <script src="/js/plugins/jasny-bootstrap.min.js"></script> -->
<!--  <!--  Full Calendar Plugin, full documentation here: https://github.com/fullcalendar/fullcalendar    --> -->
<!--  <script src="/js/plugins/fullcalendar.min.js"></script> -->
<!--  <!-- Vector Map plugin, full documentation here: http://jvectormap.com/documentation/ --> -->
<!--  <script src="/js/plugins/jquery-jvectormap.js"></script> -->
<!--  <!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ --> -->
<!--  <script src=/js/plugins/nouislider.min.js"></script> -->
<!--  <!--  Google Maps Plugin    --> -->
<!-- <!--   <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script> --> -->
<!--  <!-- Chart JS --> -->
<!--  <script src="/js/plugins/chartjs.min.js"></script> -->
<!--  <!--  Notifications Plugin    --> -->
<!--  <script src="/js/plugins/bootstrap-notify.js"></script> -->
 <!-- Control Center for Now Ui Dashboard: parallax effects, scripts for the example pages etc -->
<!--   <script src="/js/now-ui-dashboard.min.js?v=1.6.0" type="text/javascript"></script>Now Ui Dashboard DEMO methods, don't include it in your project! -->
<!--  <script src="/demo/demo.js"></script> -->
<!--   <script> -->
//     $(document).ready(function() {
//       $('#datatable').DataTable({
//         "pagingType": "full_numbers",
//         "lengthMenu": [
//           [10, 25, 50, -1],
//           [10, 25, 50, "All"]
//         ],
//         responsive: true,
//         language: {
//           search: "_INPUT_",
//           searchPlaceholder: "Search records",
//         }

//       });

//       var table = $('#datatable').DataTable();

//       // Edit record
//       table.on('click', '.edit', function() {
//         $tr = $(this).closest('tr');
//         if ($($tr).hasClass('child')) {
//           $tr = $tr.prev('.parent');
//         }

//         var data = table.row($tr).data();
//         alert('You press on Row: ' + data[0] + ' ' + data[1] + ' ' + data[2] + '\'s row.');
//       });

//       // Delete a record
//       table.on('click', '.remove', function(e) {
//         $tr = $(this).closest('tr');
//         if ($($tr).hasClass('child')) {
//           $tr = $tr.prev('.parent');
//         }
//         table.row($tr).remove().draw();
//         e.preventDefault();
//       });


//     });
<!--   </script> -->
	
</body>
</html>