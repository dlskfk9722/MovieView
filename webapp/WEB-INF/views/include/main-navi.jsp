<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

 <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
    <div class="container">
      <a class="navbar-brand js-scroll-trigger" href="/">SpringProject By Team3</a>
    <!--  <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        Menu
        <i class="fas fa-bars"></i>
      </button> -->
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item">
          	<c:if test="${sessionScope.loginId != null}">
            <a class="nav-link js-scroll-trigger" href="<c:url value="/user/logout"/>">LogOut</a>
            </c:if>
            <c:if test="${sessionScope.loginId  == null}">
            <a class="nav-link js-scroll-trigger" href="<c:url value="/user/login"/>">LogIn</a>
            </c:if>
          </li>
          <li class="nav-item">
          	<c:if test="${sessionScope.loginId == null }">
            <a class="nav-link js-scroll-trigger" href="<c:url value="/user/join"/>">SignUp</a>
            </c:if>
          </li>
          <li class="nav-item">
          	<c:if test="${sessionScope.loginId !=null}">
            <a class="nav-link js-scroll-trigger" href="/user/getuser?id=${sessionScope.loginId }">Welcome to ${sessionScope.loginId}</a>
            </c:if>
          </li>
        </ul>
      </div>
    </div>
  </nav>
