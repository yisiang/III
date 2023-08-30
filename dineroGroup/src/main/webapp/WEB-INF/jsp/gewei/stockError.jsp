<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isErrorPage="true" import="com.dinero.model.CartBean"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>購買數量過多</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
</head>
<body>

	
	<h1 class="display-1">BackEndTesting</h1>
	<footer class="blockquote-footer">
		請重新購買，3秒後跳轉<cite title="Source Title"><%=exception%></cite>
	</footer>

	

	<%  
	
	 response.setHeader("Refresh", "3; url=http://localhost:8080/dinero/GeweiProductController?toDo=toProductList" );
	 %>
</body>
</html>