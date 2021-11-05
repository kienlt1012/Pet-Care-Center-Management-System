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
          <h2><strong>Pet List</strong></h2>
          <ol>
            <li><a href="customerpage_pet_list.html">Pet List</a></li>
            <li>Pet List</li>
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
							<h2></h2>
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
							<th>Name</th>
							<th>Owner</th>
							<th>Race</th>
							<th>Gender</th>
							<th>Age</th>
							<th>Weight</th>
							<th>Treatment</th>
							<th>Service</th>
							<th>Date</th>
						</tr>
					</thead>
					<tbody id="myTable">
						<c:forEach var="pet" items="${pet}" varStatus="i">						
							<tr>
								<td>${i.index +1 }</td>
								<td>${pet.name }</td>
								<td>${pet.owner }</td>
								<td>${pet.race }</td>
								<td>${pet.gender }</td>
								<td>${pet.age }</td>
								<td>${pet.weight }</td>
								<td>${pet.treatment }</td>
								<td>${pet.service }</td>
								<td>${pet.date }</td>
							</tr>						
						</c:forEach>
					</tbody>
				</table>			
			</div>
		</div>
	</main><!-- End #main -->
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