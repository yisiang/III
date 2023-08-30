<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <link rel="apple-touch-icon" sizes="76x76" href="${pageContext.request.contextPath}/img/apple-icon.png">
  <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/img/favicon.png">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <title>
    活動16
  </title>
  <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
  <!--     Fonts and icons     -->
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200|Open+Sans+Condensed:700" rel="stylesheet">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
  <!-- CSS Files -->
  <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" />
  <link href="${pageContext.request.contextPath}/css/now-ui-kit.css?v=1.3.1" rel="stylesheet" />
  <!-- CSS Just for demo purpose, don't include it in your project -->
  <link href="${pageContext.request.contextPath}/demo/demo.css" rel="stylesheet" />
</head>

<body class="blog-post sidebar-collapse">
  <!-- Navbar -->
  <nav class="navbar navbar-expand-lg  navbar-absolute navbar-transparent">
    <div class="container">
      <div class="navbar-translate">
<!--         <a class="navbar-brand" href="https://demos.creative-tim.com/now-ui-kit-pro/index.html" rel="tooltip" title="Designed by Invision. Coded by Creative Tim" data-placement="bottom" target="_blank"> -->
<!--           Now Ui Kit Pro -->
<!--         </a> -->
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navigation" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-bar top-bar"></span>
          <span class="navbar-toggler-bar middle-bar"></span>
          <span class="navbar-toggler-bar bottom-bar"></span>
        </button>
      </div>
      <div class="collapse navbar-collapse" data-nav-image="${pageContext.request.contextPath}/img/blurred-image-1.jpg" data-color="orange">
        <ul class="navbar-nav ml-auto">
