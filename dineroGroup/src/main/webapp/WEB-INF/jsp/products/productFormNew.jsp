<%@page import="com.dinero.model.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">

  <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/images/favicon-32x32.png">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <title>
    ProductForm
  </title>
  <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
  
  <!--     Fonts and icons     -->
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" rel="stylesheet" />
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
  
  <!-- CSS Files -->
  <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" />
  <link href="${pageContext.request.contextPath}/css/now-ui-dashboard.css?v=1.6.0" rel="stylesheet" />
  <!-- CSS Just for demo purpose, don't include it in your project -->
  <link href="${pageContext.request.contextPath}/demo/demo.css" rel="stylesheet" />
  
  <!--jquery -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"
        integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<style>

</style>

<!--背景圖片設定 -->
<style> 
.background-image_container{
     min-height: 100%;
     width: 100%;
    background-image: url(${pageContext.request.contextPath}/images/背景2.jpg);
    background-position: center;
      
}
</style>

</head>
<body class=" sidebar-mini ">
	<div class="wrapper ">
	
<jsp:include page="../testSideBar.jsp"></jsp:include> <!-- 動態匯入 sidebarjsp -->
     
<!--      ============================================= -->
    <div class="main-panel" id="main-panel">
    
<jsp:include page="../testNavBar.jsp"></jsp:include> <!-- 動態匯入 navbarjsp-->

<!-- ====================================================== -->    
	  <div class="panel-header "> <!-- 上面背景牆 -->
	  		<div class="background-image_container">
            </div>
      </div>
      <div class="content">
        <div class="row">
          <div class="col-md-12">
            <div class="card">
              <div class="card-header">
                <h4 class="card-title">ProductTable</h4>
                <form style="display:inline;" action="${pageContext.request.contextPath}/createproduct.controller" method="get">  <!-- 新增按鈕 -->
				<button type="submit" class="btn btn-round btn-info btn-icon btn-sm like" name="create" value=""><i class="fas fa-solid fa-plus"></i></button>
				</form>
              </div>
              <div class="card-body">
                <div class="toolbar">
                  <!--        Here you can write extra buttons/actions for the toolbar              -->
                </div>
                <table id="datatable" class="table table-striped table-bordered" cellspacing="0" width="100%">
                  <thead>
                    <tr>
                      <th>ID</th>
                      <th>圖片</th>
                      <th>名稱</th>
                      <th>價格</th>
                      <th>描述</th>
                      <th>種類</th>
                      <th>寵物類型</th>
                      <th>庫存</th>
                      <th class="disabled-sorting text-right">Actions</th>
                    </tr>
                  </thead>
                  <tfoot>
                    <tr>
                      <th>ID</th>
                      <th>圖片</th>
                      <th>名稱</th>
                      <th>價格</th>
                      <th>描述</th>
                      <th>種類</th>
                      <th>寵物類型</th>
                      <th>庫存</th>
                      <th class="disabled-sorting text-right">Actions</th>
                    </tr>
                  </tfoot>
                  <tbody>        

					<c:forEach items="${productList}" var="products">
						<tr>
							<td>${products.prodId}</td>
							<td><img src="${products.prodImg }" style="maxwidth: 80px"/></td>
							<td>${products.prodName}</td>
							<td>${products.price}</td>
							<td><div style="overflow:auto;width: 150px;height: 100px">${products.descript}</div></td> <!-- 溢出長條 -->
							<td>${products.category }</td>
							<td>${products.petkind }</td>
							<td>${products.stock }</td>
							
							<td class="text-right">
<!--                         <a href="#" class="btn btn-round btn-info btn-icon btn-sm like"><i class="fas fa-heart"></i></a>  --> <!-- 愛心按鈕 -->
								
                       	 		<form style="display:inline;" action="${pageContext.request.contextPath}/updateproduct.controller" method="get" > <!-- 修改按鈕 -->
                        			<input type="hidden" name="prodId" value="${products.prodId}">
                        			<button type="submit" class="btn btn-round btn-warning btn-icon btn-sm edit"><i class="fa-solid fa-pen-to-square"></i></button>
                        		</form>
<!--                         <i class="fas fa-solid fa-file-signature"> -->
                        		<form:form style="display:inline;" action="${pageContext.request.contextPath}/deleteproduct.controller" method="post" modelAttribute="product"> <!-- 刪除按鈕 -->
    		 					    <form:hidden path="prodId" value="${products.prodId }"/>
                        		    <button type="submit" class="btn btn-round btn-danger btn-icon btn-sm remove"><i class="fas fa-times"></i></button>		  				
    						    </form:form>
                      		</td>
						</tr>
					
					</c:forEach>


                  </tbody>
                </table>
              </div><!-- end content-->
            </div><!--  end card  -->
          </div> <!-- end col-md-12 -->
        </div> <!-- end row -->
      </div>
     </div>
    </div> 

