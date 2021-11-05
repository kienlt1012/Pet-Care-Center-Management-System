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
<main id="main">
    <!-- ======= Breadcrumbs Section ======= -->
    <section class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2><strong>User List</strong></h2>
          <ol>
            <li><a href="">User</a></li>
            <li>User List</li>
          </ol>
        </div>

      </div>
    </section><!-- Breadcrumbs Section -->

    <!-- ======= Customer List Section ======= -->
    <div class="container">
			<div class="table-wrapper">
				<div class="table-title">
					<div class="row">
						<div class="col-sm-8" data-aos="fade-up" data-aos-delay="120">							
							<button type="submit" class="btn btn-primary" data-toggle="modal"
								data-target="#addModal">
								<i class="icofont-plus-square"> Create New User</i>
							</button>				
						</div>
						<div class="col-sm-4" data-aos="fade-up" data-aos-delay="120">
							<div class="search-box">
								<input id="search" type="text" class="form-control"
									placeholder="Search&hellip;">
							</div>
						</div>
					</div>
				</div>
				<table class="table table-striped table-hover table-bordered" data-aos="fade-up" data-aos-delay="100">
					<thead>
						<tr>
							<th>ID</th>
							<th>Name</th>
							<th>Role</th>
							<th>Phone</th>
							<th>Email</th>
							<th>Address</th>
							<th>Username</th>
							<th>Password</th>
							<th></th>
							<th></th>
						</tr>
					</thead>
					<tbody id="myTable">
						<c:forEach var="user" items="${user}" varStatus="i">
							<tr>
								<td>${i.index +1 }</td>
								<td>${user.name }</td>
								<td>${user.role }</td>
								<td>${user.phone }</td>
								<td>${user.email }</td>
								<td>${user.address }</td>
								<td>${user.username }</td>
								<td class="hidetext">${user.password }</td>
								
								<td><a class="btn editbtn" data-toggle="modal"
									data-target="#editModal"><i class="icofont-pencil-alt-2"></i></a>
									<input type="hidden" id="id" value="${user.id }" /></td>
								<td><a class="btn deletebtn" data-toggle="modal"
									data-target="#deleteModal"><i class="icofont-bin"></i></a> <input
									type="hidden" id="id" value="${user.id }" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>				
			</div>
		</div>

		<!-- Add Modal -->
    <div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered" role="document">
      <form method="post" action="<c:url value='/admin/create_user'/>" >
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLongTitle">Create New User</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <div class="form-row">
              <div class="form-group col-md-12">
                <label for="name">User Name:</label>
                <input type="text" name="name" class="form-control" id="name" required data-rule="minlen:4" data-msg="Please enter at least 4 chars" />
                <div class="validate"></div>
              </div>
              <div class="form-group col-md-6">
                <label for="role">User Role:</label>
                <select id="role" name="role" class="form-control" required data-msg="Please choose the option">
                  <option hidden disabled selected value>-- select an option --</option>
                  <option value="Admin">Admin</option>
                  <option value="Customer">Customer</option>
                  <option value="Staff">Staff</option>
                  <option value="Vet">Vet</option>
                </select>                
                <div class="validate"></div>
              </div>    
              <div class="form-group col-md-6"></div>          
              <div class="form-group col-md-6">
                <label for="phone">User Phone:</label>
                <input type="text" name="phone" class="form-control" id="phone" required data-rule="minlen:4" data-msg="Please enter a valid chars" />
                <div class="validate"></div>
              </div>
              <div class="form-group col-md-6">
                <label for="email">User Email:</label>
                <input type="email" name="email" required class="form-control" id="email" />
                <div class="validate"></div>
              </div>
              <div class="form-group col-md-12">
                <label for="address">User Address:</label>
                <input type="text" name="address" required class="form-control" id="address" />
                <div class="validate"></div>
              </div>
              <div class="form-group col-md-6">
                <label for="username">User Username:</label>
                <input type="text" class="form-control" name="username" id="username" required data-rule="minlen:4" data-msg="Please enter at least 4 chars" />
                <div class="validate"></div>
              </div>
              <div class="form-group col-md-6">
                <label for="password">User Password:</label>
                <input type="password" class="form-control" name="password" id="password" required data-rule="minlen:4" data-msg="Please enter at least 4 chars" />
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
    
    <!-- Edit Modal -->
    <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered" role="document">
        <form method="post" action="<c:url value='/admin/edit_user'/>">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLongTitle">Edit User</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <div class="form-row">
              <div class="form-group col-md-6">
                <label for="role">User Role: </label>
                <select id="role" name="role" class="form-control" required data-msg="Please choose the option">                  
	                  <option value="">-- select an option --</option>
	                  <option value="Admin">Admin</option>
	                  <option value="Customer">Customer</option>
	                  <option value="Vet">Vet</option>
	                  <option value="Staff">Staff</option>
                </select>
                <div class="validate"></div>
              </div>
              <div class="form-group col-md-12">
                <label for="name">User Name:</label>
                <input type="text" name="name" class="form-control" id="name" required data-rule="minlen:4" data-msg="Please enter at least 4 chars" />
                <div class="validate"></div>
              </div>
              <div class="form-group col-md-6">
                <label for="phone">User Phone:</label>
                <input type="text" name="phone" class="form-control" id="phone" data-rule="minlen:4" data-msg="Please enter a valid chars" />
                <div class="validate"></div>
              </div>
              <div class="form-group col-md-6">
                <label for="email">User Email:</label>
                <input type="email" name="email" required class="form-control" id="email" />
                <div class="validate"></div>
              </div>
              <div class="form-group col-md-12">
                <label for="address">User Address:</label>
                <input type="text" name="address" required class="form-control" id="address" />
                <div class="validate"></div>
              </div>
              <div class="form-group col-md-6">
                <label for="username">User Username:</label>
                <input readonly="readonly" type="text" class="form-control" name="username" id="username" required data-rule="minlen:4" data-msg="Please enter at least 4 chars" />
                <div class="validate"></div>
              </div>
              <div class="form-group col-md-6">
                <label for="password">User Password:</label>
                <input readonly="readonly" type="password" class="form-control" name="password" id="password" required data-rule="minlen:4" data-msg="Please enter at least 4 chars" />
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
    
    <!-- Delete Modal -->
    <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered" role="document">
        <form method="post" action="<c:url value='/admin/delete_user'/>">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLongTitle">Delete User</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            Are you sure you want to delete these records?
          </div>
          <div class="modal-footer">
            <input type="button" class="btn btn-secondary" data-dismiss="modal" value="Cancel">
            <input type="submit" class="btn btn-primary" value="Delete">
            <input type="hidden" name="id" id="id" />
          </div>
        </div>
        </form>
      </div>
    </div>
  </main><!-- End #main -->
<script type="text/javascript">
	$(document).ready(function(){
		$('table .deletebtn').on('click', function(){
			var id = $(this).parent().find('#id').val();
			$('#deleteModal #id').val(id);
		})
		
		$('table .editbtn').on('click', function(){
			var id = $(this).parent().find('#id').val();
			$.ajax({
				type: 'GET',
				url: '${pageContext.request.contextPath}/api/user/find_' + id,
				success: function(user) {
					$('#editModal #id').val(user.id);
					$('#editModal #role').val(user.role);
					$('#editModal #name').val(user.name);
					$('#editModal #phone').val(user.phone);
					$('#editModal #email').val(user.email);
					$('#editModal #address').val(user.address);
					$('#editModal #username').val(user.username);
					$('#editModal #password').val(user.password);
				}
			})
		})
	});
</script>
<script>
$(document).ready(function(){
  $("#search").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myTable tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});
</script>
</body>
</html>