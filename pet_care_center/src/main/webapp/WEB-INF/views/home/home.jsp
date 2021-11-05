<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pet Care Center Management System</title>
</head>
<body>

	<!-- ======= Header ======= -->
  <header id="header" class="fixed-top">
    <div class="container-fluid d-flex">

      <div class="logo mr-auto">
        <h1 class="text-light"><a href="<c:url value='/home'/>"><span><strong>Pet Care Center </strong>Management System</span></a></h1>
      </div>

      <nav class="nav-menu d-none d-lg-block">
        <ul>
          <li class="active"><a href="<c:url value='/home'/>"><strong>Home</strong></a></li>
          <li><a href="#about">About Us</a></li>
          <li><a href="#team">Team</a></li>
          
          <li class="get-started"><a href="<c:url value='/login'/>">Login</a></li>
        </ul>
      </nav><!-- .nav-menu -->

    </div>
  </header><!-- End Header -->
  
  <!-- ======= Hero Section ======= -->
  <section id="hero" class="d-flex align-items-center">

    <div class="container">
      <div class="clock">
      	<div class="display"></div>
      </div>
      <div class="row">
        <div class="col-lg-6 pt-5 pt-lg-0 order-2 order-lg-1">
          <h1>The best care for your best friend</h1>
          <h2>We love them like you do. <br> Helping your friends, be your friends for longer.</h2>
          <a href="<c:url value='/login'/>" class="btn-get-started scrollto">Login</a>
        </div>
        <div class="col-lg-6 order-1 order-lg-2 hero-img">
          <img src="<c:url value='/template/assets/img/hero-img.svg'/>" class="img-fluid animated" alt="">
        </div>
      </div>
    </div>

  </section><!-- End Hero -->

  <main id="main">

    <!-- ======= About Section ======= -->
    <section id="about" class="about">
      <div class="container">

        <div class="row justify-content-between">
          <div class="col-lg-5 d-flex align-items-center justify-content-center about-img">
            <img src="<c:url value='/template/assets/img/about-img.svg'/>" class="img-fluid" alt="" data-aos="zoom-in">
          </div>
          <div class="col-lg-6 pt-5 pt-lg-0">
            <h3 data-aos="fade-up">ABOUT US</h3>
            
            <div class="row">
              <div class="col-md-6" data-aos="fade-up" data-aos-delay="100">
                <i class="bx bx-receipt"></i>
                <h4>Our team</h4>
                <p>We are non-proffessional designers
                  and software developers who are doing our first
                  real project </p>
              </div>
              <div class="col-md-6" data-aos="fade-up" data-aos-delay="200">
                <i class="bx bx-cube-alt"></i>
                <h4>Our page</h4>
                <p>We love our pets, you love yours.
                  Therefore it is important to have a good pet
                  care management system to maintain the 
                  operation of our team. That's why we've created a platform 
                  to help pet care businesses grow better every
                  day.</p>
              </div>
            </div>
          </div>
        </div>

      </div>
    </section><!-- End About Section -->

    <!-- ======= Team Section ======= -->
    <section id="team" class="team">
      <div class="container">

        <div class="section-title" data-aos="fade-up">
          <h2>TEAM</h2>
          <p>Our team is always here to help</p>
        </div>

        <div class="row">
          <div class="col-xl-4 col-lg-4 col-md-6" data-aos="zoom-in" data-aos-delay="100">
            <div class="member">
              <img src="<c:url value='/template/assets/img/team/team-1.jpg'/>" class="img-fluid" alt="">
              <div class="member-info">
                <div class="member-info-content">
                  <h4>Ly Trung Kien</h4>
                  <span>Administrator</span>
                </div>
              </div>
            </div>
          </div>

          <div class="col-xl-4 col-lg-4 col-md-6" data-aos="zoom-in" data-aos-delay="200">
            <div class="member">
              <img src="<c:url value='/template/assets/img/team/team-2.jpg'/>" class="img-fluid" alt="">
              <div class="member-info">
                <div class="member-info-content">
                  <h4>Nguyen Quynh Trang</h4>
                  <span>Receptionist</span>
                </div>
              </div>
            </div>
          </div>

          <div class="col-xl-4 col-lg-4 col-md-6" data-aos="zoom-in" data-aos-delay="300">
            <div class="member">
              <img src="<c:url value='/template/assets/img/team/team-4.jpg'/>" class="img-fluid" alt="">
              <div class="member-info">
                <div class="member-info-content">
                  <h4>Le Thi Phuong Thao</h4>
                  <span>Veterinarian</span>
                </div>
              </div>
            </div>
          </div>
        </div>

      </div>
    </section><!-- End Team Section -->
  </main><!-- End #main -->
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