<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- ======= Header ======= -->
  <header id="header" class="fixed-top">
    <div class="container-fluid d-flex">

      <div class="logo mr-auto">
        <h1 class="text-light"><a href="<c:url value='/home'/>"><span><strong>Pet Care Center </strong>Management System</span></a></h1>
      </div>
    </div>
  </header><!-- End Header -->

  <!-- ======= Hero Section ======= -->
  <section id="hero" class="d-flex align-items-center">
    <div class="login">
      <p class="sign" align="center">Login</p>
      
      <c:if test="${param.incorrectAccount != null }">
      	<div class ="alert alert-danger" align="center"> Username or password incorrect</div>
      </c:if>     
      <c:if test="${param.accessDenied != null }">
      	<div class ="alert alert-danger" align="center"> You are not authorized</div>
      </c:if>
      
      <form class="form1" action="j_spring_security_check" method="post">

        <input class="un " type="text" align="center" name = "j_username" placeholder="Username">
        <input class="pass" type="password" align="center" name = "j_password" placeholder="Password">
      	
        <button class="submit" type="submit" align="center">Login</button>
      </form>              
     
    </div>
  </section><!-- End Hero -->

</body>
</html>