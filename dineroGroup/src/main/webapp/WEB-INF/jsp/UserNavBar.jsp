<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<nav
  class="navbar navbar-expand-lg bg-white fixed-top navbar-transparent"
  color-on-scroll="500"
>
  <div class="container">
    <div class="navbar-translate">
      <a
        class="navbar-brand"
        href="${pageContext.request.contextPath}/index"
        rel="tooltip"
     
        data-placement="bottom"
        
      >
        Dinero
      </a>
      <button
        class="navbar-toggler"
        type="button"
        data-toggle="collapse"
        data-target="#navigation"
        aria-controls="navigation-index"
        aria-expanded="false"
        aria-label="Toggle navigation"
      >
        <span class="navbar-toggler-bar top-bar"></span>
        <span class="navbar-toggler-bar middle-bar"></span>
        <span class="navbar-toggler-bar bottom-bar"></span>
      </button>
    </div>
    <div
      class="collapse navbar-collapse"
      data-nav-image="${pageContext.request.contextPath}/img//blurred-image-1.jpg"
      data-color="orange"
    >
      <ul class="navbar-nav ml-auto">
        <li class="nav-item">
          <a
            href="${pageContext.request.contextPath}/productuserform.controller"
            class="nav-link dropdown-toggle"
            id="navbarDropdownMenuLink1"
          >
            <i class="now-ui-icons design_app"></i>
            <p>所有商品</p>
          </a>
        </li>
        <li class="nav-item dropdown">
          <a
            href="#"
            class="nav-link dropdown-toggle"
          
            data-toggle="dropdown"
          >
            <i class="now-ui-icons design_app"></i>
            <p>狗狗商品</p>
          </a>
          <div
            class="dropdown-menu dropdown-menu-right"
            aria-labelledby="navbarDropdownMenuLink1"
          >

            <a
              class="dropdown-item"
              href="${pageContext.request.contextPath}/productlist?category=飼料&petkind=狗"
            >
              <i class="now-ui-icons design_bullet-list-67"></i> 狗狗飼料
            </a>
            <a
              class="dropdown-item"
              href="${pageContext.request.contextPath}/productlist?category=罐頭&petkind=狗"
            >
              <i class="now-ui-icons design_bullet-list-67"></i> 狗狗罐頭
            </a>
            <a
              class="dropdown-item"
              href="${pageContext.request.contextPath}/productlist?category=零食&petkind=狗"
            >
              <i class="now-ui-icons education_paper"></i> 狗狗零食
            </a>
            <a
              class="dropdown-item"
              href="${pageContext.request.contextPath}/productlist?category=用品&petkind=狗"
            >
              <i class="now-ui-icons business_money-coins"></i> 狗狗用品
            </a>
          </div>
        </li>
        <li class="nav-item dropdown">
          <a
            href="#"
            class="nav-link dropdown-toggle"
            id="navbarDropdownMenuLink"
            data-toggle="dropdown"
          >
            <i class="now-ui-icons files_paper" aria-hidden="true"></i>
            <p>貓貓商品</p>
          </a>
          <div
            class="dropdown-menu dropdown-menu-right"
            aria-labelledby="navbarDropdownMenuLink"
          >
            <a
              class="dropdown-item"
              href="${pageContext.request.contextPath}/productlist?category=飼料&petkind=貓"
            >
              <i class="now-ui-icons shopping_box"></i> 貓貓飼料
            </a>
            <a
              class="dropdown-item"
              href="${pageContext.request.contextPath}/productlist?category=罐頭&petkind=貓"
            >
              <i class="now-ui-icons ui-2_settings-90"></i> 貓貓罐頭
            </a>
            <a
              class="dropdown-item"
              href="${pageContext.request.contextPath}/productlist?category=零食&petkind=貓"
            >
              <i class="now-ui-icons text_align-left"></i> 貓貓零食
            </a>
            <a
              class="dropdown-item"
              href="${pageContext.request.contextPath}/productlist?category=用品&petkind=貓"
            >
              <i class="now-ui-icons sport_user-run"></i> 貓貓用品
            </a>
          </div>
        </li>
        <li class="nav-item">
          <a
            href="${pageContext.request.contextPath}/activities/activity.bulletin"
            class="nav-link dropdown-toggle"
            id="navbarDropdownMenuLink1"
          >
            <i class="now-ui-icons design_image" aria-hidden="true"></i>
            <p>活動專區</p>
          </a>
        </li>

        <li class="nav-item">
          <a
            href="${pageContext.request.contextPath}/articles"
            class="nav-link dropdown-toggle"
            id="navbarDropdownMenuLink1"
          >
            <i class="now-ui-icons design_app"></i>
            <p>留言討論區</p>
          </a>
        </li>
        <li class="nav-item dropdown">
          <a
            href="#"
            class="nav-link dropdown-toggle"
          
            data-toggle="dropdown"
          >
            <i class="now-ui-icons design_app"></i>
            <p>會員中心</p>
          </a>
          <div
            class="dropdown-menu dropdown-menu-right"
            aria-labelledby="navbarDropdownMenuLink1"
          >

            <a
              class="dropdown-item"
              href="${pageContext.request.contextPath}/showMyLoginPage"
            >
              <i class="now-ui-icons design_bullet-list-67"></i> 登入
            </a>
 
            <a
              class="dropdown-item"
              href="${pageContext.request.contextPath}/logout"
            >
              <i class="now-ui-icons design_bullet-list-67"></i> 登出
            </a>
             <a
              class="dropdown-item"
              href="${pageContext.request.contextPath}/showmemberregist"
            >
              <i class="now-ui-icons design_bullet-list-67"></i> 註冊
            </a>
          </a>
           <a
              class="dropdown-item"
              href="${pageContext.request.contextPath}/likepage"
            >
              <i class="now-ui-icons design_bullet-list-67"></i> 我的收藏
            </a>
          <a
           class="dropdown-item"
           href="${pageContext.request.contextPath}/shop/myorder"
         >
           <i class="now-ui-icons design_bullet-list-67"></i> 我的訂單
         </a>
            
          </div>
          
        </li>
        <li class="nav-item">
          <a
            class="nav-link btn btn-primary btn-round btn-icon"
            href="${pageContext.request.contextPath}/shop/shoppingList"
            
          >
            <p><i class="now-ui-icons shopping_cart-simple"></i></p>
          </a>
        </li>
                <li class="nav-item" style="margin-top: 10px ; margin-left: 20px; ">
          <a
           class=""
           href="${pageContext.request.contextPath}/shop/myorder" style="font-size: larger"
         >
            歡迎回來，${name}
         </a>
      </li>
      </ul>
    </div>
  </div>
</nav>
