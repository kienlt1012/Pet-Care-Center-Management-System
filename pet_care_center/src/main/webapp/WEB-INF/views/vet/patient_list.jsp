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
          <h2><strong>Patient List</strong></h2>
          <ol>
            <li><a href="staffpage_customer_list.html">Patient</a></li>
            <li>Patient List</li>
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
								<i class="icofont-plus-square"> Create New Patient</i>
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
				<table class="table table-striped table-hover table-bordered"
					data-aos="fade-up" data-aos-delay="100">
					<thead>
						<tr>
							<th>ID</th>
							<th>Name</th>
							<th>Owner</th>
							<th>Race</th>
							<th>Gender</th>
							<th>Age</th>
							<th>Weight</th>
							<th>Treatment</th>
							<th>Date</th>
							<th></th>
							<th></th>
						</tr>
					</thead>
					<tbody id="myTable">						
						<c:forEach var="pet" items="${pet}" varStatus="i">
							<c:if test="${empty treatment}">
								<tr>
									<td>${i.index +1 }</td>
									<td>${pet.name }</td>
									<td>${pet.owner }</td>
									<td>${pet.race }</td>
									<td>${pet.gender }</td>
									<td>${pet.age }</td>
									<td>${pet.weight }</td>
									<td>${pet.treatment }</td>
									<td>${pet.date }</td>
									
									<td><a class="btn editbtn" data-toggle="modal"
										data-target="#editModal"><i class="icofont-pencil-alt-2"></i></a>
										<input type="hidden" id="id" value="${pet.id }" /></td>
									<td><a class="btn deletebtn" data-toggle="modal"
										data-target="#deleteModal"><i class="icofont-bin"></i></a> <input
										type="hidden" id="id" value="${pet.id }" /></td>
								</tr>
							</c:if>							
						</c:forEach>						 
					</tbody>
				</table>						
			</div>
		</div>
    
    <!-- Add Modal -->
    <div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered" role="document">
      <form method="post" action="<c:url value='/vet/create_patient'/>" >
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLongTitle"><b>Create New Patient</b></h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <div class="form-row">              
              <div class="form-group col-md-12">
                <label for="name">Pet Name*:</label>
                <input type="text" name="name" class="form-control" id="name" required data-rule="minlen:4" data-msg="Please enter at least 4 chars" />
                <div class="validate"></div>
              </div>
              <div class="form-group col-md-12">
                <label for="owner">Pet Owner*:</label>
                <input type="text" name="owner" class="form-control" id="owner" required data-rule="minlen:4" data-msg="Please enter at least 4 chars" />
                <div class="validate"></div>
              </div>
              <div class="form-group col-md-6">
                <label for="race">Pet Race*: </label>
                <select id="race" name="race" class="form-control" required data-msg="Please choose the option">                  
	                  <option value="">-- select an option --</option>
	                  <option value="Cat">Cat</option>
	                  <option value="Dog">Dog</option>
                </select>
                <div class="validate"></div>
              </div>
              <div class="form-group col-md-6">
                <label for="gender">Pet Gender*: </label>
                <select id="gender" name="gender" class="form-control" required data-msg="Please choose the option">                  
	                  <option value="">-- select an option --</option>
	                  <option value="Male">Male</option>
	                  <option value="Female">Female</option>
                </select>
                <div class="validate"></div>
              </div>
              <div class="form-group col-md-6">
                <label for="age">Pet Age:</label>
                <input type="number" class="form-control" name="age" id="age" data-msg="Please enter at least 4 chars" />
                <div class="validate"></div>
              </div>
              <div class="form-group col-md-6">
                <label for="weight">Pet Weight:</label>
                <input type="number" class="form-control" name="weight" id="weight"  data-msg="Please enter at least 4 chars" />
                <div class="validate"></div>
              </div>
              <div class="form-group col-md-6">
                <label for="treatment">Pet Treatment*: </label>
                <select id="treatment" name="treatment" class="form-control" required data-msg="Please choose the option">                  
	                  <option value="">-- select an option --</option>
	                  <option value="Sterilization">Sterilization</option>
	                  <option value="Ring worm">Ring worm</option>
	                  <option value="Vaccinate">Vaccinate</option>
	                  <option value="Diagnostic Test">Diagnostic Test</option>
	                  <option value="Health Check">Health Check</option>
                </select>
                <div class="validate"></div>
              </div>
              <div class="form-group col-md-6">
                <label for="weight">Date*:</label>
                <input type="date" class="form-control" name="date" id="date" required data-msg="Please enter at least 4 chars" />
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
        <form method="post" action="<c:url value='/vet/edit_patient'/>">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLongTitle">Edit User</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <div class="form-row">              
              <div class="form-group col-md-12">
                <label for="name">Pet Name:</label>
                <input type="text" name="name" class="form-control" id="name" required data-rule="minlen:4" data-msg="Please enter at least 4 chars" />
                <div class="validate"></div>
              </div>
              <div class="form-group col-md-12">
                <label for="owner">Pet Owner:</label>
                <input type="text" name="owner" class="form-control" id="owner" required data-rule="minlen:4" data-msg="Please enter at least 4 chars" />
                <div class="validate"></div>
              </div>
              <div class="form-group col-md-6">
                <label for="race">Pet Race: </label>
                <select id="race" name="race" class="form-control" required data-msg="Please choose the option">                  
	                  <option value="">-- select an option --</option>
	                  <option value="Cat">Cat</option>
	                  <option value="Dog">Dog</option>
                </select>
                <div class="validate"></div>
              </div>
              <div class="form-group col-md-6">
                <label for="gender">Pet Gender: </label>
                <select id="gender" name="gender" class="form-control" required data-msg="Please choose the option">                  
	                  <option value="">-- select an option --</option>
	                  <option value="Male">Male</option>
	                  <option value="Female">Female</option>
                </select>
                <div class="validate"></div>
              </div>
              <div class="form-group col-md-6">
                <label for="age">Pet Age:</label>
                <input type="number" class="form-control" name="age" id="age" data-rule="minlen:4" data-msg="Please enter at least 4 chars" />
                <div class="validate"></div>
              </div>
              <div class="form-group col-md-6">
                <label for="weight">Pet Weight:</label>
                <input type="number" class="form-control" name="weight" id="weight" data-rule="minlen:4" data-msg="Please enter at least 4 chars" />
                <div class="validate"></div>
              </div>
              <div class="form-group col-md-6">
                <label for="treatment">Pet Treatment: </label>
                <select id="treatment" name="treatment" class="form-control" required data-msg="Please choose the option">                  
	                  <option value="">-- select an option --</option>
	                  <option value="Sterilization">Sterilization</option>
	                  <option value="Ring worm">Ring worm</option>
	                  <option value="Vaccinate">Vaccinate</option>
	                  <option value="Diagnostic Test">Diagnostic Test</option>
	                  <option value="Health Check">Health Check</option>
                </select>
                <div class="validate"></div>
              </div>
              <div class="form-group col-md-6">
                <label for="weight">Date:</label>
                <input type="date" class="form-control" name="date" id="date" data-rule="minlen:4" data-msg="Please enter at least 4 chars" />
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
        <form method="post" action="<c:url value='/vet/delete_patient'/>">
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
				url: '${pageContext.request.contextPath}/api/pet/find_' + id,
				success: function(pet) {
					$('#editModal #id').val(pet.id);
					$('#editModal #name').val(pet.name);
					$('#editModal #owner').val(pet.owner);
					$('#editModal #race').val(pet.race);
					$('#editModal #gender').val(pet.gender);
					$('#editModal #age').val(pet.age);
					$('#editModal #weight').val(pet.weight);
					$('#editModal #treatment').val(pet.treatment);
					$('#editModal #date').val(pet.date);
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