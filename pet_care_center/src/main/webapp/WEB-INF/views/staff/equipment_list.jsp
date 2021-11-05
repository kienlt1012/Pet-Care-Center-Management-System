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
          <h2><strong>Equipment List</strong></h2>
          <ol>
            <li><a href="">Equipment</a></li>
            <li>Equipment List</li>
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
				<table class="table table-striped table-hover table-bordered" data-aos="fade-up" data-aos-delay="100">
					<thead>
						<tr>
							<th>ID</th>
							<th>Name</th>
							<th>Quantity</th>
							<th>In Use</th>
							<th>In Stock</th>
							<th></th>
						</tr>
					</thead>
					<tbody id="myTable">
						<c:forEach var="equipment" items="${equipment}" varStatus="i">
							<tr>
								<td>${i.index +1 }</td>
								<td>${equipment.eqName }</td>
								<td>${equipment.quantity }</td>
								<td>${equipment.inUse }</td>
								<td>${equipment.inStock }</td>
								
								<td><a class="btn editbtn" data-toggle="modal"
									data-target="#editModal"><i class="icofont-pencil-alt-2"></i></a>
									<input type="hidden" id="id" value="${equipment.id }" />
								</td>								
							</tr>
						</c:forEach>
					</tbody>
				</table>				
			</div>
		</div>
    
    <!-- Edit Modal -->
    <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered" role="document">
        <form method="post" action="<c:url value='/admin/edit_equipment'/>">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLongTitle">Edit Equipment</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <div class="form-row">
              
              <div class="form-group col-md-12">
                <label for="eqName">Equipment Name:</label>
                <input readonly="readonly" type="text" name="eqName" class="form-control" id="eqName" required data-rule="minlen:4" data-msg="Please enter at least 4 chars" />
                <div class="validate"></div>
              </div>
              <div class="form-group col-md-6">
                <label for="quantity">Equipment Quantity:</label>
                <input readonly="readonly" type="number" name="quantity" class="form-control" id="quantity" required data-rule="minlen:4" data-msg="Please enter a valid chars" />
                <div class="validate"></div>
              </div>
              <div class="form-group col-md-6">
                <label for="inUse">Equipment In Use:</label>
                <input type="number" name="inUse" class="form-control" id="inUse" />
                <div class="validate"></div>
              </div>
              <div class="form-group col-md-6">
                <label for="inStock">Equipment In Stock:</label>
                <input type="number" name="inStock" class="form-control" id="inStock" />
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
		$('table .editbtn').on('click', function(){
			var id = $(this).parent().find('#id').val();
			$.ajax({
				type: 'GET',
				//url: '<c:url value="/api/equipment/find_"/>' + id,
				url: '${pageContext.request.contextPath}/api/equipment/find_' + id,
				success: function(equipment) {
					$('#editModal #id').val(equipment.id);
					$('#editModal #eqName').val(equipment.eqName);
					$('#editModal #quantity').val(equipment.quantity);
					$('#editModal #inUse').val(equipment.inUse);
					$('#editModal #inStock').val(equipment.inStock);
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