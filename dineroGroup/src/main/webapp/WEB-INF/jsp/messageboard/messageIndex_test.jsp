<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.dinero.model.MessageRepository"%>
<%@page import="org.hibernate.Session"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<title>後台管理者-留言板</title>

<!-- jQuery CDN-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"> -->
<link rel="apple-touch-icon" sizes="76x76"
	href="${pageContext.request.contextPath}/img/apple-icon.png">
<link rel="icon" type="image/png" href="${pageContext.request.contextPath}/img/favicon.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no'
	name='viewport' />
<!--     Fonts and icons     -->
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.1/css/all.css"
	integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr"
	crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
	
	<style>
        th{
            text-align:center;
        }
        table{
            text-align:center;
        }
        .fixedhead{
            position: fixed;
        }
    </style>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
	rel="stylesheet" />
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
<!-- Include 套版 -->
		<jsp:include page="../testSideBar.jsp"></jsp:include>

		<div class="main-panel" id="main-panel">

			<jsp:include page="../testNavBar.jsp"></jsp:include>
			        <div class="panel-header">
        		<div class="background-image_container">
            </div>
        </div>
			
			<div class="content">
				<div class="content">
					<div class="row">
						<div class="col-md-12">
							<div class="card">
								<div class="card-header">
									<h4 class="card-title">Message Management System</h4><br>
									<!--搜尋 -->

<!-- <%-- 																		<c:url var="newLink" value="/users.new"> --%>
<%-- 																			<c:param name="action" value="new" /> --%>
<%-- 																		</c:url> --%>
<%-- 																		<a href="${newLink}" class="btn btn-primary">新增會員</a> --%>
<%-- 																		<c:url var="listLink" value="/users"> --%>
<%-- 																			<c:param name="action" value="list" /> --%>
<%-- 																		</c:url> --%>
<%-- 																		<a href="${listLink}" class="btn btn-primary">查詢所有會員</a> <br> --%> -->
<!-- 																		<br> -->



									<form action="${pageContext.request.contextPath}/categoryMng" method="get" style="display: inline">
										<label>文章查詢</label> <input placeholder="請輸入文章分類" name="category" /> <input
											type="submit"  value="Scearch" class="btn btn-primary btn-sm">
									</form>

									<!--Show All -->
<!-- 									<a href="messagesIndex" class="btn btn-secondary btn-sm">show all</a> -->
									<div class="d-grid gap-2 d-md-flex justify-content-md-end">
										<a href="${pageContext.request.contextPath}/messageInsert" >
											<button class="btn btn-danger btn-sm">新增</button>
										</a>
									</div>


									<div class="card-body">
										<div class="toolbar">
											<!--        Here you can write extra buttons/actions for the toolbar              -->
										</div>
										<table id="datatable" class="table table-striped table-bordered" cellspacing="0" width="100%">
											<table class="table table-hover">
											<thead>
												<tr>
<!-- 													<th>  </th> -->
													<th>分類</th>
													<th>標題</th>
													<th>文章</th>
													<th>圖片</th>
<!-- 													<th>建立時間</th> -->
													<th>編輯時間</th>
													<!-- <th>留言回應</th> -->
													<th class="disabled-sorting text-right"></th>
												</tr>
											</thead>
											<tfoot>
												<tr>
<!-- 													<th>  </th> -->
													<th>分類</th>
													<th>標題</th>
													<th>文章</th>
													<th>圖片</th>
<!-- 													<th>建立時間</th> -->
													<th>編輯時間</th>
													<!-- <th>留言回應</th> -->
													<th class="disabled-sorting text-right">Actions</th>
												</tr>
											</tfoot>
											<tbody>
												<c:forEach var="message" items="${messages}">
													<c:url var="loadLink" value="${pageContext.request.contextPath}/users/edit/${user.userId }">
														<c:param name="action" value="load" />
														<c:param name="userId" value="${user.userId}" />
													</c:url>
													<c:url var="deleteLink" value="${pageContext.request.contextPath}/users.delete">
														<c:param name="action" value="delete" />
														<c:param name="userId" value="${user.userId}" />
													</c:url>
													<tr>
													<td width="1px" style="display:none"><c:out value="${message.messageId}" /></td>
														<td width="100px"><c:out value="${message.category}" /></td>
														<td width="200px"><c:out value="${message.messagetitle}" /></td>
														<td width="400px"><c:out value="${message.message}" /></td>
														<td><img width="200x"
															src="<c:out value="${message.picBase64}"/>" /></td>
