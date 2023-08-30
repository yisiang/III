<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8" />
  <link rel="apple-touch-icon" sizes="76x76" href="${pageContext.request.contextPath}/img/apple-icon.png">
  <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/img/favicon.png">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <title>
    活動報名系統
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

<body class="blog-posts sidebar-collapse">
  <!-- Navbar -->
            <jsp:include page="../UserNavBar.jsp"></jsp:include>  
  
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
      <div class="collapse navbar-collapse" data-nav-image="../assets/img/blurred-image-1.jpg" data-color="orange">
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
      <div class="page-header-image" data-parallax="true" style="background-image: url('../img/ActImg/wp1.jpg');">
      </div>
      <div class="content-center">
        <div class="row">
          <div class="col-md-8 ml-auto mr-auto text-center">
            <h2 class="title">活動報名系統</h2>
            <!-- <a href="#button" class="btn btn-primary btn-round  btn-icon">
              <i class="fab fa-twitter"></i>
            </a>
            <a href="#button" class="btn btn-primary btn-round  btn-icon">
              <i class="fab fa-instagram"></i>
            </a> -->
          </div>
        </div>
      </div>
    </div>
    
    <div class="main">
      <div class="container">
        <div class="section">
          <h3 class="title text-center">活動列表</h3>
          <br />
          <div class="row">

            <div class="col-md-4">
              <div class="card card-plain card-blog">
                <div class="card-image">
                  <a href="${pageContext.request.contextPath}/activities/activity.readmore/1">
                    <img class="img rounded img-raised" src="${pageContext.request.contextPath}/img/ActImg/img1.jpg" /> <!-- 有沒有..都可以，src="../img/ActImg/img1.jpg" 這寫法也可以，可能是因為沒有上上一層了！ -->
                  </a>
                </div>
                <div class="card-body">
                  <h6 class="category text-danger">
                    <!-- <i class="now-ui-icons media-2_sound-wave"></i> --> 競賽
                  </h6>
                  <h4 class="card-title">
                    <a href="${pageContext.request.contextPath}/activities/activity.readmore/1">毛孩運動會 - 汪汪障礙賽小型犬</a>
                  </h4>
                  <p class="card-description">
                    人狗同心其力斷金，什麼障礙都無法阻攔你們！跑跑跳跳玩耍趣，與寵寶貝的歡樂時光，是培養默契的最好時刻。
                    <a href="${pageContext.request.contextPath}/activities/activity.readmore/1"> 詳細內容 </a>
                    <div class="author">
                    <a href="https://www.google.com/maps/place/%E8%87%BA%E4%B8%AD%E5%9C%8B%E9%9A%9B%E5%B1%95%E8%A6%BD%E9%A4%A8/@24.1061762,120.6129192,15z/data=!4m5!3m4!1s0x0:0xa9a7553aeee5a3cc!8m2!3d24.1061762!4d120.6129192">
                      <img src="${pageContext.request.contextPath}/img/ActImg/timelocate.jpg" alt="..." class="avatar img-raised">
                    </a>
                      <span>活動時間與地點：2022年7月7日至10日台中國際展覽館</span>
                    </div>
                  </p>
                </div>
              </div>
            </div>

            <div class="col-md-4">
              <div class="card card-plain card-blog">
                <div class="card-image">
                  <a href="#">
                    <img class="img rounded img-raised" src="${pageContext.request.contextPath}/img/ActImg/img2.jpg" />
                  </a>
                </div>
                <div class="card-body">
                  <h6 class="category text-info">
                    娛樂
                  </h6>
                  <h4 class="card-title">
                    <a href="#">寵物泳池趴</a>
                  </h4>
                  <p class="card-description">
                    在炎炎夏日裡，沒有什麼比泳池派對更適合的活動了，從未嘗試游泳的毛小孩們，活動當天也有專業的指導員在一旁協助。
                    <a href="#"> 詳細內容 </a>
                    <div class="author">
                      <img src="${pageContext.request.contextPath}/img/ActImg/timelocate.jpg" alt="..." class="avatar img-raised">
                      <span>時間與地點：2022年7月19日高雄市三民區大地游泳池</span>
                    </div>
                  </p>
                </div>
              </div>
            </div>

            <div class="col-md-4">
              <div class="card card-plain card-blog">
                <div class="card-image">
                  <a href="#">
                    <img class="img rounded img-raised" src="${pageContext.request.contextPath}/img/ActImg/img3.JPG" />
                  </a>
                </div>
                <div class="card-body">
                  <h6 class="category text-info">娛樂</h6>
                  <h4 class="card-title">
                    <a href="#">毛孩與我 寵物拍攝活動</a>
                  </h4>
                  <p class="card-description">
                    臺文基將一同慶祝9/9台灣狗狗節，除了呼籲大家重視流浪動物議題，也希望能一解先前無法出門的苦悶。
                    <a href="#"> 詳細內容 </a>
                    <div class="author">
                      <img src="${pageContext.request.contextPath}/img/ActImg/timelocate.jpg" alt="..." class="avatar img-raised">
                      <span>2022年9月9日國立台灣文學館</span>
                    </div>
                  </p>
                </div>
              </div>
            </div>

            <div class="col-md-4">
              <div class="card card-plain card-blog">
                <div class="card-image">
                  <a href="#">
                    <img class="img rounded img-raised" src="${pageContext.request.contextPath}/img/ActImg/img4.jpg" />
                  </a>
                </div>
                <div class="card-body">
                  <h6 class="category text-warning">
                  餐飲
                  </h6>
                  <h4 class="card-title">
                    <a href="#">毛手毛腳做便當</a>
                  </h4>
                  <p class="card-description">
                    跟著專業寵物營養師，用精心規劃的毛孩鮮食食譜，一起來為毛小孩洗手做羹湯吧！
                    <a href="#"> 詳細內容 </a>
                    <div class="author">
                      <img src="${pageContext.request.contextPath}/img/ActImg/timelocate.jpg" alt="..." class="avatar img-raised">
                      <span>活動時間與地點：2022年09月19日至20日基隆市和平島公園</span>
                    </div>
                  </p>
                </div>
              </div>
            </div>

            <div class="col-md-4">
              <div class="card card-plain card-blog">
                <div class="card-image">
                  <a href="#">
                    <img class="img rounded img-raised" src="${pageContext.request.contextPath}/img/ActImg/img5.jpg" />
                  </a>
                </div>
                <div class="card-body">
                  <h6 class="category text-success">
                    知性
                  </h6>
                  <h4 class="card-title">
                    <a href="#">分享毛孩醫療故事</a>
                  </h4>
                  <p class="card-description">
                    毛爸媽總有經歷過毛孩生病的時候，看著毛孩不舒服的樣子真的會令人心疼...歡迎毛爸媽分享毛孩的醫療故事。
                    <a href="#"> 詳細內容 </a>
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
                  <a href="#">
                    <img class="img rounded img-raised" src="${pageContext.request.contextPath}/img/ActImg/img6.jpg" />
                  </a>
                </div>
                <div class="card-body">
                  <h6 class="category text-danger">
                    <!-- <i class="now-ui-icons media-2_sound-wave"></i> --> 競賽 
                  </h6>
                  <h4 class="card-title">
                    <a href="#">奔跑吧！狗小孩公益路跑競賽</a>
                  </h4>
                  <p class="card-description">
                    喜愛戶外活動與路跑的你，是否也曾想帶心愛的狗小孩一起參與活動？
                    <a href="#"> 詳細內容 </a>
                    <div class="author">
                      <img src="${pageContext.request.contextPath}/img/ActImg/timelocate.jpg" alt="..." class="avatar img-raised">
                      <span>時間與地點：2022年10月11日高雄市駁二特區</span>
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
                  <a href="#">
                    <img class="img rounded img-raised" src="${pageContext.request.contextPath}/img/ActImg/img8.jpg" />
                  </a>
                </div>
                <div class="card-body">
                  <h6 class="category text-success">
                    知性
                  </h6>
                  <h4 class="card-title">
                    <a href="#">帶你看世界 遛狗黃金指南</a>
                  </h4>
                  <p class="card-description">
                    身為飼主的我們，該如何正確每天安全的遛狗呢？請專業訓練師指導飼主如何教導狗狗在出門時聽從指令。
                    <a href="#"> 詳細內容 </a>
                    <div class="author">
                      <img src="${pageContext.request.contextPath}/img/ActImg/timelocate.jpg" alt="..." class="avatar img-raised">
                      <span>2022年11月1日台北雅樂軒酒店</span>
                    </div>
                  </p>
                </div>
              </div>
            </div>

            <div class="col-md-4">
              <div class="card card-plain card-blog">
                <div class="card-image">
                  <a href="#">
                    <img class="img rounded img-raised" src="${pageContext.request.contextPath}/img/ActImg/img9.jpg" />
                  </a>
                </div>
                <div class="card-body">
                  <h6 class="category text-warning">
                    餐飲
                  </h6>
                  <h4 class="card-title">
                    <a href="#">土地零距離「友善寵物野餐」</a>
                  </h4>
                  <p class="card-description">
                    總是在想，什麼樣的活動可以讓大夥而更貼近雲中街這片土地呢？時常能看見主人們牽著毛小孩來溜搭的畫面，
                    <a href="#"> 詳細內容 </a>
                    <div class="author">
                      <img src="${pageContext.request.contextPath}/img/ActImg/timelocate.jpg" alt="..." class="avatar img-raised">
                      <span>時間與地點：2022年11月19日雲林縣斗六市雲中街</span>
                    </div>
                  </p>
                </div>
              </div>
            </div>

            <div class="col-md-4">
              <div class="card card-plain card-blog">
                <div class="card-image">
                  <a href="#">
                    <img class="img rounded img-raised" src="${pageContext.request.contextPath}/img/ActImg/img10.jpg" />
                  </a>
                </div>
                <div class="card-body">
                  <h6 class="category text-success">
                    知性
                  </h6>
                  <h4 class="card-title">
                    <a href="#">牽緊你的小毛手 老齡寵物照護</a>
                  </h4>
                  <p class="card-description">
                    「不怕一萬，只怕萬一」。當毛小孩發生意外時，第一時間我們該如何應對？
                    <a href="#"> 詳細內容 </a>
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
                    <img class="img rounded img-raised" src="${pageContext.request.contextPath}/img/ActImg/img11.jpg" />
                  </a>
                </div>
                <div class="card-body">
                  <h6 class="category text-info">
                    娛樂
                  </h6>
                  <h4 class="card-title">
                    <a href="#">網寵時代 寵物攝影</a>
                  </h4>
                  <p class="card-description">
                    與毛小孩一同開心出門玩樂的同時，一定少不了留下與毛小孩的珍貴照片啦！
                    <a href="#"> 詳細內容 </a>
                    <div class="author">
                      <img src="${pageContext.request.contextPath}/img/ActImg/timelocate.jpg" alt="..." class="avatar img-raised">
                      <span>時間與地點：2022年12月10日台北市中山區一江街43號1樓</span>
                    </div>
                  </p>
                </div>
              </div>
            </div>
            
            <div class="col-md-4">
              <div class="card card-plain card-blog">
                <div class="card-image">
                  <a href="#">
                    <img class="img rounded img-raised" src="${pageContext.request.contextPath}/img/ActImg/img12.jpg" />
                  </a>
                </div>
                <div class="card-body">
                  <h6 class="category text-success">
                    知性
                  </h6>
                  <h4 class="card-title">
                    <a href="#">寵物經絡按摩</a>
                  </h4>
                  <p class="card-description">
                    你知道狗狗也有「馬殺雞」嗎～今年我們推出新的主題課程─寵物經穴按摩，邀請到寵物經穴按摩達人─ Ken。
                    <a href="#"> 詳細內容 </a>
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
                  <a href="#">
                    <img class="img rounded img-raised" src="${pageContext.request.contextPath}/img/ActImg/img13.jpg" />
                  </a>
                </div>
                <div class="card-body">
                  <h6 class="category text-success">
                    知性
                  </h6>
                  <h4 class="card-title">
                    <a href="#">我要和貓宅一起</a>
                  </h4>
                  <p class="card-description">
                    貓咪可以是一個家裡面最重要、最生動、最美好的風景，有了家的貓不只是貓了，有了貓的家也不只是家了，天天跟貓宅在一起也不會膩！
                    <a href="#"> 詳細內容 </a>
                    <div class="author">
                      <img src="${pageContext.request.contextPath}/img/ActImg/timelocate.jpg" alt="..." class="avatar img-raised">
                      <span>活動時間與地點：2023年1月26日花博爭豔館（台北捷運圓山站）</span>
                    </div>
                  </p>
                </div>
              </div>
            </div>

            <div class="col-md-4">
              <div class="card card-plain card-blog">
                <div class="card-image">
                  <a href="#">
                    <img class="img rounded img-raised" src="${pageContext.request.contextPath}/img/ActImg/img14.jpg" />
                  </a>
                </div>
                <div class="card-body">
                  <h6 class="category text-warning">
                    餐飲
                  </h6>
                  <h4 class="card-title">
                    <a href="#">毛起來做公益既野餐市集</a>
                  </h4>
                  <p class="card-description">
                    歡慶兒童節連續假期，帶著家中的小寶貝和毛小孩一起來去海灣森林野餐配海景、放風逛市集吃吃喝喝玩不停。
                    <a href="#"> 詳細內容 </a>
                    <div class="author">
                      <img src="${pageContext.request.contextPath}/img/ActImg/timelocate.jpg" alt="..." class="avatar img-raised">
                      <span>活動時間與地點：2023年4月5日至6日屏東縣恆春鎮墾丁大草原</span>
                    </div>
                  </p>
                </div>
              </div>
            </div>

            <div class="col-md-4">
              <div class="card card-plain card-blog">
                <div class="card-image">
                  <a href="#">
                    <img class="img rounded img-raised" src="${pageContext.request.contextPath}/img/ActImg/img15.jpg" />
                  </a>
                </div>
                <div class="card-body">
                  <h6 class="category text-info">
                    娛樂
                  </h6>
                  <h4 class="card-title">
                    <a href="#">毛起來做公益既野餐市集</a>
                  </h4>
                  <p class="card-description">
                    整個花博公園是寵物友善園區，不僅有超大空間供毛小孩跑跳，更不定期有專屬毛孩創意市集，毛孩來釋放能量，
                    <a href="#"> 詳細內容 </a>
                    <div class="author">
                      <img src="${pageContext.request.contextPath}/img/ActImg/timelocate.jpg" alt="..." class="avatar img-raised">
                      <span>活動時間與地點：2023年5月4日至6日高雄市文化中心</span>
                    </div>
                  </p>
                </div>
              </div>
            </div>
            
            <div class="col-md-4">
              <div class="card card-plain card-blog">
                <div class="card-image">
                  <a href="${pageContext.request.contextPath}/activities/activity.readmore/16">
                    <img class="img rounded img-raised" src="${pageContext.request.contextPath}/img/ActImg/img16.jpg" />
                  </a>
                </div>
                <div class="card-body">
                  <h6 class="category text-success">
                    知性
                  </h6>
                  <h4 class="card-title">
                    <a href="${pageContext.request.contextPath}/activities/activity.readmore/16">浪浪也想過聖誕</a>
                  </h4>
                  <p class="card-description">
                    在這溫馨的聖誕節，寵愛自家毛孩同時，別忘了還有許多浪浪，仍然找不到一個溫暖的家，浪浪們需要您的幫助，大家一起關懷分享愛，
                    <a href="${pageContext.request.contextPath}/activities/activity.readmore/16"> 詳細內容 </a>
                    <div class="author">
                    <a href="https://www.google.com/maps/place/%E6%A1%83%E5%9C%92%E8%97%9D%E6%96%87%E5%BB%A3%E5%A0%B4/@25.0174922,121.2955114,17z/data=!3m1!4b1!4m5!3m4!1s0x34681fb0e37d3b2d:0xbaf1fa9b489e264d!8m2!3d25.0174923!4d121.2999961">
                      <img src="${pageContext.request.contextPath}/img/ActImg/timelocate.jpg" class="avatar img-raised">
                    </a>
                      <span>2023年12月24日桃園市桃園藝文廣場</span>
                    </div>
                  </p>
                </div>
              </div>
            </div>
 


          </div>
        </div>
      </div>
    </div>
