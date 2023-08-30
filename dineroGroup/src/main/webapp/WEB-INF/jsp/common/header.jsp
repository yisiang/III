<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<header>
	<nav class="navbar navbar-expand-md navbar-dark"
		style="background-color: tomato">

		<c:url var="HomeLink" value="/">
			<c:param name="action" value="login" />
		</c:url>

		<div>
			<a href="${HomeLink}" class="navbar-brand">Dinero</a>
		</div>
		<c:url var="loginLink" value="/login">
			<c:param name="action" value="login" />
		</c:url>

		<c:url var="logoutLink" value="/logout">
			<c:param name="action" value="logout" />
		</c:url>

		<ul class="navbar-nav navbar-collapse justify-content-end">
			<li><a href="${loginLink}" class="nav-link">登入</a></li>
			<li><a href="${logoutLink}" class="nav-link">登出</a></li>
		</ul>
	</nav>
</header>