<%-- 														<td><c:out value="${message.posttime}" /></td> --%>
														<td width="100px"><c:out value="${message.modifytime}" /></td>
<%-- 														<td width="150px"><c:out value="${message.modifytime}" /></td> --%>
														<td class="text-right">
														<a class="updatehref" href="${pageContext.request.contextPath}/messageUpdate?messageId=${message.messageId}&messagetitle=${message.messagetitle}&message=${message.message}&pic${pic}">
														<i class="fa-solid fa-pen"></i>
															</a> 
															<a class="deletehref" href="${pageContext.request.contextPath}/messageDelete?messageId=${message.messageId}">
															<i class="btn btn-danger btn-sm">
															<i class="fa-solid fa-trash-can"></i>
															</a></td>
													</tr>
												</c:forEach>
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
					</div>
				</div>
			</div>
<%-- <%-- 						<c:forEach var="message" items="${messages}">
<!-- 							<tr> -->
								<td>${message.messageId}</td>
								<td>${message.messagetitle}</td>
								<td>${message.message}</td>
								<td><img style="width: 200px" src="${message.picBase64}"></td>
<!-- 								<br> -->
								<td>${message.posttime}</td>
								<td>${message.modifytime}</td>
<!-- 								<td> -->
									<a href="messageboard/messageUpdate.jsp?messageId=${message.messageId}&messagetitle=${message.messagetitle}&message=${message.message}&messagetime=${message.messagetime}" class="btn btn-secondary btn-sm">修改</a>
<!-- 									<a -->
									href="messageUpdate?messageId=${message.messageId}&messagetitle=${message.messagetitle}&message=${message.message}&pic${pic}"
<!-- 									class="btn btn-secondary btn-sm">修改</a> <a -->
									href="messageDelete?messageId=${message.messageId}"
<!-- 									class="btn btn-danger btn-sm">刪除</a> -->
<!-- 								</td> -->
<!-- 							</tr> -->
						</c:forEach> --%>
<!-- 					</tbody> -->
<!-- 				</table> -->
<!-- 				<div class="row"></div> -->
<!-- 				</div> -->
				<!-- 	<div class="container" style="background-color:#F3F3FA ; border:2px solid black"> -->


				<!-- 	</div> -->








				<!--   Core JS Files   -->
				<script src="${pageContext.request.contextPath}"></script>
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
					<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.all.min.js"
					type="text/javascript"></script>
				<!-- Now Ui Dashboard DEMO methods, don't include it in your project! -->
				<script src="${pageContext.request.contextPath}/demo/demo.js"></script>
			
				<script>
					$(document).ready(function() {
						$('#datatable').DataTable(
								{"pagingType" : "full_numbers","lengthMenu" : [[ 10, 25,50,-1 ],[ 10, 25,50,"All" ] ],responsive : true,
									 language : {search : "_INPUT_",searchPlaceholder : "Search records",}
														});

										var table = $('#datatable').DataTable();

										// Edit record

										// Delete a record

										//Like record

									});
					
			$(".deletehref").on('click',function(e){
				e.preventDefault();
				let id=$(this).parent().parent().children(":eq(0)").text(); //兩個parent()找到tr，children()往下找td的所有物件，
				console.log(id);
				Swal.fire({
					  title: 'Are you sure?',
					  text: "You won't be able to revert this!",
					  icon: 'warning',
					  showCancelButton: true,
					  confirmButtonColor: '#3085d6',
					  cancelButtonColor: '#d33',
					  confirmButtonText: 'Yes, delete it!'
					}).then((result) => {
					  if (result.isConfirmed) {
					    Swal.fire(
					      'Deleted!',
					      'Your file has been deleted.',
					      'success'
					    )
					    window.location='messageDelete?messageId='+id;
					  }
					})
				
				
			});
				</script>
</body>
</html>