<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<head>
<!--     <link rel="stylesheet" href="/static/style/style.css"> -->
</head>
<meta charset="UTF-8">
<title>後台文章修改</title>
<link rel="apple-touch-icon" sizes="76x76"
	href="${pageContext.request.contextPath}/img/apple-icon.png">
<link rel="icon" type="image/png" href="${pageContext.request.contextPath}/img/favicon.png">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
  
   <!--     CKEditor     -->
    	<script src="https://cdn.ckeditor.com/4.18.0/standard/ckeditor.js"></script>
   	
  <!--     Fonts and icons     -->
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" rel="stylesheet" />
  <!-- CSS Files -->
  <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" />
  <link href="${pageContext.request.contextPath}/css/now-ui-dashboard.css?v=1.6.0" rel="stylesheet" />
  <!-- CSS Just for demo purpose, don't include it in your project -->
  <link href="${pageContext.request.contextPath}/demo/demo.css" rel="stylesheet" />
  
</head>

		<body class=" sidebar-mini ">
			
			    <div class="wrapper ">
		
		          <jsp:include page="../testSideBar.jsp"></jsp:include>  
		
		        <div class="main-panel" id="main-panel">
		          
		          	<jsp:include page="../testNavBar.jsp"></jsp:include>
		          
		            <div class="panel-header panel-header-sm">
		            </div>
<!-- 		            <div class="content"> -->
<!-- 		                <div class="row"></div> -->
<!--             </div> -->
<div class="section-createmsg" style="border:3px#8080C0 dashed;border-radius:30px; margin:80px;">
	<div class='container' >
		<%-- 	<jsp:include page="../dineroNavBar.jsp"></jsp:include> --%>
		<h2 style="margin: 20px 0px; text-align: left">Update Message</h2>
		<form action="${pageContext.request.contextPath}/messagesIndex" method="get"
			style="display: inline; width: 104px; float: right">
			<input type="hidden" name="todo" value="1">
			<button type="submit" class="btn "
				style="margin-bottom: 10px">Back</button>
		</form>
		<table id="datatable" class="table table-striped table-bordered"
					cellspacing="0" width="1000px">
					<table class="table table-hover">

		<div>
		<form:form action="${pageContext.request.contextPath}/messageUpdate" method="post" modelAttribute="updatelist"><br>
		
			<div style="width:50%; margin:10px 10px 10px 30px;">
				<form:label for="msgid" class="form-label" path="messageId"></form:label>
				<form:input type="number" class="form-control" id="msgid" path="messageId" readonly="true" />
			</div>

			<div style="width:50%; margin:10px 10px 10px 30px;">
				<label for="category"><h5>文章分類</h5></label>
				<form:select class="form-control" path="category">文章類別
					<option >請選擇文章類別</option>
					<form:option value="寵物醫療保健">寵物醫療保健</form:option>
					<form:option value="寵物認領養">寵物認領養</form:option>
					<form:option value="寵物營養">寵物營養</form:option>
					<form:option value="寵物心情">寵物心情</form:option>
				</form:select>
			</div>
				<!-- <label name="messagetitle">文章標題</label><br>	 -->
			<div style="width:50%; margin:10px 10px 10px 30px;">
				<label for="msgtitle" class="" path="messagetitle"><h5>文章標題</h5></label>
				<form:input type="text" class="form-control" id="msgtitle" path="messagetitle" />
			</div>
			
			<div style="width:50%; margin:10px 10px 10px 30px;">
				<label for="msgtitle" class="" path="messagetitle"><h5>文章內文</h5></label><br>
				<form:textarea path="message" name="message" style="resize:none;width:600px;height:300px;border-radius:15px;"></form:textarea> 
			<!-- <form:textarea  style="display:none;width:500px;height:300px;" class="form-control" path="message" name="message"/>  -->
						     <!-- <script>
								// CKEDITOR.editorConfig = function( config ) {
								// 	config.allowedContent=true;
								// };
				            	CKEDITOR.replace( 'message' ); 
					         </script>    -->
			</div>
			<div style="width:50%; margin:10px 10px 10px 30px;">
			<div class="mb-3">
				<label for="msgtitle" class="" path="messagetitle"><h6>圖片</h6></label>
				<form:label for="msg_pic" class="form-label" path="pic"><b></b>
				</form:label>
				<form:input class="form-control uploadImages" style="width:200px" type="file" id="msg_pic" name="Message_pic" path="pic" />
				<form:input type="hidden" id="msg_picBase64" name="msg_picBase64" value="" path="picBase64" />
			</div>
			<div></div>
			</div>	
			<div>
				<input type="submit" class="btn btn-info" value="修改">
			</div>
		</tr>
		</form:form>
	</div>
	</div>
	<!-- CKEditor -->
	<script src="https://code.jquery.com/jquery-3.6.0.js"
		integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
		crossorigin="anonymous">
		</script>

	<script>
		<%--必填欄位提醒--%>
		$(".nBlank").blur(function(event){
			<%--console.log(this);--%>
			$("#titleError,#contentError").text("");
			let theSpan = $(this).closest("div.mb-3").children("label").children("span");
			if($(this).val().length == 0){
				theSpan.text("必填");
			}else{
				theSpan.text("");
			}
		})
				
		// 預覽圖片，將取得的files一個個取出丟到convertFile()
		function previewFiles(theImgs) {
		if (theImgs[0].files && theImgs[0].files.length >= 1) {
			$.map(theImgs[0].files, file => {
			convertFile(file)
				.then(data => {
				//console.log(data) // 把編碼後的字串輸出到console
				showPreviewImage(theImgs, data, file.name)
				})
			.catch(err => console.log(err))	
				})
			}
		}

		// 使用FileReader讀取檔案，並且回傳Base64編碼後的source
		function convertFile(file) {
		return new Promise((resolve,reject)=>{
		// 建立FileReader物件
			let reader = new FileReader()
		// 註冊onload事件，取得result則resolve (會是一個Base64字串)
			reader.onload = () => { resolve(reader.result) }
		// 註冊onerror事件，若發生error則reject
			reader.onerror = () => { reject(reader.error) }
		// 讀取檔案
			reader.readAsDataURL(file)
			})
		}

		// 在頁面上新增<img>
		function showPreviewImage(theImgs, src, fileName) {
			let image = new Image(250) // 設定寬250px
			image.name = fileName
			image.src = src // <img>中src屬性除了接url外也可以直接接Base64字串
			theImgs.closest("div").next().append(image);
			theImgs.next().attr("value",src);
		}

		// 當上傳檔案改變時清除目前預覽圖，並且呼叫previewFiles()
		$(".uploadImages").change(function(){
		$(this).closest("div").next().empty();
		previewFiles($(this)); // this即為<input>元素
		})		
		</script>
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
	<!-- Chart JS -->
	<script src="${pageContext.request.contextPath}/js/plugins/chartjs.min.js"></script>
	<!--  Notifications Plugin    -->
	<script src="${pageContext.request.contextPath}/js/plugins/bootstrap-notify.js"></script>
	<!-- Control Center for Now Ui Dashboard: parallax effects, scripts for the example pages etc -->
	<script src="${pageContext.request.contextPath}/js/now-ui-dashboard.min.js?v=1.6.0" type="text/javascript"></script>
	<!-- Now Ui Dashboard DEMO methods, don't include it in your project! -->
	<script src="${pageContext.request.contextPath}/demo/demo.js"></script>
</body>
</html>