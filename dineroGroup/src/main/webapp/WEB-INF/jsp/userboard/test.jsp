<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <nav class="navbar navbar-expand-lg bg-white fixed-top navbar-transparent" color-on-scroll="500">
    <div class="container">
      <div class="navbar-translate">
        <a class="navbar-brand" href="https://demos.creative-tim.com/now-ui-kit-pro/index.html" rel="tooltip" title="Designed by Invision. Coded by Creative Tim" data-placement="bottom" target="_blank">
          Dinero
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navigation" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-bar top-bar"></span>
          <span class="navbar-toggler-bar middle-bar"></span>
          <span class="navbar-toggler-bar bottom-bar"></span>
        </button>
      </div>
      <div class="collapse navbar-collapse" data-nav-image="../assets/img//blurred-image-1.jpg" data-color="orange">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item">
            <a href="/productuserform.controller" class="nav-link dropdown-toggle" id="navbarDropdownMenuLink1" >
              <i class="now-ui-icons design_app"></i>
              <p>所有商品</p>
            </a>
          </li>
          <li class="nav-item dropdown">
            <a href="#" class="nav-link dropdown-toggle" id="navbarDropdownMenuLink1" data-toggle="dropdown">
              <i class="now-ui-icons design_app"></i>
              <p>狗狗商品</p>
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink1">
<%--               <form class="dropdown-item" action="/productlist" method=get> --%>
<!--                 <input type="hidden" name="category" value="飼料"> -->
<!--                 <input type="hidden" name="petkind" value="狗"> -->
<!--                 <button type="submit"> -->
<!--                 <i class="now-ui-icons business_chart-pie-36"></i> 狗狗飼料 -->
<!--                 </button> -->
<%--               </form> --%>
              <a class="dropdown-item" href="/productlist?category=飼料&petkind=狗">
                <i class="now-ui-icons design_bullet-list-67"></i> 狗狗飼料
              </a>
              <a class="dropdown-item" href="/productlist?category=罐頭&petkind=狗">
                <i class="now-ui-icons design_bullet-list-67"></i> 狗狗罐頭
              </a>
              <a class="dropdown-item" href="/productlist?category=零食&petkind=狗">
                <i class="now-ui-icons education_paper"></i> 狗狗零食
              </a>
              <a class="dropdown-item" href="/productlist?category=用品&petkind=狗">
                <i class="now-ui-icons business_money-coins"></i> 狗狗用品
              </a>
            </div>
          </li>
          <li class="nav-item dropdown">
            <a href="#" class="nav-link dropdown-toggle" id="navbarDropdownMenuLink" data-toggle="dropdown">
              <i class="now-ui-icons files_paper" aria-hidden="true"></i>
              <p>貓貓商品</p>
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
              <a class="dropdown-item" href="/productlist?category=飼料&petkind=貓">
                <i class="now-ui-icons shopping_box"></i> 貓貓飼料
              </a>
              <a class="dropdown-item" href="/productlist?category=罐頭&petkind=貓">
                <i class="now-ui-icons ui-2_settings-90"></i> 貓貓罐頭
              </a>
              <a class="dropdown-item" href="/productlist?category=零食&petkind=貓">
                <i class="now-ui-icons text_align-left"></i> 貓貓零食
              </a>
              <a class="dropdown-item" href="/productlist?category=用品&petkind=貓">
                <i class="now-ui-icons sport_user-run"></i> 貓貓用品
              </a>
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
            </div>
          </li>
          <li class="nav-item dropdown">
            <a href="#" class="nav-link dropdown-toggle" id="navbarDropdownMenuLink" data-toggle="dropdown">
              <i class="now-ui-icons design_image" aria-hidden="true"></i>
              <p>活動專區</p>
            </a>

          </li>
          <li class="nav-item dropdown">
            <a href="#" class="nav-link dropdown-toggle" id="navbarDropdownMenuLink" data-toggle="dropdown">
              <i class="now-ui-icons design_image" aria-hidden="true"></i>
              <p>留言討論區</p>
            </a>

          </li>
          <li class="nav-item">
            <a class="nav-link btn btn-primary btn-round btn-icon" href="https://www.creative-tim.com/product/now-ui-kit-pro" target="_blank">
              <p><i class="now-ui-icons shopping_cart-simple"></i></p>
            </a>
          </li>
        </ul>
      </div>
    </div>
  </nav>