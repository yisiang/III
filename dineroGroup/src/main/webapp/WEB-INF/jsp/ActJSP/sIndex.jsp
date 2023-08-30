<%@ page language="java" contentType="text/html; charset=UTF-8"
                pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>   --%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <style type="text/css">
        .myrow-container {
            margin: 0px;
        }
    </style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>活動表</title>
    
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
                        <form action="${pageContext.request.contextPath}/activities/activity.insert1">
                            <input class="btn btn-info" type="submit" value="新增活動按此"/>
                        </form>
                    </div>
                </div>

                <form action="${pageContext.request.contextPath}/activities/activity.find" method="get">
                    <div class="row">
                        <div class="col-md-4">活動名稱： <input type="text" name="actName" placeholder="ex. 泳池趴" 
                            aria-label="Search"/></div>
                        <div class="col-md-4"><input class="btn btn-success" type="submit" value="搜尋活動按此"/></div>
                    </div> 
                </form>


 			<c:if test="${not empty activityList}">   <%-- <c:if test="${not empty activityList}"> --%>
                <table class="table table-hover table-bordered">
                    <thead style="background-color: #bce8f1;">
                    <tr>
                        <th>活動編號</th>
                        <th>活動名稱</th>
                        <th>活動內容</th>
                        <th>活動結束時間</th>
                        <th>活動人數餘額</th>
                        <th>活動人數上限</th>

                        <th>編輯</th>
                        <th>刪除</th>
                    </tr>
                    </thead>
                    <tbody>

                    <c:forEach items="${activityList}" var="activity"> <%-- activity是自己取名的變數，${activityList} 也是自己取的名字？！--%>
                        <tr>
                            <th><c:out value="${activity.actId}"/></th>
                            <th><c:out value="${activity.actName}"/></th>
                            <th><c:out value="${activity.actContent}"/></th>
                            <th><c:out value="${activity.endDate}"/></th>
                            <th><c:out value="${activity.memberRemain}"/></th>
                            <th><c:out value="${activity.memberLimit}"/></th>
                            
                            <th><a href="<c:out value='activity.update1/${activity.actId}'/>">編輯</a></th>
                            <th><a href="<c:out value='activity.delete/${activity.actId}'/>">刪除</a></th>
                        </tr>
                    </c:forEach>
                    
                    </tbody>
                </table>
            </c:if>
        </div>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

    <%-- <script src="<c:url value="/resources/js/jquery-2.1.3.js"/>"></script>
    <script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
     --%>

</body>
</html>