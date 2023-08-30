<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>dinero優惠券管理</title>
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
<style>
      .background-image_container{
     	min-height: 100%;
     	width: 100%;
    	background-image: url(${pageContext.request.contextPath}/images/背景2.jpg);
    	background-position: center;    
	}
</style>
</head>
<body class="sidebar-mini">

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
								<h4 class="card-title">優惠券管理</h4>
				<form style="display:inline;" action="${pageContext.request.contextPath}/coupon/insert" method="get"> <!-- 新增按鈕 -->
				<button type="submit" class="btn btn-round btn-info btn-icon btn-sm like" name="create" value=""><i class="fas fa-solid fa-plus"></i></button>
				</form>
							<a href="${pageContext.request.contextPath}/coupon/export/excelAll" class="btn btn-round btn-success ">匯出優惠券excel</a>
							</div>
							<div class="card-body">
								<div class="toolbar">
									<!--        Here you can write extra buttons/actions for the toolbar              -->
								</div>
								<table id="datatable" class="table table-striped table-bordered"
									cellspacing="0" width="100%">
									<thead>
										<tr>
											<th>id</th>
											<th>名稱</th>
											<!-- <th>折扣類型</th> -->
											<th>折扣目標</th>
											<th>額度</th>
											<th>單位</th>
											<th>編輯日期</th>
											<th>開始日期</th>
											<th>結束日期</th>
											<th>優惠碼</th>
											<th>同時使用</th>
											<!-- <th>最小購買單位</th> -->
											<th>最大折扣金額</th>
											<!--   <th>描述</th> -->
											 <th class="disabled-sorting text-right">Actions</th>
										</tr>
									</thead>
									<tfoot>
										<tr>
											<th>id</th>
											<th>優惠券名稱</th>
											<!-- <th>折扣類型</th> -->
											<th>折扣目標</th>
											<th>額度</th>
											<th>單位</th>
											<th>編輯日期</th>
											<th>開始日期</th>
											<th>結束日期</th>
											<th>優惠碼</th>
											<th>同時使用</th>
											<!-- <th>最小購買單位</th> -->
											<th>最大折扣金額</th>
											<!--   <th>描述</th> -->
											<th class="disabled-sorting text-right">Actions</th>
										</tr>
									</tfoot>
									<tbody>
										<c:forEach items="${requestScope.coupons}" var="coupon">

											<tr>

												<td>${coupon.couponId}</td>
												<td>${coupon.couponName}</td>
												<!-- <td>${coupon.discountType}</td> -->
												<td>${coupon.discountedClass}</td>
												<td>${coupon.discountValue}</td>
												<td>${coupon.discountUnit}</td>
												<td class='datetrimmer'>${coupon.createDate}</td>
												<td class='datetrimmer'>${coupon.validFrom}</td>
												<td class='datetrimmer'>${coupon.validUntil}</td>
												<td>${coupon.couponCode}</td>
												<td>${coupon.concurrency}</td>
												<!-- <td>${coupon.minimumOrderValue}</td>-->
												<td>${coupon.maximumDiscountAmount}</td>
												<!--   <td>${coupon.describe}</td> -->
												<td>
													<form style="display:inline;" action="#" method="get" > <!-- 推播按鈕 -->
                        								<input type="hidden" name="couponId" value="${coupon.couponId}">
                        								<button type="button" class="btn btn-round btn-info btn-icon btn-sm like" name="pushpush"><i class="fa-solid fa-share"></i></button>
                        							</form>
													<form style="display:inline;" action="${pageContext.request.contextPath}/coupon/update" method="post" > <!-- 修改按鈕 -->
                        								<input type="hidden" name="couponId" value="${coupon.couponId}">
                        								<button type="submit" class="btn btn-round btn-warning btn-icon btn-sm edit"><i class="fa-solid fa-pen-to-square"></i></button>
                        							</form>
													<form style="display:inline;" action="${pageContext.request.contextPath}/coupon/delete" method="post" > <!-- 刪除按鈕 -->
                        								<input type="hidden" name="couponId" value="${coupon.couponId}">
                        								<button type="submit" class="btn btn-round btn-danger btn-icon btn-sm remove"><i class="fas fa-times"></i></button>
                        							</form>												
												</td>
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


	<!--  -->
	<script src="${pageContext.request.contextPath}/js/core/jquery.min.js"></scrip>
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

					var domainName = '/dinero';

					$("button[name='pushpush']").on("click",function(){
						
						let thiscpuponId = $(this).prev().val();
						$.ajax({
							type:"GET",
							url:domainName + '/coupon/push',
							contentType:'text/plain;charset=UTF-8',
							data :{"couponId":thiscpuponId},
							success:function(returnData){
								alert("推送優惠券成功")
							}
						})
					});


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
				});
		 $(".datetrimmer").each(function(index,element){
		     var dateText = $(this).text();
		     var arr = dateText.split('.');
		     $(this).text(arr[0])
		})
				
	</script>
	

</body>
</html>