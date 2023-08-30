<%@page import="com.dinero.model.CartService,org.hibernate.Session"%>
<%@page import="com.dinero.model.ICartService"%>

<%@page import="com.dinero.model.CartBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>後端管理者頁面</title>
</head>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>

<style>
.center {
	margin-left: auto;
	margin-right: auto;
	/* border: 2px black solid; */
}

.controll {
	width: 50%;
	margin-left: auto;
	margin-right: auto;
	/* border: 2px black solid; */
	position: relative;
}

hr {
	margin-top: 1rem;
	margin-bottom: 1rem;
	border: 0;
	border-top: 1px solid rgba(0, 0, 0, 0.1);
}
</style>
<body>
	<jsp:include page="navbar.jsp"></jsp:include>



	

	<div class="container">
		<%--搜尋 --%>
		<button class="btn btn-primary" type="button"
			data-bs-toggle="collapse" data-bs-target="#collapseExample"
			aria-expanded="false" aria-controls="collapseExample">搜尋</button>
		
		<div class="collapse" id="collapseExample">
			<div class="card card-body">
				<form action="orderSelectBy" method="get"
					class="form-horizontal center">
					<div class="form-group controll">
						<label for=""> 搜尋方式</label><br> <select name="selectBy" id="">
							<option value="cartId">訂單編號</option>
							<option value="custId">顧客編號</option>
							<option value="cartTotal">訂單總額</option>
							<option value="tradeDate">交易日期</option>
							<option value="advanced">進階搜尋</option>
						</select>
					</div>
					<hr>
					<div class="form-group controll">
						<label for="">訂單編號<br> <input type="text"
							name="cartId" class="form-control" />
						</label>
					</div>
					<hr>

					<div class="form-group controll">
						<label for="">顧客編號<br> <input type="text"
							name="custId" class="form-control" />
						</label>
					</div>
					<hr>

					<div class="form-group controll">
						<label for="">日期</label><br> <label for=""> 最早日期 <input
							type="text" name="minDate" class="form-control" />
						</label><br> <label for=""> 最大日期 <input type="text"
							name="maxDate" class="form-control" />
						</label>
					</div>
					<hr>
					<div class="form-group controll">

						<div>金額</div>
						<div>
							最小金額 <input type="text" name="minTotal" class="form-control" />
						</div>
						<div>
							最大金額 <input type="text" name="maxTotal" class="form-control" />
						</div>
					</div>
					<hr>
					<div class="form-group controll">
						<input type="submit" value="送出查詢">

					</div>

				</form>
			</div>
		</div>
		<%--一覽	 --%>
		<table class="table table-bordered">
			<thead>
				<tr>
					<td>訂單編號</td>
					<td>顧客編號</td>
					<td>訂單總額</td>
					<td>交易日期</td>
					<td>訂單狀態</td>
					<td>發貨日期</td>
					<td>訂單明細</td>

				</tr>
			</thead>
			<tbody>
				<c:forEach items="${requestScope.ords}" var="ord">
				<tr>
					<td>${ord.cartId}</td>
					<td>${ord.custId}</td>
					<td>${ord.cartTotal}</td>
					<td>${ord.tradeDate}</td>
					<td>${ord.orderState}</td>
					<td>${ord.shipmentDate}</td>
					<td><a href="http://localhost:8080/dinero/serverSideManager/${ord.cartId}">明細</a></td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>


</body>
</html>