<!--   Core JS Files   -->
  <script src="${pageContext.request.contextPath}/js/core/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/core/popper.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/core/bootstrap.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/plugins/perfect-scrollbar.jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/plugins/moment.min.js"></script>
  <!--  Plugin for Switches, full documentation here: http://www.jque.re/plugins/version3/bootstrap.switch/ -->
  <script src="${pageContext.request.contextPath}/js/plugins/bootstrap-switch.js"></script>
  <!--  Plugin for Sweet Alert -->
  <script src="${pageContext.request.contextPath}/js/plugins/sweetalert2.min.js"></script>
  <!-- Forms Validations Plugin -->
  <script src="${pageContext.request.contextPath}/js/plugins/jquery.validate.min.js"></script>
  <!--  Plugin for the Wizard, full documentation here: https://github.com/VinceG/twitter-bootstrap-wizard -->
  <script src="${pageContext.request.contextPath}/js/plugins/jquery.bootstrap-wizard.js"></script>
  <!--	Plugin for Select, full documentation here: http://silviomoreto.github.io/bootstrap-select -->
  <script src="${pageContext.request.contextPath}/js/plugins/bootstrap-selectpicker.js"></script>
  <!--  Plugin for the DateTimePicker, full documentation here: https://eonasdan.github.io/bootstrap-datetimepicker/ -->
  <script src="${pageContext.request.contextPath}/js/plugins/bootstrap-datetimepicker.js"></script>
  <!--  DataTables.net Plugin, full documentation here: https://datatables.net/    -->
  <script src="${pageContext.request.contextPath}/js/plugins/jquery.dataTables.min.js"></script>
  <!--	Plugin for Tags, full documentation here: https://github.com/bootstrap-tagsinput/bootstrap-tagsinputs  -->
  <script src="${pageContext.request.contextPath}/js/plugins/bootstrap-tagsinput.js"></script>
  <!-- Plugin for Fileupload, full documentation here: http://www.jasny.net/bootstrap/javascript/#fileinput -->
  <script src="${pageContext.request.contextPath}/js/plugins/jasny-bootstrap.min.js"></script>
  <!--  Full Calendar Plugin, full documentation here: https://github.com/fullcalendar/fullcalendar    -->
  <script src="${pageContext.request.contextPath}/js/plugins/fullcalendar.min.js"></script>
  <!-- Vector Map plugin, full documentation here: http://jvectormap.com/documentation/ -->
  <script src="${pageContext.request.contextPath}/js/plugins/jquery-jvectormap.js"></script>
  <!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
  <script src="${pageContext.request.contextPath}/js/plugins/nouislider.min.js"></script>
  <!--  Google Maps Plugin    -->
  <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
  <!-- Chart JS -->
  <script src="${pageContext.request.contextPath}/js/plugins/chartjs.min.js"></script>
  <!--  Notifications Plugin    -->
  <script src="${pageContext.request.contextPath}/js/plugins/bootstrap-notify.js"></script>
  <!-- Control Center for Now Ui Dashboard: parallax effects, scripts for the example pages etc -->
  <script src="${pageContext.request.contextPath}/js/now-ui-dashboard.min.js?v=1.6.0" type="text/javascript"></script>
  <!-- Now Ui Dashboard DEMO methods, don't include it in your project! -->
  <script src="${pageContext.request.contextPath}/demo/demo.js"></script>
  <script>
    $(document).ready(function() {
      $('#datatable').DataTable({
        "pagingType": "full_numbers",
        "lengthMenu": [
          [10, 25, 50, -1],
          [10, 25, 50, "All"]
        ],
        responsive: true,
        language: {
          search: "_INPUT_",
          searchPlaceholder: "Search records",
        }

      });

      var table = $('#datatable').DataTable();

//       // Edit record
//       table.on('click', '.edit', function() {
//         $tr = $(this).closest('tr');
//         if ($($tr).hasClass('child')) {
//           $tr = $tr.prev('.parent');
//         }

//         var data = table.row($tr).data();
//         alert('You press on Row: ' + data[0] + ' ' + data[1] + ' ' + data[2] + '\'s row.');
//       });

      // Delete a record
//       table.on('click', '.remove', function(e) {
//         $tr = $(this).closest('tr');
//         if ($($tr).hasClass('child')) {
//           $tr = $tr.prev('.parent');
//         }
//         table.row($tr).remove().draw();
//         e.preventDefault();
//       });

      //Like record
      table.on('click', '.like', function() {
        alert('You clicked on Like button');
      });
      

    });
      $('.remove').click(function(e) {
          e.preventDefault();
          let formid=$(this).parent();
          Swal.fire({
        	  title: '確定要刪除嗎?',
        	  text: "刪除後無法恢復!",
        	  icon: 'warning',
        	  showCancelButton: true,
        	  confirmButtonColor: '#3085d6',
        	  cancelButtonColor: '#d33',
        	  cancelButtonText: '取消',
        	  confirmButtonText: '刪除'
        	}).then((result) => {
        	  if (result.isConfirmed) {
        	    Swal.fire(
        	      '刪除!',
        	      '資料已刪除',
        	      'success'
        	    ).then(()=>{$(formid).submit() })
        	        	      
        	  }
        	})
    	});

  </script>
</body>
</html>