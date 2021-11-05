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
<main id="main">

    <!-- ======= Breadcrumbs Section ======= -->
    <section class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2><strong>View Profile</strong></h2>
          <ol>
            <li><a href="">Profile</a></li>
            <li>View Profile</li>
          </ol>
        </div>

      </div>
    </section><!-- Breadcrumbs Section -->

    <!-- ======= Profile Details Section ======= -->
    <section id="services" class="services section-bg">
      <div class="container">     
        <div class="box" data-aos="fade-up" data-aos-delay="100">              
            <div class="icon" align = "center"><i class="bx bx-file"></i></div>
            <h4 class="title" align = "center">About Me</h4>             
            <p class="description"><b>Name</b>: ${user.name}</p> <br>  
            <p class="description"><b>Address</b>: ${user.address}</p> <br>
            <p class="description"><b>Email</b>: ${user.email}</p> <br>
            <p class="description"><b>Phone</b>: ${user.phone}</p> <br>
            <p class="description"><b>Username</b>: ${user.username}</p> <br>         
	        <div align="center" data-aos="fade-up" data-aos-delay="100">
				<button type="submit" class="btn btn-primary editbtn" data-toggle="modal" data-target="#editModal"> Update Profile </button>
				<input type="hidden" id="id" value="${user.id}" />
			</div>        
        </div>       
      </div>
    </section><!-- End Portfolio Details Section -->
    
    <!-- Edit Modal -->
    <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered" role="document">
        <form method="post" action="<c:url value='/admin/edit_profile'/>" >
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLongTitle">Edit Profile</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <div class="form-row">
              
              <div class="form-group col-md-12">
                <label for="name">Name*:</label>
                <input type="text" name="name" class="form-control" id="name" required data-rule="minlen:4" data-msg="Please enter at least 4 chars" />
                <div class="validate"></div>
              </div>
              <div class="form-group col-md-12">
                <label for="address">Address:</label>
                <input type="text" name="address" class="form-control" id="address" />
                <div class="validate"></div>
              </div>
              <div class="form-group col-md-6">
                <label for="email">Email:</label>
                <input type="email" name="email" class="form-control" id="email" />
                <div class="validate"></div>
              </div>
              <div class="form-group col-md-6">
                <label for="phone">Phone*:</label>
                <input type="text" name="phone" class="form-control" id="phone" required data-rule="minlen:4" data-msg="Please enter a valid chars" />
                <div class="validate"></div>
              </div>
              <div class="form-group col-md-6">
                <label for="username">Username (cannot change):</label>
                <input readonly="readonly" type="text" class="form-control" name="username" id="username" data-rule="minlen:4" data-msg="Please enter at least 4 chars" />
                <div class="validate"></div>
              </div>
              <div class="form-group col-md-6">
                <label for="password">Password*:</label>
                <input type="password" class="form-control" name="password" id="password" required data-rule="minlen:4" data-msg="Please enter at least 4 chars" />
                <div class="validate"></div>
              </div>
            </div>                    
          </div>
          <div class="modal-footer">
            <input type="button" class="btn btn-secondary" data-dismiss="modal" value="Cancel">
            <input type="submit" class="btn btn-primary" value="Edit">
            <input type="hidden" name="id" id="id" />
          </div>
        </div>
        </form>
      </div>
    </div>

  </main><!-- End #main -->
  <script type="text/javascript">
	$(document).ready(function(){
		$('div .editbtn').on('click', function(){
			var id = $(this).parent().find('#id').val();
			$.ajax({
				type: 'GET',
				url: '${pageContext.request.contextPath}/api/user/find_' + id,
				success: function(user) {
					$('#editModal #name').val(user.name);					
					$('#editModal #address').val(user.address);
					$('#editModal #email').val(user.email);
					$('#editModal #phone').val(user.phone);
					$('#editModal #username').val(user.username);					
				}
			})
		})
	});
</script>
</body>
</html>