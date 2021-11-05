<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.petcarecenter.util.SecurityUtils" %>
<%@ include file="/common/taglib.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pet Care Center Management System</title>
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
          <h1>Welcome Customer, <br> <%=SecurityUtils.getPrincipal().getName()%>!</h1>
          <h2>We love them like you do. <br> Helping your friends, be your friends for longer.</h2>
          <a href="<c:url value='/login'/>" class="btn-get-started scrollto" 
          data-toggle="modal" data-target="#addModal" data-aos="fade-up" data-aos-delay="120">Make An Appointment</a>
        </div>
        <div class="col-lg-6 order-1 order-lg-2 hero-img">
          <img src="<c:url value='/template/assets/img/hero-img.svg'/>" class="img-fluid animated" alt="">
        </div>
      </div>
    </div>
  </section><!-- End Hero -->
  <!-- Add Modal -->
    <div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered" role="document">
      <form method="post" action="<c:url value='/customer/create_appointment'/>" >
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLongTitle">Create New Appointment</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <div class="form-row">
              <div class="form-group col-md-6">
                <label for="name">Pet Name:</label>
                <input type="text" name="petName" class="form-control" id="petName" required data-rule="minlen:4" data-msg="Please enter at least 4 chars" />
                <div class="validate"></div>
              </div>
              <div class="form-group col-md-6">
                <label for="name">Pet Owner:</label>
                <input type="text" name="owner" class="form-control" id="owner" required data-rule="minlen:4" data-msg="Please enter at least 4 chars" />
                <div class="validate"></div>
              </div>
              <div class="form-group col-md-6">
                <label for="phone">Service Type:</label>
               <!--  <select id="type" name="type" class="form-control" required data-msg="Please choose the option">
                  <option hidden disabled selected value>-- select an option --</option>
                  <option value="Treatment">Treatment</option>
                  <option value="Service">Service</option>
                </select> -->
                <input type="text" name="type" class="form-control" id="type" />
                <div class="validate"></div>
              </div>
              <div class="form-group col-md-6">
                <label for="email">Service Name:</label>
                <input type="text" name="name" class="form-control" id="name" />
                <div class="validate"></div>
              </div>
              <div class="form-group col-md-6">
                <label for="address">Date:</label>
                <input type="date" name="date" class="form-control" id="date" />
                <div class="validate"></div>
              </div>
              <div class="form-group col-md-6">
                <label for="username">Time:</label>
                <input type="time" class="form-control" name="time" id="time" />
                <div class="validate"></div>
              </div>
            </div>         
          </div>
          <div class="modal-footer">
            <input type="button" class="btn btn-secondary" data-dismiss="modal" value="Cancel">
            <input type="submit" class="btn btn-primary" value="Create">
          </div>
        </div>
        </form>
      </div>
    </div>
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