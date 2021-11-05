<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.petcarecenter.util.SecurityUtils" %>
<%@ include file="/common/taglib.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- ======= Home Section ======= -->
  <section id="hero" class="d-flex align-items-center">

    <div class="container">
      <div class="clock">
      	<div class="display"></div>
      </div>
      <div class="row">
        <div class="col-lg-6 pt-5 pt-lg-0 order-2 order-lg-1">          
          <h1>Welcome Staff, <br> <%=SecurityUtils.getPrincipal().getName()%>!</h1>
          <h2>We love them like you do. <br> Helping your friends, be your friends for longer.</h2>
        </div>
        <div class="col-lg-6 order-1 order-lg-2 hero-img">
          <img src="<c:url value='/template/assets/img/hero-img.svg'/>" class="img-fluid animated" alt="">
        </div>
      </div>
    </div>

  </section><!-- End Hero -->
<script type="text/javascript">
  	setInterval(function() {
  		const clock = document.querySelector(".display");
  		let time = new Date();
  		let sec = time.getSeconds();
  		let min = time.getMinutes();
  		let hr = time.getHours();
  		let day = 'AM';
  		let today = time.getDate() + '/' + time.getMonth() + '/' + time.getFullYear();
  		if(hr > 12){ day = 'PM'; hr = hr - 12; }
  		if(hr == 0){hr = 12;}
  		if(sec < 10){sec = '0' + sec;}
  		if(min < 10){min = '0' + min;}
  		if(hr < 10){hr = '0' + hr;}
  		clock.textContent = today + " " + hr + ':' + min + ':' + sec + " " + day;
  	}) 
  </script>
</body>
</html>