<!--           <li class="nav-item dropdown"> -->
<!--             <a href="#" class="nav-link dropdown-toggle" id="navbarDropdownMenuLink1" data-toggle="dropdown"> -->
<!--               <i class="now-ui-icons design_app"></i> -->
<!--               <p>Components</p> -->
<!--             </a> -->
<!--             <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink1"> -->
<!--               <a class="dropdown-item" href="../index.html"> -->
<!--                 <i class="now-ui-icons business_chart-pie-36"></i> All components -->
<!--               </a> -->
<!--               <a class="dropdown-item" target="_blank" href="https://demos.creative-tim.com/now-ui-kit-pro/docs/1.0/getting-started/introduction.html"> -->
<!--                 <i class="now-ui-icons design_bullet-list-67"></i> Documentation -->
<!--               </a> -->
<!--             </div> -->
<!--           </li> -->
<!--           <li class="nav-item dropdown"> -->
<!--             <a href="#" class="nav-link dropdown-toggle" id="navbarDropdownMenuLink" data-toggle="dropdown"> -->
<!--               <i class="now-ui-icons files_paper" aria-hidden="true"></i> -->
<!--               <p>Sections</p> -->
<!--             </a> -->
<!--             <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink"> -->
<!--               <a class="dropdown-item" href="../sections.html#headers"> -->
<!--                 <i class="now-ui-icons shopping_box"></i> Headers -->
<!--               </a> -->
<!--               <a class="dropdown-item" href="../sections.html#features"> -->
<!--                 <i class="now-ui-icons ui-2_settings-90"></i> Features -->
<!--               </a> -->
<!--               <a class="dropdown-item" href="../sections.html#blogs"> -->
<!--                 <i class="now-ui-icons text_align-left"></i> Blogs -->
<!--               </a> -->
<!--               <a class="dropdown-item" href="../sections.html#teams"> -->
<!--                 <i class="now-ui-icons sport_user-run"></i> Teams -->
<!--               </a> -->
<!--               <a class="dropdown-item" href="../sections.html#projects"> -->
<!--                 <i class="now-ui-icons education_paper"></i> Projects -->
<!--               </a> -->
<!--               <a class="dropdown-item" href="../sections.html#pricing"> -->
<!--                 <i class="now-ui-icons business_money-coins"></i> Pricing -->
<!--               </a> -->
<!--               <a class="dropdown-item" href="../sections.html#testimonials"> -->
<!--                 <i class="now-ui-icons ui-2_chat-round"></i> Testimonials -->
<!--               </a> -->
<!--               <a class="dropdown-item" href="../sections.html#contactus"> -->
<!--                 <i class="now-ui-icons tech_mobile"></i> Contact Us -->
<!--               </a> -->
<!--             </div> -->
<!--           </li> -->
<!--           <li class="nav-item dropdown"> -->
<!--             <a href="#" class="nav-link dropdown-toggle" id="navbarDropdownMenuLink" data-toggle="dropdown"> -->
<!--               <i class="now-ui-icons design_image" aria-hidden="true"></i> -->
<!--               <p>Examples</p> -->
<!--             </a> -->
<!--             <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink"> -->
<!--               <a class="dropdown-item" href="../examples/about-us.html"> -->
<!--                 <i class="now-ui-icons business_bulb-63"></i> About-us -->
<!--               </a> -->
<!--               <a class="dropdown-item" href="../examples/blog-post.html"> -->
<!--                 <i class="now-ui-icons text_align-left"></i> Blog Post -->
<!--               </a> -->
<!--               <a class="dropdown-item" href="../examples/blog-posts.html"> -->
<!--                 <i class="now-ui-icons design_bullet-list-67"></i> Blog Posts -->
<!--               </a> -->
<!--               <a class="dropdown-item" href="../examples/contact-us.html"> -->
<!--                 <i class="now-ui-icons location_pin"></i> Contact Us -->
<!--               </a> -->
<!--               <a class="dropdown-item" href="../examples/landing-page.html"> -->
<!--                 <i class="now-ui-icons education_paper"></i> Landing Page -->
<!--               </a> -->
<!--               <a class="dropdown-item" href="../examples/login-page.html"> -->
<!--                 <i class="now-ui-icons users_circle-08"></i> Login Page -->
<!--               </a> -->
<!--               <a class="dropdown-item" href="../examples/pricing.html"> -->
<!--                 <i class="now-ui-icons business_money-coins"></i> Pricing -->
<!--               </a> -->
<!--               <a class="dropdown-item" href="../examples/ecommerce.html"> -->
<!--                 <i class="now-ui-icons shopping_shop"></i> Ecommerce Page -->
<!--               </a> -->
<!--               <a class="dropdown-item" href="../examples/product-page.html"> -->
<!--                 <i class="now-ui-icons shopping_bag-16"></i> Product Page -->
<!--               </a> -->
<!--               <a class="dropdown-item" href="../examples/profile-page.html"> -->
<!--                 <i class="now-ui-icons users_single-02"></i> Profile Page -->
<!--               </a> -->
<!--               <a class="dropdown-item" href="../examples/signup-page.html"> -->
<!--                 <i class="now-ui-icons tech_mobile"></i> Signup Page -->
<!--               </a> -->
<!--             </div> -->
<!--           </li> -->
<!--           <li class="nav-item"> -->
<!--             <a class="nav-link btn btn-primary" href="https://www.creative-tim.com/product/now-ui-kit-pro" target="_blank"> -->
<!--               <p>Buy Now</p> -->
<!--             </a> -->
<!--           </li> -->
        </ul>
      </div>
    </div>
  </nav>
  <!-- End Navbar -->
  <div class="wrapper">
    <div class="page-header page-header-small">
      <div class="page-header-image" data-parallax="true" style="background-image: url('${pageContext.request.contextPath}/img/ActImg/img16.jpg');">
      </div>
      <div class="content-center">
        <div class="row">
          <div class="col-md-8 ml-auto mr-auto text-center">
            <h2 class="title">浪浪也想過聖誕</h2>
            <h4>2023年12月24日桃園市桃園藝文廣場</h4>
          </div>
        </div>
      </div>
    </div>
    <div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="button-container">
<!--               <a href="http://instagram.com/sharer.php?u=http://localhost:8080/activities/activity.readmore/1&media=https://www.miwnt.con/logo.jpg&description=摘要" class="btn btn-icon btn-lg btn-instagram btn-round"> -->
<!--                 <i class="fab fa-instagram"></i> -->
<!--               </a>&nbsp;            -->
<!--               <a href="http://line.naver.jp/R/msg/text/?http://localhost:8080/activities/activity.readmore/1" class="btn btn-icon btn-lg btn-round"> -->
<!--                 <i class="fa-brands fa-line"></i> -->
<!--               </a>&nbsp; -->
              <a href="https://www.facebook.com/sharer.php?u＝http://dinerocom.eastasia.cloudapp.azure.com/dinero/" class="btn btn-icon btn-lg btn-facebook btn-round">
                <i class="fab fa-facebook-square"></i>
              </a>
            </div>
          </div>
        </div>
      </div>
      <div class="section">
        <div class="container">
          <div class="row">
            <div class="col-md-8 ml-auto mr-auto">
              <h3 class="title">聖誕節就是要與浪浪一起過！</h3>
              <p><br>
				 在這溫馨的聖誕節，寵愛自家毛孩同時，別忘了還有許多浪浪，仍然找不到一個溫暖的家，浪浪們需要您的幫助，大家一起關懷分享愛，多款商品，超低義賣只要$99元！
