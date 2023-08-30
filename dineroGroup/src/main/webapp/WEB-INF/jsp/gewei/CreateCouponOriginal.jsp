<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">	
<title>Insert title here</title>
<style>
.error {
	color: red
}
</style>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/gewei/jquery-ui.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/gewei/jquery-ui.min.css" />

<!--date picker-->
<link rel="stylesheet"
	href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<script
	src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
<script>
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
														.append("<tr id='ptitle'><th>ID</th><th>優惠券類型</th><th>開始日期</th><th>結束日期</th><th>代碼</th></tr>");
												$
														.each(
																returnData,
																function(i, n) {
																	var tr = "<tr align='center'>"
																			+ "<td>"
																			+ n.couponId
																			+ "</td>"
																			+ "<td>"
																			+ n.discountType
																			+ "</td>"
																			+ "<td>"
																			+ n.validFrom
																			+ "</td>"
																			+ "<td>"
																			+ n.validUntil
																			+ "</td>"
																			+ "<td>"
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
		function typeChange(discountType){

				var requestUrl = '';

				if(discountType === 'CartDiscount'){
					$("#discountedClass").val('');
					$("#discountedClassSelect").hide();
					return;
				}

				if(discountType === 'ProductDiscount'){
					$("#discountedClassSelect").show();
					requestUrl = '/coupon/giveyouallproductname'
				}
				if(discountType=== 'ProductCategoryDiscount'){
					$("#discountedClassSelect").show();
					requestUrl = '/coupon/giveyouallproducttype';
				}

				$.ajax({
					type:"GET",	
					url: domainName + requestUrl,
					success: function(returnData){
						changeOptions(returnData);
						changeBeansOptions();
					}
				})
		}

		function changeOptions(array){
			$("#discountedClassSelect").empty();
			$.each(array , function(i,element){
				console.log(element);
				console.log(typeof element);
				//$("#discountedClassSelect").append(`<option></option>`).attr("value",element).text(element);
				$("#discountedClassSelect").append('<option value=" ' + element+' "> '+ element+'</option>');
			})
		}

		function changeBeansOptions(){
			$("#discountedClass").val('');
			let x = $("#discountedClassSelect").val();
			$("#discountedClass").val(x);
		}

		$("#discountType").on("change",function(){
			$("#discountedClass").val('');
			 var selectedType =$("#discountType").val();
			 typeChange(selectedType);
			
		})

		$("#discountedClassSelect").on("change",function(){
			changeBeansOptions();
		})

		//載入時先跑一次
		typeChange($("#discountType").val());
		changeBeansOptions();
	});
</script>

</head>

<body>
	<button type="button" id="testappend">testappend</button>

	<form:form action="insert" method="post" modelAttributes="command">

		<label>請輸入優惠券名稱 <form:input path="couponName" />
		</label>
		<form:errors path="couponName" />

		<br>
		<br>
		
        請選擇被折扣類型<br>
		<form:select path="discountType" id="discountType">
			<form:options items="${discountTypeList}" />
		</form:select>

		<br>
		<br>
        請選擇折扣目標<br>
		<select id="discountedClassSelect">
		</select>
		<form:input path="discountedClass" id="discountedClass"/>
		
		<br>
		<br>

		<br>
		<br>
        折扣額度<br>
		<form:input path="discountValue" />
		<form:errors path="discountValue" />

		<br>
		<br>
        請選擇優惠單位<br>
		<label>% <form:radiobutton path="discountUnit" value="%" />
		</label>
		<label>dollar <form:radiobutton path="discountUnit"
				value="dollar" />
		</label>
		<form:errors path="discountUnit" cssClass="error" />

		<br>
		<br>
        請選擇生效日期<br>
		<label for="to">from</label>
		<input type="text" id="validFromDate" />
		<input type="text" id="validFromTime" name="validFromTime" />
		<form:input path="validFrom" id="validFrom" />
		<form:errors path="validFrom" cssClass="error" />

		<br>
		<br>
        請選擇結束日期<br>
		<label for="to">until</label>
		<input type="text" id="validUntilDate" />
		<input type="text" id="validUntilTime" name="validFromTime" />
		<form:input path="validUntil" id="validUntil" />
		<form:errors path="validUntil" cssClass="error" />

		<div>
			<table id="searchedTable" border="1"></table>
		</div>

		<br>
		<br>
        請設定優惠碼<br>
		<form:input path="couponCode" id="couponCode" />
		<form:errors path="couponCode" cssClass="error" />
		<span id="couponRepeatMessage"></span>

		<br>
		<br>
        能否與其他優惠券同時使用<br>
		<label>能 <form:radiobutton path="concurrency" value="true" />
		</label>
		<label>否 <form:radiobutton path="concurrency"
				value="false" />
		</label>
		<form:errors path="concurrency" cssClass="error" />

		<br>
		<br>
        請設定最小購買單位(選填)<br>
		<form:input path="minimumOrderValue" />
		<form:errors path="minimumOrderValue" cssClass="error" />

		<br>
		<br>
        請設定最大折扣金額(選填)<br>
		<form:input path="maximumDiscountAmount" />
		<form:errors path="maximumDiscountAmount" cssClass="error" />

		<br>
		<br>
        請輸入文字描述<br>
		<form:textarea path="describe" />


		<br>
		<br>
		<button type="submit" value="submit">createNew</button>
	</form:form>
</body>

</html>