<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"
	charset="UTF-8" />
<title>建立購優惠券</title>
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

<style type="text/css">
.form-group {
	margin-top: 2em;
}

.align-center {
	display: flex;
	align-items: center;
}

.error {
	color: red
}
</style>



<link rel="stylesheet"
	href="${pageContext.request.contextPath}/gewei/jquery-ui.min.css" />

<!--date picker-->
<link rel="stylesheet"
	href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">

<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>

<!--font-->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC:wght@300;400&display=swap" rel="stylesheet">


<script type="text/javascript">
	$(function() {

		var domainName = '/dinero';

		//時間相關
		var dateFormat = "yy/mm/dd", from = $("#validFromDate").datepicker({
			dateFormat : dateFormat,
			defaultDate : "+1w",
			changeMonth : true,
			numberOfMonths : 3
		}).on("change", function() {
			to.datepicker("option", "minDate", getDate(this));
		}), to = $("#validUntilDate").datepicker({
			dateFormat : dateFormat,
			defaultDate : "+1w",
			changeMonth : true,
			numberOfMonths : 3
		}).on("change", function() {
			from.datepicker("option", "maxDate", getDate(this));
		});

		function getDate(element) {
			var date;
			try {
				date = $.datepicker.parseDate(dateFormat, element.value);
			} catch (error) {
				date = null;
			}

			return date;
		}

		$("#validFromTime").timepicker({
			timeFormat : "HH:mm:ss", // 時間隔式
			interval : 60, //時間間隔
			minTime : "10", //最小時間
			//maxTime: "6:00pm", //最大時間
			defaultTime : "11", //預設起始時間
			startTime : "10:00", // 開始時間
			dynamic : true, //是否顯示項目，使第一個項目按時間順序緊接在所選時間之後
			dropdown : true, //是否顯示時間條目的下拉列表
			scrollbar : true, //是否顯示捲軸
		});

		$("#validUntilTime").timepicker({
			timeFormat : "HH:mm:ss",
			interval : 60,
			minTime : "10",
			defaultTime : "11",
			startTime : "10:00",
			dynamic : true,
			dropdown : true,
			scrollbar : true,
		});

		var fromDateAndTime = '';

		$("#validFromDate").on("change", function() {
			fromDateAndTime = '';//reset date
			$("#validFrom").val('');
			fromDateAndTime = $("#validFromDate").val() + " "; //append to var
			console.log(fromDateAndTime)
		});

		var fromTime = '';
		$("#validFromTime").on("change", function() {
			fromTime = '';

			$("#validFrom").val('');

			fromTime = $("#validFromTime").val();

			console.log("before return")
			if (fromDateAndTime == '') {
				return;
			}
			fromDateAndTime += fromTime;
			console.log(fromDateAndTime)
		})

		var toDateAndTime = '';

		$("#validUntilDate").on("change", function() {
			toDateAndTime = '';//reset
			$("#validUntil").val('');

			toDateAndTime = $("#validUntilDate").val() + " ";

		});

		//生成日期
		var toTime = '';

		$("#testappend")
				.on(
						"click",
						function() {
							$("#validFrom").val('');
							$("#validUntil").val('');

							setValidInput("from");
							setValidInput("until");

							$("#validFrom").val(fromDateAndTime);
							$("#validUntil").val(toDateAndTime);
							fromDateAndTime = '';
							toDateAndTime = '';

							//用 ajax 確認相同時間區段內是否已有 優惠?

							var validFrom = $("#validFrom").val();
							var validUntil = $("#validUntil").val();
							console.log(validFrom)
							console.log(validUntil)

							$
									.ajax({
										type : 'GET',
										url : domainName
												+ '/coupon/alreadyExistCoupons',
										contentType : 'text/plain ; charset=UTF-8',
										data : {
											"validFrom" : validFrom,
											"validUntil" : validUntil
										},
										success : function(returnData) {
											console.log("test from ajax")
											console.log(returnData)

											$("#searchedTable").empty();
											if (returnData.length === 0) {
												$("#searchedTable")
														.append(
																"<tr><td>暫無資料<td/><tr/>")
											} else {
												var table = $("#searchedTable");
												table
														.append("<tr id='ptitle'><th class='text-left'>ID</th><th class='text-left'>優惠券類型</th><th class='text-left'>開始日期</th><th class='text-left'>結束日期</th><th class='text-left'>代碼</th></tr>");
												$
														.each(
																returnData,
																function(i, n) {
																	var tr = "<tr align='center'>"
																			+ "<td class='text-left'>"
																			+ n.couponId
																			+ "</td>"
																			+ "<td class='text-left'>"
																			+ n.discountType
																			+ "</td>"
																			+ "<td class='text-left'>"
																			+ n.validFrom
																			+ "</td>"
																			+ "<td class='text-left'>"
																			+ n.validUntil
																			+ "</td>"
																			+ "<td class='text-left'>"
																			+ n.couponCode
																			+ "</td>"
																			+ "</tr>";
																	console
																			.log(tr)
																	table
																			.append(tr);
																})
											}

										}
									})
						});

		//生成日期時間會用到的 function
		function setValidInput(fromOrUntil) {
			if (fromOrUntil === "from") {

				toTime = '';

				$("#validUntil").val('');

				toTime = $("#validUntilTime").val();

				if (toDateAndTime == '') {
					return;
				}
				toDateAndTime += toTime
				console.log(toDateAndTime)

			} else if (fromOrUntil === "until") {

				fromTime = '';

				$("#validFrom").val('');

				fromTime = $("#validFromTime").val();

				console.log("before return")
				if (fromDateAndTime == '') {
					return;
				}
				fromDateAndTime += fromTime;
				console.log(fromDateAndTime)

			}
		}

		//用 ajax 確認優惠id是否重複

		$("#couponCode").on("keyup", function() {

			let couponInput = $(this).val();

			$.ajax({
				type : "GET",
				url : domainName + '/coupon/couponCode',
				contentType : 'text/plain ;charset=UTF-8',
				data : {
					"couponInput" : couponInput
				},
				success : function(returnData) {
					console.log(returnData);
					if (returnData === 'Y') {
						$("#couponRepeatMessage").text("優惠券未重複");
					} else if (returnData === 'N') {
						$("#couponRepeatMessage").text("優惠券重複，禁止使用");
					}

				}
			})

		})

		//ajax 依照優惠券類型 生成可選擇 class
		function typeChange(discountType) {

			var requestUrl = '';

			if (discountType === 'CartDiscount') {
				$("#discountedClass").val('');
				$("#discountedClassSelect").hide();
				return;
			}

			if (discountType === 'ProductDiscount') {
				$("#discountedClassSelect").show();
				requestUrl = '/coupon/giveyouallproductname'
			}
			if (discountType === 'ProductCategoryDiscount') {
				$("#discountedClassSelect").show();
				requestUrl = '/coupon/giveyouallproducttype';
			}

			$.ajax({
				type : "GET",
				url : domainName + requestUrl,
				success : function(returnData) {
					changeOptions(returnData);
					changeBeansOptions();
				}
			})
		}

		function changeOptions(array) {
			$("#discountedClassSelect").empty();
			$.each(array, function(i, element) {
				console.log(element);
				console.log(typeof element);
				//$("#discountedClassSelect").append(`<option></option>`).attr("value",element).text(element);
				$("#discountedClassSelect").append(
						'<option value=" ' + element+' "> ' + element
								+ '</option>');
			})
		}

		function changeBeansOptions() {
			$("#discountedClass").val('');
			let x = $("#discountedClassSelect").val();
			$("#discountedClass").val(x);
		}

		$("#discountType").on("change", function() {
			$("#discountedClass").val('');
			var selectedType = $("#discountType").val();
			typeChange(selectedType);

		})

		$("#discountedClassSelect").on("change", function() {
			changeBeansOptions();
		})

		//載入時先跑一次
		typeChange($("#discountType").val());
		changeBeansOptions();
	});

	$(function() {
		
		$("label").css({
			"color" : "black",
			"font-size" : "18px",
			"font-family" : "'Noto Sans TC'"
		})

		$('.paddingzero').css({'padding':'0'})

		$('.paddingleftzero').css({'padding-left':'0'})

		$('.marginleftzero').css({'margin-left':'0'})

		$(".margincontrol").css({"margin-left":"35px"})

		$('.dateerror').css({'padding-top':'30px','display':'inline-box'})

		$('button').css({"font-size": "18px"})

		$('#onepunch').on('click',function(){
			$("#cname").val("母親節優惠券")
			$('#cblablabla').val("你想找的網路人氣推薦母親節折扣卷商品就在dinero購物！買母親節折扣卷立即上蝦皮台灣商品專區享超低折扣優惠，搭配賣家評價安心網購超簡單！")
			$('#cdisvalue').val(300);
			$('#cminamount').val(1);
			$('#cmax').val(500);
		})
	})