<!--               <br /> -->
              <br /> </p>
<!--               <p class="blockquote blockquote-primary"> -->
<!--                 規則說明：<br>1. 每一場次競賽時間約60分鐘，採小、中、大型犬分組競賽。為確保比賽公平性，工作人員會在比賽前再次測量確認，如不符該場次比賽體型，將取消參賽資格。 -->
<!--                 <br>2. 活動場地內將會設置多種障礙物供參賽狗狗比賽，請飼主依照狗狗的能力範圍完成任務，切勿強行拉扯寵物牽繩。(飼主可自行決定是否使用牽繩) -->
<!--                 <br>3. 活動場地內有起跑線及終點線，現場工作人員將手持碼錶計時，參賽寵物一次一組於活動場地內進行比賽。踏入起跑線內計時開始，通過終點線計時停止，一組以2分鐘為限，其餘參賽者皆於場地外等候。 -->
<!--                 <br>4. 每場次比賽將選出前兩名進行頒獎。 -->
<!--                 <br>5. 此活動場地若無比賽進行，歡迎各位毛爸毛媽與寵物至活動區玩耍體驗。每位飼主約三分鐘，請排隊入場並依現場參與狀況適時調整活動時間。 -->
<!--                 <br>6. 本辦法若有未盡事宜，將隨時補充並公佈於活動網頁。 -->
<!--                 <small> -->
                  
<!--                 </small> -->
<!--               </p> -->
            </div>
          </div>
        </div>
      </div>
      
<!--       <div class="section section-blog col-md-10 ml-auto mr-auto"> -->
<!--         <div class="container"> -->
<!--           <div class="section-story-overview"> -->
<!--             <div class="row justify-content-center"> -->
<!--               <div class="col-md-6"> -->
<!--                 <div class="image-container" style="background-image: url('/img/ActImg/img1-1.jpg')">            -->
<!--                 </div> -->
<!--               </div> -->
              <!-- <div class="col-md-5"> -->
                <!-- First image on the right side, above the article -->
                <!-- <div class="image-container image-right" style="background-image: url('../assets/img/project16.jpg')">
                </div>
                <h3>So what does the new record for the lowest level of winter ice actually mean</h3>
                <p>The Arctic Ocean freezes every winter and much of the sea-ice then thaws every summer, and that process will continue whatever happens with climate change. Even if the Arctic continues to be one of the fastest-warming regions of the world, it will always be plunged into bitterly cold polar dark every winter. And year-by-year, for all kinds of natural reasons, there’s huge variety of the state of the ice.
                </p>
                <p>
                  For a start, it does not automatically follow that a record amount of ice will melt this summer. More important for determining the size of the annual thaw is the state of the weather as the midnight sun approaches and temperatures rise. But over the more than 30 years of satellite records, scientists have observed a clear pattern of decline, decade-by-decade.
                </p>
                <p>The Arctic Ocean freezes every winter and much of the sea-ice then thaws every summer, and that process will continue whatever happens with climate change. Even if the Arctic continues to be one of the fastest-warming regions of the world, it will always be plunged into bitterly cold polar dark every winter. And year-by-year, for all kinds of natural reasons, there’s huge variety of the state of the ice.
                </p>
              </div> -->
<!--             </div> -->
<!--           </div> -->
<!--         </div> -->
<!--       </div> -->

<!-- 	以下是實線 -->
      <div class="section section-blog-info">
        <div class="container">
          <div class="row justify-content-center">
            <div class="col-md-8 ml-auto mr-auto">
              <hr/>
            </div>
          </div>
        </div>
      </div>

      <div class="pricing-2">
        <div class="container">
          <div class="row justify-content-center">
            <div class="col-md-6 ml-auto mr-auto text-center">
              <h2 class="title">報名連結如下</h2>
              <ul class="nav nav-pills nav-pills-primary justify-content-center" role="tablist">
                <li class="nav-item">
                  <a class="nav-link active" data-toggle="" href="${pageContext.request.contextPath}/activities/activity.enroll/16" role="tablist">
                    點我報名
                  </a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" data-toggle="" href="${pageContext.request.contextPath}/activities/activity.bulletin" role="tablist">
                    回活動首頁
                  </a>
                </li>
              </ul>
            </div>
          </div>

