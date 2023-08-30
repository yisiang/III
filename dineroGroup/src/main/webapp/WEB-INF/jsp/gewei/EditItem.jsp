<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.dinero.model.CartItemBean,java.util.List,com.dinero.model.CartBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
</head>
<body>
<jsp:include page="navbar.jsp"></jsp:include>
	<%
	String index = request.getParameter("index");
	int indexInt = Integer.parseInt(index);
	%>
	<jsp:useBean id="cartDto" class="com.dinero.model.CartBean" scope="session"></jsp:useBean>
	<%
	List<CartItemBean> items = cartDto.getItems();
	CartItemBean currentItem = items.get(indexInt);
	int prodId = currentItem.getProduct().getProdId();

	//pageContext.setAttribute("index", indexInt, PageContext.SESSION_SCOPE);
	%>

	<div class="container">
		<form action="<%=request.getContextPath() %>/PlaceAnOrderServlet" method="get">
			<div class="mb-3">
				<label> 您目前選擇的商品為:<%=prodId%>
				</label>
			</div>

			<div class="mb-3">
				<label> 請輸入您要修改的數量: <input type="text" name="newQty" />
				</label>
			</div>
			<div class="mb-3">
				<label> <input type="submit" value="確認修改"
					class="btn btn-primary" />
				</label>
			</div>
			<input type="hidden" name="toDo" value="edit" />
			<input type="hidden" name="prodId" value="<%=prodId%>" />
			<input type="hidden" name="index" value="<%=indexInt%>"/>
		</form>
	</div>
</body>
</html>