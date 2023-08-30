<%@ page language="java" contentType="text/html; charset=UTF-8"
                pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>搜尋活動結果</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <style type="text/css">
        .myrow-container {
            margin: 0px;
        }
    </style>
    
</head>
<body class=".container-fluid">

<%-- 	<jsp:include page="../dineroNavBar.jsp"></jsp:include> --%>

<div class="container myrow-container">
    <div class="panel panel-success">
        <div class="panel-heading"> 
            <h1 class="panel-title">
                <div align="center"><b>活動管理系統</b></div>
            </h1>
        </div><br>
        
        <div class="col-md-4">
        	<div align="left">
            	<form action="${pageContext.request.contextPath}/activities/activity.info">
                	<input class="btn btn-warning" type="submit" value="回活動管理首頁"/>
                </form>
            </div>
        </div><br><br><br>
               	
			<c:if test="${not empty activityList}">   
                <table class="table table-hover table-bordered">
                    <thead style="background-color: #bce8f1;">
                    <tr>
                        <th>活動編號</th>
                        <th>活動名稱</th>
                        <th>活動內容</th>
                        <th>活動結束時間</th>
                        <th>活動人數餘額</th>
                        <th>活動人數上限</th>
                    </tr>
                    </thead>
                    <tbody>

                    <c:forEach items="${activityList}" var="activity"> <%-- activity是自己取名的變數 --%>
                        <tr>
                            <th><c:out value="${activity.actId}"/></th>
                            <th><c:out value="${activity.actName}"/></th>
                            <th><c:out value="${activity.actContent}"/></th>
                            <th><c:out value="${activity.endDate}"/></th>
                            <th><c:out value="${activity.memberRemain}"/></th>
                            <th><c:out value="${activity.memberLimit}"/></th>
                        </tr>
                    </c:forEach>
                    
                    </tbody>
                </table>
            </c:if>
        </div>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

</body>
</html>