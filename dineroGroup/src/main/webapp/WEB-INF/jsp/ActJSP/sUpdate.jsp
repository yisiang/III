<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改活動</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>

<%-- 	<jsp:include page="../dineroNavBar.jsp"></jsp:include> --%>

<div style="padding: 20px;">

	<form action="${pageContext.request.contextPath}/activities/activity.update" method="get"> <%-- action="../activity.update" --%>
	
		<label>活動編號</label>  
		<input type="number" id="actId" name="actId" value="${activity.actId}" readonly><br>
		
		<label>修改活動名稱</label>
		<input type="text" id="actName" name="actName" value="${activity.actName}"><br>
		
		<label>修改活動內容</label>
		<input type="text" id="actContent" name="actContent" value="${activity.actContent}" style="width: 500px;"><br>
		
		<label>修改報名截止日期</label>
		<input type="text" id="endDate" name="endDate" value="${activity.endDate}"><br>
		
		<label>修改報名人數餘額</label>
		<input type="text" id="memberRemain" name="memberRemain" value="${activity.memberRemain}"><br>
		
		<label>修改報名人數上限</label>
		<input type="text" id="memberLimit" name="memberLimit" value="${activity.memberLimit}"><br>
		
		<input type="submit" value="儲存">
		
	</form>
	
</div>

</body>
</html>