<!--           <div class="row justify-content-center"> -->
<!--             <div class="col-md-4"> -->
<!--               <div class="card card-pricing card-background card-raised" style="background-image: url('/img/pricing2.jpg')"> -->
<!--                 <div class="card-body"> -->
<!--                   <h6 class="category text-info">Professional</h6> -->
<!--                   <h1 class="card-title"> -->
<!--                     <small>$</small>29</h1> -->
<!--                   <ul> -->
<!--                     <li> -->
<!--                       <b>5GB</b> Disk Space</li> -->
<!--                     <li> -->
<!--                       <b>50GB</b> Monthly Bandwidth</li> -->
<!--                     <li> -->
<!--                       <b>10</b> Email Accounts</li> -->
<!--                     <li> -->
<!--                       <b>Unlimited</b> subdomains</li> -->
<!--                   </ul> -->
<!--                   <a href="#pablo" class="btn btn-neutral btn-round"> -->
<!--                     Sign Up -->
<!--                   </a> -->
<!--                 </div> -->
<!--               </div> -->
<!--             </div> -->

  <div class="pricing-2">
    <div class="main">
      <div class="container">
        <div class="section">
          <h2 class="title text-center">您可能有興趣的活動</h2>
<!--           <div class="row justify-content-center"> -->
<!--           <div class="col-md-12"> -->
          <br />
          <div class="row">
            
            <div class="col-md-4">
              <div class="card card-plain card-blog">
                <div class="card-image">
                  <a href="">
                    <img class="img rounded img-raised" src="${pageContext.request.contextPath}/img/ActImg/img5.jpg" />
                  </a>
                </div>
                <div class="card-body">
                  <h6 class="category text-success">
                    知性
                  </h6>
                  <h4 class="card-title">
                    <a href="">分享毛孩醫療故事</a>
                  </h4>
                  <p class="card-description">
                    毛爸媽總有經歷過毛孩生病的時候，看著毛孩不舒服的樣子真的會令人心疼...歡迎毛爸媽分享毛孩的醫療故事。
                    <a href=""> 詳細內容 </a>
                    <div class="author">
                      <img src="${pageContext.request.contextPath}/img/ActImg/timelocate.jpg" alt="..." class="avatar img-raised">
                      <span>活動時間與地點：2022年10月8日至11月8日線上Webex分享</span>
                    </div>
                  </p>
                </div>
              </div>
            </div>
            
            <div class="col-md-4">
              <div class="card card-plain card-blog">
                <div class="card-image">
                  <a href="">
                    <img class="img rounded img-raised" src="${pageContext.request.contextPath}/img/ActImg/img7.jpg" />
                  </a>
                </div>
                <div class="card-body">
                  <h6 class="category text-success">
                    知性
                  </h6>
                  <h4 class="card-title">
                    <a href="">遇見我的愛</a>
                  </h4>
                  <p class="card-description">
                    「遇見我的愛」認養活動不僅走遍桃園，為流浪貓犬尋找新家，配合「認養送嫁妝、回娘家再加碼」的補助優惠。
                    <a href=""> 詳細內容 </a>
                    <div class="author">
                      <img src="${pageContext.request.contextPath}/img/ActImg/timelocate.jpg" alt="..." class="avatar img-raised">
                      <span>活動時間與地點：2022年10月19日桃園市龍潭渴望園區</span>
                    </div>
                  </p>
                </div>
              </div>
            </div>
            
            <div class="col-md-4">
              <div class="card card-plain card-blog">
                <div class="card-image">
                  <a href="">
                    <img class="img rounded img-raised" src="${pageContext.request.contextPath}/img/ActImg/img10.jpg" />
                  </a>
                </div>
                <div class="card-body">
                  <h6 class="category text-success">
                    知性
                  </h6>
                  <h4 class="card-title">
                    <a href="">牽緊你的小毛手 老齡寵物照護</a>
                  </h4>
                  <p class="card-description">
                    「不怕一萬，只怕萬一」。當毛小孩發生意外時，第一時間我們該如何應對？
                    <a href=""> 詳細內容 </a>
                    <div class="author">
                      <img src="${pageContext.request.contextPath}/img/ActImg/timelocate.jpg" alt="..." class="avatar img-raised">
                      <span>時間與地點：2022年11月28日台北貳樓仁愛店</span>
                    </div>
                  </p>
                </div>
              </div>
            </div>
            
            <div class="col-md-4">
              <div class="card card-plain card-blog">
                <div class="card-image">
                  <a href="">
                    <img class="img rounded img-raised" src="${pageContext.request.contextPath}/img/ActImg/img12.jpg" />
                  </a>
                </div>
                <div class="card-body">
                  <h6 class="category text-success">
                    知性
                  </h6>
                  <h4 class="card-title">
                    <a href="">寵物經絡按摩</a>
                  </h4>
                  <p class="card-description">
                    你知道狗狗也有「馬殺雞」嗎～今年我們推出新的主題課程─寵物經穴按摩，邀請到寵物經穴按摩達人─ Ken。
                    <a href=""> 詳細內容 </a>
                    <div class="author">
                      <img src="${pageContext.request.contextPath}/img/ActImg/timelocate.jpg" alt="..." class="avatar img-raised">
                      <span>時間與地點：2022年12月22日台北市大安區新生南路三段76巷5號</span>
                    </div>
                  </p>
                </div>
              </div>
            </div>
            
            <div class="col-md-4">
              <div class="card card-plain card-blog">
                <div class="card-image">
                  <a href="">
                    <img class="img rounded img-raised" src="${pageContext.request.contextPath}/img/ActImg/img13.jpg" />
                  </a>
                </div>
                <div class="card-body">
                  <h6 class="category text-success">
                    知性
                  </h6>
                  <h4 class="card-title">
                    <a href="">我要和貓宅一起</a>
                  </h4>
                  <p class="card-description">
                    貓咪可以是一個家裡面最重要、最生動、最美好的風景，有了家的貓不只是貓了，有了貓的家也不只是家了，天天跟貓宅在一起也不會膩！
                    <a href=""> 詳細內容 </a>
                    <div class="author">
                      <img src="${pageContext.request.contextPath}/img/ActImg/timelocate.jpg" alt="..." class="avatar img-raised">
                      <span>活動時間與地點：2023年1月26日花博爭豔館（台北捷運圓山站）</span>
                    </div>
                  </p>
                </div>
              </div>
            </div>
            </div>
            </div>
			</div> 
          </div>
        </div>
      </div>
    </div>
   
  </div>
  <!--   Core JS Files   -->
  <script src="${pageContext.request.contextPath}/js/core/jquery.min.js" type="text/javascript"></script>
  <script src="${pageContext.request.contextPath}/js/core/popper.min.js" type="text/javascript"></script>
  <script src="${pageContext.request.contextPath}/js/core/bootstrap.min.js" type="text/javascript"></script>
  <!--  Plugin for Switches, full documentation here: http://www.jque.re/plugins/version3/bootstrap.switch/ -->
  <script src="${pageContext.request.contextPath}/js/plugins/bootstrap-switch.js"></script>
  <!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
  <script src="${pageContext.request.contextPath}/js/plugins/nouislider.min.js" type="text/javascript"></script>
  <!--  Plugin for the DatePicker, full documentation here: https://github.com/uxsolutions/bootstrap-datepicker -->
  <script src="${pageContext.request.contextPath}/js/plugins/moment.min.js"></script>
  <!--	Plugin for Tags, full documentation here: https://github.com/bootstrap-tagsinput/bootstrap-tagsinputs  -->
  <script src="${pageContext.request.contextPath}/js/plugins/bootstrap-tagsinput.js"></script>
  <!--	Plugin for Select, full documentation here: http://silviomoreto.github.io/bootstrap-select -->
  <script src="${pageContext.request.contextPath}/js/plugins/bootstrap-selectpicker.js" type="text/javascript"></script>
  <!--  Plugin for the DateTimePicker, full documentation here: https://eonasdan.github.io/bootstrap-datetimepicker/ -->
  <script src="${pageContext.request.contextPath}/js/plugins/bootstrap-datetimepicker.js" type="text/javascript"></script>
  <!--  Google Maps Plugin    -->
  <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
  <!-- Control Center for Now Ui Kit: parallax effects, scripts for the example pages etc -->
  <script src="${pageContext.request.contextPath}/js/now-ui-kit.js?v=1.3.1" type="text/javascript"></script>
</body>

</html>