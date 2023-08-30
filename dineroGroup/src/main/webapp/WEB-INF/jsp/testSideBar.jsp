<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
    
    <div class="sidebar" data-color="orange">
    
      <!--
        Tip 1: You can change the color of the sidebar using: data-color="blue | green | orange | red | yellow"
    -->
      <div class="logo">
        <a href="${pageContext.request.contextPath}/index" class="simple-text logo-mini">
          <i class="fa-solid fa-house"></i>          
        </a>
        <a href="${pageContext.request.contextPath}/index" class="simple-text logo-normal">
          Home
        </a>
        <div class="navbar-minimize">
          <button id="minimizeSidebar" class="btn btn-outline-white btn-icon btn-round">
            <i class="now-ui-icons text_align-center visible-on-sidebar-regular"></i>
            <i class="now-ui-icons design_bullet-list-67 visible-on-sidebar-mini"></i>
          </button>
        </div>
      </div>
  <div class="sidebar-wrapper" id="sidebar-wrapper">
    <div class="user">
      <div class="photo">
<security:authorize access="isAuthenticated()">        
<img src=<security:authentication property="principal.photo" /> />
      </div>
      <div class="info">
        <a data-toggle="collapse" href="#collapseExample" class="collapsed">
          <span>
           <security:authentication property="principal.fullname" />
            <b class="caret"></b>
          </span>
        </a>
        </security:authorize>
            <div class="clearfix"></div>
            <div class="collapse" id="collapseExample">
              <ul class="nav">
                <li>
                  <a href="#">
                    <span class="sidebar-mini-icon">MP</span>
                    <span class="sidebar-normal">My Profile</span>
                  </a>
                </li>
                <li>
                  <a href="#">
                    <span class="sidebar-mini-icon">EP</span>
                    <span class="sidebar-normal">Edit Profile</span>
                  </a>
                </li>
                <li>
                  <a href="#">
                    <span class="sidebar-mini-icon">S</span>
                    <span class="sidebar-normal">Settings</span>
                  </a>
                </li>
              </ul>
            </div>
          </div>
        </div>
        <ul class="nav">
          <li>
            <a href="${pageContext.request.contextPath}/users/findusers">
              <i class="fa-solid fa-user-tie"></i>
              <p>會員</p>
            </a>
          </li>
          <li>
            <a href="${pageContext.request.contextPath}/productform.controller">
              <i class="fa-solid fa-dog"></i>
              <p>Product</p>
            </a>
          </li><li>
            <a href="${pageContext.request.contextPath}/cart"">
              <i class="fa-solid fa-cart-shopping"></i>
              <p>Cart</p>
            </a>
          </li>
          <li>
            <a href="${pageContext.request.contextPath}/message">
              <i class="fa-solid fa-comments"></i>
              <p>留言板</p>
            </a>
          </li>
          <li>
            <a href="${pageContext.request.contextPath}/activities/activity.info">
              <i class="fa-solid fa-list-check"></i>
              <p>活動</p>
            </a>
          </li>
          <li>
            <a href="${pageContext.request.contextPath}/coupon">
             <i class="fa-solid fa-ticket"></i>
              <p>優惠券</p>
            </a>
          </li>
        </ul>
      </div>
    </div>