<!--     <footer class="footer" data-background-color="black"> -->
<!--       <div class="container"> -->
<!--         <div class="content"> -->
<!--           <div class="row"> -->
<!--             <div class="col-md-2"> -->
<!--               <h5>About Us</h5> -->
<!--               <ul class="links-vertical"> -->
<!--                 <li> -->
<!--                   <a href="" class="text-muted"> -->
<!--                     Blog -->
<!--                   </a> -->
<!--                 </li> -->
<!--                 <li> -->
<!--                   <a href="" class="text-muted"> -->
<!--                     About Us -->
<!--                   </a> -->
<!--                 </li> -->
<!--                 <li> -->
<!--                   <a href="" class="text-muted"> -->
<!--                     Presentation -->
<!--                   </a> -->
<!--                 </li> -->
<!--                 <li> -->
<!--                   <a href="" class="text-muted"> -->
<!--                     Contact Us -->
<!--                   </a> -->
<!--                 </li> -->
<!--               </ul> -->
<!--             </div> -->
<!--             <div class="col-md-2"> -->
<!--               <h5>Market</h5> -->
<!--               <ul class="links-vertical"> -->
<!--                 <li> -->
<!--                   <a href="" class="text-muted"> -->
<!--                     Sales FAQ -->
<!--                   </a> -->
<!--                 </li> -->
<!--                 <li> -->
<!--                   <a href="" class="text-muted"> -->
<!--                     How to Register -->
<!--                   </a> -->
<!--                 </li> -->
<!--                 <li> -->
<!--                   <a href="" class="text-muted"> -->
<!--                     Sell Goods -->
<!--                   </a> -->
<!--                 </li> -->
<!--                 <li> -->
<!--                   <a href="" class="text-muted"> -->
<!--                     Receive Payment -->
<!--                   </a> -->
<!--                 </li> -->
<!--                 <li> -->
<!--                   <a href="" class="text-muted"> -->
<!--                     Transactions Issues -->
<!--                   </a> -->
<!--                 </li> -->
<!--                 <li> -->
<!--                   <a href="" class="text-muted"> -->
<!--                     Affiliates Program -->
<!--                   </a> -->
<!--                 </li> -->
<!--               </ul> -->
<!--             </div> -->
<!--             <div class="col-md-4"> -->
<!--               <h5>Social Feed</h5> -->
<!--               <div class="social-feed"> -->
<!--                 <div class="feed-line"> -->
<!--                   <i class="fab fa-twitter"></i> -->
<!--                   <p>How to handle ethical disagreements with your clients.</p> -->
<!--                 </div> -->
<!--                 <div class="feed-line"> -->
<!--                   <i class="fab fa-facebook-square"></i> -->
<!--                   <p>A collection of 25 stunning sites that you can use for inspiration.</p> -->
<!--                 </div> -->
<!--               </div> -->
<!--             </div> -->
<!--             <div class="col-md-4"> -->
<!--               <h5>Follow Us</h5> -->
<!--               <ul class="social-buttons"> -->
<!--                 <li> -->
<!--                   <a href="" class="btn btn-icon btn-neutral btn-facebook btn-round"> -->
<!--                     <i class="fab fa-facebook-square"></i> -->
<!--                   </a> -->
<!--                 </li> -->
<!--                 <li> -->
<!--                   <a href="" class="btn btn-icon btn-neutral btn-dribbble btn-round"> -->
<!--                     <i class="fab fa-dribbble"></i> -->
<!--                   </a> -->
<!--                 </li> -->
<!--                 <li> -->
<!--                   <a href="" class="btn btn-icon btn-neutral btn-google btn-round"> -->
<!--                     <i class="fab fa-google-plus"></i> -->
<!--                   </a> -->
<!--                 </li> -->
<!--               </ul> -->
<!--             </div> -->
          </div>
        </div>
        <hr />
        <!-- <div class="copyright" id="copyright">
          &copy;
          <script>
            document.getElementById('copyright').appendChild(document.createTextNode(new Date().getFullYear()))
          </script>, Designed by
          <a href="https://www.invisionapp.com" target="_blank">Invision</a>. Coded by
          <a href="https://www.creative-tim.com" target="_blank">Creative Tim</a>.
        </div> -->
      </div>
    </footer>
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