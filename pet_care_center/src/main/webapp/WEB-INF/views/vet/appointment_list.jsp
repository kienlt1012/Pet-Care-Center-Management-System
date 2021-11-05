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
								<i class="icofont-plus-square"> Create New Appointment</i>
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
							<th>ID <i class="icofont-sort"></i></th>
							<th>Pet  <i class="icofont-sort"></i></th>
							<th>Owner <i class="icofont-sort"></i></th>
							<th>Service Type <i class="icofont-sort"></i></th>
							<th>Service Name <i class="icofont-sort"></i></th>
							<th>Date <i class="icofont-sort"></i></th>
							<th>Time <i class="icofont-sort"></i></th>
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
							</tr>
						</c:forEach>
					</tbody>
				</table>			
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