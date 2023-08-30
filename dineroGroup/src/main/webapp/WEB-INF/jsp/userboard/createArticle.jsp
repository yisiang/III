<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>使用者新增文章</title>
<link rel="apple-touch-icon" sizes="76x76"
	href="${pageContext.request.contextPath}/img/apple-icon.png">
<link rel="icon" type="image/png" href="${pageContext.request.contextPath}/img/favicon.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no'
	name='viewport' />
	
<!--     CKEditor     -->
   	<script src="https://cdn.ckeditor.com/4.18.0/standard/ckeditor.js"></script>

<!-- jQuery CDN-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
   	
<!--     Fonts and icons     -->
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.1/css/all.css"
	integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr"
	crossorigin="anonymous">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
	rel="stylesheet" />
<!-- CSS Files -->
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/now-ui-dashboard.css?v=1.6.0" rel="stylesheet" />
<!-- CSS Just for demo purpose, don't include it in your project -->
<link href="${pageContext.request.contextPath}/demo/demo.css" rel="stylesheet" />

</head>
<body>
	<body class=" sidebar-mini ">

		<div class="wrapper ">
	
			<jsp:include page="../testSideBar.jsp"></jsp:include>
	
			<div class="main-panel" id="main-panel">
	
				<jsp:include page="../testNavBar.jsp"></jsp:include>
	
				<div class="panel-header panel-header-sm"></div>
	<!-- 			<div class="content"> -->
	<!-- 				<div class="row"></div> -->
	<!-- 			</div> -->
	
				<%-- 	<jsp:include page="../dineroNavBar.jsp"></jsp:include> --%>
				<form action="${pageContext.request.contextPath}/articles" method="get"
				style="display: inline; width: 104px; float: right">
				<input type="hidden" name="todo" value="1">
				<button type="submit" class="btn "
					style="margin-bottom: 10px">Back</button>
				</form>
				<div class="section-createmsg" style="border:3px#8080C0 dashed;border-radius:30px; margin:80px;">
				<h2 style="margin: 20px; text-align: left">Create Message</h2>
				<br><br>
				<form:form action="${pageContext.request.contextPath }/ucreateArticle" method="post" modelAttribute="Message">
					
					
									<div style="width:50%; margin:10px 10px 10px 30px;">
										<form:select class="form-control" path="category">文章類別
											<option >請選擇文章類別</option>
											<form:option value="寵物醫療保健">寵物醫療保健</form:option>
											<form:option value="寵物認領養">寵物認領養</form:option>
											<form:option value="寵物營養">寵物營養</form:option>
											<form:option value="寵物心情">寵物心情</form:option>
										</form:select><br>
									</div>
								
									<div style="width:70%;margin:10px 10px 10px 30px;">
										<label name="messagetitle">文章標題</label><br>						
										<form:input  id="input1" class="form-control" path="messagetitle"></form:input>
									</div>
										
									<div style="width:70%;margin:10px 10px 10px 30px;">
										<label name="message1">文章內容</label>
											 <!-- <form:textarea  class="form-control" style="resize:none;width:300px;height:200px;" path="message"></form:textarea>  -->
												
											 <textarea id="input2" name="message" placeholder="請在這裡撰寫文章..." style="width:300px">請在這裡撰寫文章...</textarea>
												<script>
													CKEDITOR.editorConfig = function( config ) {
														config.allowedContent=true;
														config.extraAllowedContent;};
														
														CKEDITOR.replace( 'message', {
														allowedContent: 'p b i; a[!href]',
														on: {
															instanceReady: function( evt ) {
																var editor = evt.editor;
	
																editor.filter.check( 'h1' ); // -> false
																// editor.setData( '<p>請在這裡輸入留言</p>' );
																// Editor contents will be:
																'<p><i>Foo</i></p><p>Bar <a href="http://foo.bar">foo</a></p>'
															}}
													} );
												</script>   	
												
										<!-- <div id="summernote">Hello Summernote</div>
											<form method="post">
												<textarea id="summernote" name="message"></textarea>
											</form>
											<script>
												$(document).ready(function() {
													$('message').summernote();
												});
											</script> -->
											<!-- <div id="summernote"></div>
												<script>
												$('#summernote').summernote({
													placeholder: 'Hello Bootstrap 4',
													tabsize: 2,
													height: 100
												});
												</script> -->
										  
									</div>
								
								<div class="mb-3" style="width:50%;margin:10px 10px 10px 30px;;">
									<form:label for="msg_pic" class="form-label" path="pic">
										<b>照片</b>
									</form:label>
									<form:input class="form-control uploadImages" style="width:280px"
										type="file" id="msg_pic" name="Message_pic" path="pic" />
									<form:input type="hidden" id="msg_picBase64" name="msg_picBase64"
										value="" path="picBase64" />
								</div>
								<div margin:10px 10px 10px 30px;></div>
								
								<div style="width:50%;margin:10px 10px 10px 30px;">
								<input type="submit" class="btn btn-warning" style="margin-bottom: 20px" value="送出">
								<button id="btn" class="btn btn-info" style="margin-bottom: 20px">一鍵輸入</button>
								</div>						
							</form:form>
					</div>

					<!-- 一鍵輸入 -->
					<script>
					$("#btn").click(function(e){
						e.preventDefault();
						$("#input1").prop("value",'你一定要知道的寵物保健食品大揭密');
						$("#input2").prop("placeholder",'這是文章標題!');
						
					});
				</script>




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
		// closest() in jQuery 網上第一個祖先輩被指定的元素(e.g.div)
		//.next()往下找同級的元素(sibling element)->e.g. <div>, <table>
		
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
			<script src="/js/plugins/jasny-bootstrap.min.js"></script>
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
			<script src="${pageContext.request.contextPath}/js/now-ui-dashboard.min.js?v=1.6.0"
				type="text/javascript"></script>
			<!-- Now Ui Dashboard DEMO methods, don't include it in your project! -->
			<script src="${pageContext.request.contextPath}/demo/demo.js"></script>
</body>
</html>