</script>

</head>

<body class=" sidebar-mini ">

	<div class="wrapper ">

		<jsp:include page="../testSideBar.jsp"></jsp:include>

		<div class="main-panel" id="main-panel">

			<jsp:include page="../testNavBar.jsp"></jsp:include>

			<div class="panel-header panel-header-sm"></div>
			<div class="content">
				<div class="row">
					<div class="col-md-8 ml-auto mr-auto">
						<div class="card">
							<div class="card-header ">
								<h4 class="card-title">新增優惠券</h4>
							</div>
							<div class="card-body align-items-center paddingleftzero">
								

								<form:form action="insert" method="post"
									modelAttributes="command">

									<c:if test="${not empty command.couponId}">
										<div class="form-group">
											<label class="margincontrol">優惠券id <form:input path="couponId"
													cssClass="form-control " readonly="true"/></label>
										</div>
									</c:if>

									<div class="form-group">
										<label class="margincontrol">優惠券名稱 <form:input path="couponName"
												cssClass="form-control" id="cname"/></label>
										<form:errors path="couponName" cssClass="error" />
									</div>
									<p class="margincontrol">此優惠券名稱將會在信件推播、顧客使用時顯示，請輸入符合主題的名稱</p>
							</div>

							<hr>

							<div class="form-group">
								<label for="exampleFormControlSelect1" class="margincontrol">請選擇折扣類型

								<form:select path="discountType" id="discountType"
									cssClass="form-control  paddingleftzero">
									<form:options items="${discountTypeList}" />
								</form:select>
								<p >1.對於某項商品 2.對於某項商品種類 3.對於整個購物車</p>
							</div>

							<hr>

							<div class="form-group">
								<label for="exampleFormControlSelect1" class="margincontrol">請選擇折扣目標</label> <select
									class="form-control col-md-4 margincontrol" id="discountedClassSelect">
								</select>
								<%-- 										<form:input path="discountedClass" id="discountedClass" /> --%>
								<form:hidden path="discountedClass" id="discountedClass" />
							</div>

							<hr>


							<div class="form-group">
								<label  class="margincontrol">請輸入折扣額度 <form:input path="discountValue"
										cssClass="form-control  marginleftzero" id="cdisvalue"/></label>
								<form:errors path="discountValue" cssClass="error" />
							</div>



							<hr>

							<div class="form-group">
								<label class="margincontrol">選擇單位</label>
								<form:errors path="discountUnit" cssClass="error" />


								<div class="form-check form-check-radio form-check-inline">
									<label class="form-check-label"> % <form:radiobutton
											path="discountUnit" value="%" cssClass="form-check-input" />
										<span class="form-check-sign"></span>
									</label>
								</div>

								<div class="form-check form-check-radio form-check-inline">
									<label class="form-check-label"> dollar <form:radiobutton
											path="discountUnit" value="dollar"
											cssClass="form-check-input" /> <span class="form-check-sign"></span>
									</label>
								</div>

								<p class="margincontrol">請選擇要以百分比或者固定值為折扣單位
								</p>
							</div>

							<hr>

							<div class="form-group">
								<button type="button" id="testappend" class="margincontrol btn btn-warning">確認日期起訖區間</button>
								<div class="row ">
									<label class="col-sm-2 col-form-label align-center margincontrol">開始日期</label>

									<div class="col-sm-9 ">
										<div class="row">
											<label class="col-xs-3 col-form-label align-center">日期</label>
											<div class="col-md-4 align-center">
												<div class="form-group ">
													<input type="text" id="validFromDate" class="form-control"
														autocomplete="off" />
												</div>
											</div>
											<label class="col-xs-3 col-form-label align-center">時間</label>
											<div class="col-md-4 align-center">
												<div class="form-group">
													<input type="text" id="validFromTime" name="validFromTime"
														class="form-control" />
												</div>
											</div>
											<%-- 													<form:input path="validFrom" id="validFrom" /> --%>
											<form:hidden path="validFrom" id="validFrom" />
											<form:errors path="validFrom" cssClass="error dateerror" />
										</div>
									</div>
								</div>

								<div class="row ">
									<label class="col-sm-2 col-form-label align-center margincontrol">結束日期</label>

									<div class="col-sm-9 ">
										<div class="row">
											<label class="col-xs-3 col-form-label align-center">日期</label>
											<div class="col-md-4 align-center">
												<div class="form-group ">
													<input type="text" id="validUntilDate" class="form-control"
														autocomplete="off" />
												</div>
											</div>
											<label class="col-xs-3 col-form-label align-center">時間</label>
											<div class="col-md-4 align-center">
												<div class="form-group">
													<input type="text" id="validUntilTime" name="validFromTime"
														class="form-control" />
												</div>
											</div>

											<%-- 													<form:input path="validUntil" id="validUntil" /> --%>
											<form:hidden path="validUntil" id="validUntil" />
											<form:errors path="validUntil" cssClass="error dateerror" />

										</div>
									</div>
								</div>
								<p class="margincontrol">輸入日期完畢後，將顯示時間區段內已存在之優惠券</p>
							</div>



							<div class="col-md-12">
								<div class="card">

									<div class="card-body">
										<div class="table-responsive">
											<table class="table" id="searchedTable">

											</table>
										</div>
									</div>
								</div>
							</div>

							<hr>

							<div class="form-group">
								<label class="margincontrol">設定優惠碼 <form:input path="couponCode"
										id="couponCode" cssClass="form-control" autocomplete="off" /></label>
								<form:errors path="couponCode" cssClass="error" />
								<span id="couponRepeatMessage"></span>
								<p class="margincontrol">請輸入與資料庫中不重複字串</p>
							</div>

							<hr>

							<div class="form-group">
								<label class="margincontrol">可否同時使用</label>
								<div class="form-check form-check-radio form-check-inline">
									<label class="form-check-label"> 能 <form:radiobutton
											path="concurrency" value="true" cssClass="form-check-input" />
										<span class="form-check-sign"></span>
									</label>
								</div>

								<div class="form-check form-check-radio form-check-inline">
									<label class="form-check-label"> 否 <form:radiobutton
											path="concurrency" value="false" cssClass="" /> <span
										class="form-check-sign"></span> <form:errors
											path="concurrency" cssClass="error" />
									</label>
								</div>
								<p class="margincontrol">此優惠券能否與其他優惠券同時使用?  <br/>若為否顧客只能選擇1張</p>
							</div>

							<hr>



							<div class="form-group">
								<div class="row ">
									<label class="col-sm-2 col-form-label align-center margincontrol">優惠限制</label>
									<div class="col-sm-9 ">
										<div class="row">
											<label class="col-xs-3 col-form-label align-center">最小購買單位</label>
											<div class="col-md-4 align-center">
												<div class="form-group ">
													<form:input path="minimumOrderValue"
														cssClass="form-control" id="cminamount"/>
													<form:errors path="minimumOrderValue" cssClass="error" />
												</div>
											</div>
											<label class="col-xs-3 col-form-label align-center">最大折扣金額</label>
											<div class="col-md-4 align-center">
												<div class="form-group">
													<form:input path="maximumDiscountAmount"
														cssClass="form-control" id="cmax"/>
													<form:errors path="maximumDiscountAmount" cssClass="error" />
												</div>
											</div>

										</div>
									</div>
								</div>
								<p class="margincontrol">若同時套用多張優惠券，將取最大優會金額最低者</p>
							</div>
							<hr>
							<div class="form-group">
								<label class=" margincontrol">請輸入文字描述</label>
								<form:textarea path="describe" cssClass="form-control" rows="5"  id="cblablabla"/>
							</div>

							<div class="card-footer ">
								<button type="submit" class="btn btn-fill btn-primary"
									value="submit">建立優惠券</button>
								<button type="button" class="btn btn-fill btn-info margincontrol" id="onepunch"
									value="submit">一鍵輸入</button>
							</div>
							</form:form>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!--   Core JS Files   -->
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
		<script
			src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
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


		<script
			src="${pageContext.request.contextPath}/gewei/jquery-ui.min.js"></script>
		<script
			src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
</body>

</html>