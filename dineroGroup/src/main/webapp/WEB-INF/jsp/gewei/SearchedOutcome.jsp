<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="/SearchError.jsp"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>訂單搜尋結果</title>
<link rel="apple-touch-icon" sizes="76x76"
	href="${pageContext.request.contextPath}/img/apple-icon.png">
<link rel="icon" type="image/png"
	href="${pageContext.request.contextPath}/img/favicon.png">
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
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
	rel="stylesheet" />
<!-- CSS Files -->
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/css/now-ui-dashboard.css?v=1.6.0"
	rel="stylesheet" />
<!-- CSS Just for demo purpose, don't include it in your project -->
<link href="${pageContext.request.contextPath}/demo/demo.css"
	rel="stylesheet" />

</head>
<body class=" sidebar-mini ">

	<div class="wrapper ">

		<jsp:include page="../testSideBar.jsp"></jsp:include>

		<div class="main-panel" id="main-panel">

			<jsp:include page="../testNavBar.jsp"></jsp:include>
			<div class="panel-header"></div>
			<div class="content">
				<div class="row">
					<div class="col-md-12">
						<div class="card">
							<div class="card-header">
								<h4 class="card-title">搜尋結果</h4>
							</div>
							<div class="card-body">
								<div class="toolbar">
									<!--        Here you can write extra buttons/actions for the toolbar              -->
									<a href="${pageContext.request.contextPath}/cart/export/excelSearched" class="btn btn-round btn-info ">匯出excel</a>
								</div>
								<table id="datatable" class="table table-striped table-bordered"
									cellspacing="0" width="100%">
									<thead>
										<tr>
                        <th>訂單編號</th>
                        <th>顧客編號</th>
                        <th>顧客名稱</th>
                        <th>訂單總額</th>
                        <th>交易日期</th>
                        <th>訂單狀態</th>
                      
                        <th class="disabled-sorting text-right">訂單明細</th>
										</tr>
									</thead>
									<tfoot>

										<tr>
                        <th>訂單編號</th>
                        <th>顧客編號</th>
                        <th>顧客名稱</th>
                        <th>訂單總額</th>
                        <th>交易日期</th>
                        <th>訂單狀態</th>

                        <th >訂單明細</th>
										</tr>

									</tfoot>
									<tbody>
										<c:forEach items="${requestScope.searchedOrds}" var="ord">

											<tr>

												<td>${ord.cartId}</td>
												<td>${ord.custId}</td>
												<td>${userService.findUserNameById(ord.custId)}</td>
												<td>${ord.cartTotal}</td>
												<td class="datetrimmer">${ord.tradeDate}</td>
                                                <td class="ordersta">${ord.orderState}</td>
												<td class="disabled-sorting text-right"><a  class="btn btn-round btn-info"
													href="${pageContext.request.contextPath}/cart/${ord.cartId}">明細</a></td>


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



	<!--  -->
	<script src="${pageContext.request.contextPath}/js/core/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/core/popper.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/core/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/plugins/perfect-scrollbar.jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/plugins/moment.min.js"></script>
	<!--  Plugin for Switches, full documentation here: http://www.jque.re/plugins/version3/bootstrap.switch/ -->
	<script
		src="${pageContext.request.contextPath}/js/plugins/bootstrap-switch.js"></script>
	<!--  Plugin for Sweet Alert -->
	<script
		src="${pageContext.request.contextPath}/js/plugins/sweetalert2.min.js"></script>
	<!-- Forms Validations Plugin -->
	<script
		src="${pageContext.request.contextPath}/js/plugins/jquery.validate.min.js"></script>
	<!--  Plugin for the Wizard, full documentation here: https://github.com/VinceG/twitter-bootstrap-wizard -->
	<script
		src="${pageContext.request.contextPath}/js/plugins/jquery.bootstrap-wizard.js"></script>
	<!--	Plugin for Select, full documentation here: http://silviomoreto.github.io/bootstrap-select -->
	<script
		src="${pageContext.request.contextPath}/js/plugins/bootstrap-selectpicker.js"></script>
	<!--  Plugin for the DateTimePicker, full documentation here: https://eonasdan.github.io/bootstrap-datetimepicker/ -->
	<script
		src="${pageContext.request.contextPath}/js/plugins/bootstrap-datetimepicker.js"></script>
	<!--  DataTables.net Plugin, full documentation here: https://datatables.net/    -->
	<script
		src="${pageContext.request.contextPath}/js/plugins/jquery.dataTables.min.js"></script>
	<!--	Plugin for Tags, full documentation here: https://github.com/bootstrap-tagsinput/bootstrap-tagsinputs  -->
	<script
		src="${pageContext.request.contextPath}/js/plugins/bootstrap-tagsinput.js"></script>
	<!-- Plugin for Fileupload, full documentation here: http://www.jasny.net/bootstrap/javascript/#fileinput -->
	<script
		src="${pageContext.request.contextPath}/js/plugins/jasny-bootstrap.min.js"></script>
	<!--  Full Calendar Plugin, full documentation here: https://github.com/fullcalendar/fullcalendar    -->
	<script
		src="${pageContext.request.contextPath}/js/plugins/fullcalendar.min.js"></script>
	<!-- Vector Map plugin, full documentation here: http://jvectormap.com/documentation/ -->
	<script
		src="${pageContext.request.contextPath}/js/plugins/jquery-jvectormap.js"></script>
	<!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
	<script
		src="${pageContext.request.contextPath}/js/plugins/nouislider.min.js"></script>
	<!--  Google Maps Plugin    -->
	<!-- Chart JS -->
	<script
		src="${pageContext.request.contextPath}/js/plugins/chartjs.min.js"></script>
	<!--  Notifications Plugin    -->
	<script
		src="${pageContext.request.contextPath}/js/plugins/bootstrap-notify.js"></script>
	<!-- Control Center for Now Ui Dashboard: parallax effects, scripts for the example pages etc -->
	<script
		src="${pageContext.request.contextPath}/js/now-ui-dashboard.min.js?v=1.6.0"
		type="text/javascript"></script>
	<!-- Now Ui Dashboard DEMO methods, don't include it in your project! -->
	<script src="${pageContext.request.contextPath}/demo/demo.js"></script>
	<script>
		$(document).ready(
				function() {
					$('#datatable').DataTable(
							{
								"pagingType" : "full_numbers",
								"lengthMenu" : [ [ 10, 25, 50, -1 ],
										[ 10, 25, 50, "All" ] ],
								responsive : true,
								language : {
									search : "_INPUT_",
									searchPlaceholder : "Search records",
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
						alert('You press on Row: ' + data[0] + ' ' + data[1]
								+ ' ' + data[2] + '\'s row.');
					});

					// Delete a record
					table.on('click', '.remove', function(e) {
						$tr = $(this).closest('tr');
						if ($($tr).hasClass('child')) {
							$tr = $tr.prev('.parent');
						}
						table.row($tr).remove().draw();
						e.preventDefault();
					});

					//Like record
					table.on('click', '.like', function() {
						alert('You clicked on Like button');
					});

			        $(".ordersta").each(function (index, element) {
			            let content = $(this).text();

			            if (content === "Pending") {
			              $(this).text("待出貨");
			            } else if (content === "Refunded") {
			              $(this).text("退款申請中");
			            } else if (content === "Refused") {
			              $(this).text("退款不受理");
			            } else if (content === "Shipped") {
			              $(this).text("運送中");
			            } else if (content === "Confirmed") {
			              $(this).text("已完成");
			            } else if (content === "Cancelled") {
			              $(this).text("已取消");
			            }
			          });

			        function orderStateChinese() {
			            $(".ordersta").each(function (index, element) {
			              let content = $(this).text();

			              if (content === "Pending") {
			                $(this).text("待出貨");
			              } else if (content === "Refunded") {
			                $(this).text("退款申請中");
			              } else if (content === "Refused") {
			                $(this).text("退款不受理");
			              } else if (content === "Shipped") {
			                $(this).text("運送中");
			              } else if (content === "Confirmed") {
			                $(this).text("已完成");
			              } else if (content === "Cancelled") {
			                $(this).text("已取消");
			              }
			            });
			          }

			          window.setInterval(orderStateChinese, 500);

			          $(".datetrimmer").each(function (index, element) {
			              var dateText = $(this).text();
			              var arr = dateText.split(".");
			              $(this).text(arr[0]);
			            });
				});
	</script>
</body>
</html>