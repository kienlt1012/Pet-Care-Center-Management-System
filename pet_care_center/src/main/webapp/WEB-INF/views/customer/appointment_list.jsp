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
          <h2><strong>Appointment List</strong></h2>
          <ol>
            <li><a href="">Appointment</a></li>
            <li>Appointment List</li>
          </ol>
        </div>

      </div>
    </section><!-- Breadcrumbs Section -->

    <!-- ======= Customer List Section ======= -->
    <div class="container">
			<div class="table-wrapper">
				<div class="table-title">
					<div class="row">
						<div class="col-sm-8">
							<button type="submit" class="btn btn-primary" data-toggle="modal" data-target="#addModal" 
								data-aos="fade-up" data-aos-delay="100">
								<i class="icofont-plus-square"> Make An Appointment</i>
							</button>
						</div>
						<div class="col-sm-4">
							<div class="search-box">
								<input id="search" type="text" class="form-control"
									placeholder="Search&hellip;">
							</div>
						</div>
					</div>
				</div>
				<table class="table table-striped table-hover table-bordered"
					data-aos="fade-up" data-aos-delay="100">
					<thead>
						<tr>
							<th>ID</th>
							<th>Pet</th>
							<th>Owner</th>
							<th>Service Type</th>
							<th>Service Name</th>
							<th>Date</th>
							<th>Time</th>
							<th></th>
						</tr>
					</thead>
					<tbody id="myTable">
						<c:forEach var="appointment" items="${appointment}" varStatus="i">
							<tr>
								<td>${i.index +1 }</td>
								<td>${appointment.petName }</td>
								<td>${appointment.owner }</td>
								<td>${appointment.type }</td>
								<td>${appointment.name }</td>
								<td>${appointment.date }</td>
								<td>${appointment.time }</td>
								<td><a class="btn deletebtn" data-toggle="modal"
									data-target="#deleteModal"><i class="icofont-bin"></i></a> 
									<input type="hidden" id="id" value="${appointment.id }" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>			
			</div>
		</div>
		
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
                <label for="petName">Pet Name:</label>
                <input type="text" name="petName" class="form-control" id="petName" required data-rule="minlen:4" data-msg="Please enter at least 4 chars" />
                <div class="validate"></div>
              </div>
              <div class="form-group col-md-6">
                <label for="owner">Pet Owner:</label>
                <input type="text" name="owner" class="form-control" id="owner" required data-rule="minlen:4" data-msg="Please enter at least 4 chars" />
                <div class="validate"></div>
              </div>
              <div class="form-group col-md-6">
                <label for="phone">Service Type:</label>
                <select id="type" name="type" class="form-control" required data-msg="Please choose the option">
                  <option hidden disabled selected value>-- select an option --</option>
                  <option value="Treatment">Treatment</option>
                  <option value="Service">Service</option>
                </select>                
                <div class="validate"></div>
              </div>
              <div class="form-group col-md-6">
                <label for="email">Service Description:</label>
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
		
		<!-- Delete Modal -->
    <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered" role="document">
        <form method="post" action="<c:url value='/customer/delete_appointment'/>">
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
            <input type="button" class="btn btn-secondary" data-dismiss="modal" value="Cancel" />
            <input type="submit" class="btn btn-primary" value="Delete" />
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