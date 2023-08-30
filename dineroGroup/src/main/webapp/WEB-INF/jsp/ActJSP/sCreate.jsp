<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新增活動</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>

<%-- 	<jsp:include page="../dineroNavBar.jsp"></jsp:include> --%>

<div style="padding: 20px;">

	<form action="${pageContext.request.contextPath}/activities/activity.insert" method="get"> 
	
		<label>活動名稱</label>&ensp;
		<input type="text" id="actName" name="actName"><br>
		
		<label>活動內容</label>&ensp;
		<textarea rows="5" id="actContent" name="actContent"></textarea><br>
		 
		<label>活動報名截止日期</label>&ensp;
		<input type="text" id="endDate" name="endDate"><br>
		
		<label>目前報名人數餘額</label>&ensp;
		<input type="text" id="memberRemain" name="memberRemain"><br>
		
		<label>活動總人數上限</label>&ensp;
		<input type="text" id="memberLimit" name="memberLimit"><br>
		
		<input type="submit" value="送出">
		
	</form>

</div>	

</body>
</html>