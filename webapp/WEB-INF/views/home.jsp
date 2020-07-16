<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="include/static-head.jsp"/>
<style type="text/css">
body{
	background-color: #090B08;
}
</style>
</head>

<body id="page-top">
<jsp:include page="include/main-navi.jsp"/>
  <!-- Header -->
  <header class="masthead">
    <div class="container d-flex h-100 align-items-center">
      <div class="mx-auto text-center">
      <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        <h1 class="mx-auto my-0 text-uppercase">MOVIE VIEW</h1>
        <h2 class="text-white-50 mx-auto mt-2 mb-5">We provide Movie Introduction &  Movie Reviews</h2>
        <a href="<c:url value="/movieboard/list"/>" class="btn btn-dark js-scroll-trigger">Let's Go!</a>
      </div>
    </div>
  </header>
  
  <!-- Contact Sections -->
  <section class="contact-section bg-black">
    <div class="container">
      <div class="row">
		yes
      </div>

      <div class="social d-flex justify-content-center">
        <a href="#" class="mx-2">
          <i class="fab fa-twitter"></i>
        </a>
        <a href="#" class="mx-2">
          <i class="fab fa-facebook-f"></i>
        </a>
        <a href="#" class="mx-2">
          <i class="fab fa-github"></i>
        </a>
      </div>

    </div>
  </section>

<jsp:include page="include/main-footer.jsp"/>
<jsp:include page="include/plugin-js.jsp"/>

</body>

</html>