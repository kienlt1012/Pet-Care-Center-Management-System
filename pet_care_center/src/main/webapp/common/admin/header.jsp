<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- ======= Header ======= -->
  <header id="header" class="fixed-top">
    <div class="container-fluid d-flex">

      <div class="logo mr-auto">
        <h1 class="text-light"><a href="<c:url value='/admin'/>"><span><strong>Pet Care Center </strong>Management System</span></a></h1>
      </div>

      <nav class="nav-menu d-none d-lg-block">
        <ul>
          <li class="active"><a href="<c:url value='/admin'/>"><strong>Home</strong></a></li>
          <li><a href="<c:url value='/admin/user_list'/>">User</a></li> 
          <li><a href="<c:url value='/admin/profile'/>">Profile</a></li> 
          <li><a href="<c:url value='/admin/equipment_list'/>">Equipment</a></li>           

          <li class="get-started"><a href="<c:url value='/logout'/>">Logout</a></li>
        </ul>
      </nav><!-- .nav-menu -->

    </div>
  </header><!-- End Header -->