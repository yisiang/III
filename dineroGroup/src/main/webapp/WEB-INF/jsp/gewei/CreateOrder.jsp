<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="com.dinero.model.CartBean,com.dinero.model.CartItemBean,java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>訂單新增成功</title>
<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200|Open+Sans+Condensed:700" rel="stylesheet">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
  <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" />
  <link href="${pageContext.request.contextPath}/css/now-ui-kit.css?v=1.3.1" rel="stylesheet" />
  <link href="${pageContext.request.contextPath}/demo/demo.css" rel="stylesheet" />
  
	  <script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		crossorigin="anonymous"></script>
</head>
<body>
	<jsp:include page="../UserNavBar.jsp"></jsp:include>
	 <div class="page-header page-header-mini" style="min-height: 10vh">
      <div class="page-header-image" data-parallax="true" style="background-image: url('${pageContext.request.contextPath}/images/大背景2.jpg');">
      </div>
    </div>
	<h2 class="text-center">訂單新增成功</h2>
	<jsp:useBean id="cartDto" class="com.dinero.model.CartBean" scope="session"></jsp:useBean>
	<div class="container">
		<table class="table table-bordered">
			<thead>
				<tr>

					<th>商品id</th>
					<th>價格</th>
					<th>數量</th>
					<th>金額</th>

				</tr>
			</thead>
			<tbody>
				<%
				List<CartItemBean> items = cartDto.getItems();

				
				for (CartItemBean item : items) {
					
				%>
				<tr>

					<td><%=item.getProduct().getProdId()%></td>
					<td><%=item.getPrice()%></td>
					<td><%=item.getQty()%></td>
					<td><%=item.getItemTotal()%></td>

				</tr>
				<%
				}
				%>
				<tr>
					<td colspan="3">總額</td>
					<td id="sum"><jsp:getProperty property="cartTotal" name="cartDto" /></td>
				</tr>
			</tbody>
		</table>
 		<c:if test="${requestScope.coupons != null}"> 
		<h2 class="text-center">此次套用優惠券</h2>
			<table class="table table-bordered">
							<thead>
				<tr>
					<th>優惠券名稱</th>
					<th>優惠券代碼</th>
					<th>折扣額度</th>
					<th>折扣單位</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${requestScope.coupons}" var="coupon">
					<tr>
					<td>${coupon.couponName}</td>
					<td>${coupon.couponCode}</td>
					<td>${coupon.discountValue}</td>
					<td>${coupon.discountUnit}</td>
					</tr>
				</c:forEach>
			</tbody>
			</table>
 		</c:if> 
	</div>

	<%
	application.removeAttribute("cartDto");
	session.removeAttribute("cartDto");
	session.removeAttribute("usedcouponsid");
	%>
			  <script src="${pageContext.request.contextPath}/js/core/jquery.min.js" type="text/javascript"></script>
  <script src="${pageContext.request.contextPath}/js/core/popper.min.js" type="text/javascript"></script>
  <script src="${pageContext.request.contextPath}/js/core/bootstrap.min.js" type="text/javascript"></script>
  <!--  Plugin for Switches, full documentation here: http://www.jque.re/plugins/version3/bootstrap.switch/ -->
  <script src="${pageContext.request.contextPath}/js/plugins/bootstrap-switch.js"></script>
  <!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
  <script src="${pageContext.request.contextPath}/js/plugins/nouislider.min.js" type="text/javascript"></script>
  <!--  Plugin for the DatePicker, full documentation here: https://github.com/uxsolutions/bootstrap-datepicker -->
  <script src="${pageContext.request.contextPath}/js/plugins/moment.min.js"></script>
  <!--	Plugin for Tags, full documentation here: https://github.com/bootstrap-tagsinput/bootstrap-tagsinputs  -->
  <script src="${pageContext.request.contextPath}/js/plugins/bootstrap-tagsinput.js"></script>
  <!--	Plugin for Select, full documentation here: http://silviomoreto.github.io/bootstrap-select -->
  <script src="${pageContext.request.contextPath}/js/plugins/bootstrap-selectpicker.js" type="text/javascript"></script>
  <!--  Plugin for the DateTimePicker, full documentation here: https://eonasdan.github.io/bootstrap-datetimepicker/ -->
  <script src="${pageContext.request.contextPath}/js/plugins/bootstrap-datetimepicker.js" type="text/javascript"></script>
  <!--  Google Maps Plugin    -->
  <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
  <!-- Control Center for Now Ui Kit: parallax effects, scripts for the example pages etc -->
  <script src="${pageContext.request.contextPath}/js/now-ui-kit.js?v=1.3.1" type="text/javascript"></script>
</body>
</html>