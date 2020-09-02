<div class="container-xl">
	<div class="table-responsive">
		<div class="table-wrapper">
			<div class="table-title">
				<div class="row">
					<div class="col-sm-6">
						<h2>Manage <b>Employees & CloudFlare Worker 2</b></h2>
					</div>
					<div class="col-sm-6">
						<a href="#addEmployeeModal" class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add New Employee</span></a>
						<a href="#deleteEmployeeModal" class="btn btn-danger" data-toggle="modal"><i class="material-icons">&#xE15C;</i> <span>Delete</span></a>						
					    <a href="#editEmployeeModal" class="btn btn-success" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i><span>Edit</span></a> 					
                    </div>
				</div>
			</div>
			<table class="table table-striped table-hover">
				<thead>
					<tr>
						<th>ID</th>
						<th>Name</th>
						<th>Email</th>
						<th>created_at</th>
						<th>updated_at</th>
					</tr>
				</thead>
				<tbody>

                    <cfquery name="myQuery" datasource="MyDB">
                        SELECT * FROM user_table
                    </cfquery>

                    <cfoutput query="myQuery"> 
                    <tr> 
                        <td>#myquery.id#</td>
						<td>#myquery.name#</td>
						<td>#myquery.email#</td>
						<td>#myquery.created_at#</td>
						<td>#myquery.updated_at#</td> 
						<td>
						</td>
					</tr>
					</cfoutput> 
					
				</tbody>
			</table> 
		</div>
	</div>        
</div>
<!-- Edit Modal HTML -->
<div id="addEmployeeModal" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<form action="index.cfm" method="post">
				<input type="hidden" name="action" value="home.add_user">
				<div class="modal-header">						
					<h4 class="modal-title">Add Employee</h4>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">	
					<div class="form-group">
						<label>Name</label>
						<input type="text" class="form-control" required name="name">
					</div>
                    <div class="form-group">
						<label>Password</label>
						<input type="password" class="form-control" required name="password">
					</div>
					<div class="form-group">
						<label>Email</label>
						<input type="email" class="form-control" required name="email">
					</div> 					
				</div>
				<div class="modal-footer">
					<input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
					<input type="submit" class="btn btn-success" value="Add">
				</div>
			</form>
		</div>
	</div>
</div>
<!-- Edit Modal HTML -->
<div id="editEmployeeModal" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<form action="index.cfm" method="post">
				<input type="hidden" name="action" value="home.update_user">
				<div class="modal-header">						
					<h4 class="modal-title">Edit Employee</h4>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">	
                	<div class="form-group">
						<label>Input ID</label>
						<input type="text" class="form-control" required name="id">
					</div>				
					<div class="form-group">
						<label>Name</label>
						<input type="text" class="form-control" required name="name">
					</div>
                    <div class="form-group">
						<label>Password</label>
						<input type="password" class="form-control" required name="password">
					</div>
					<div class="form-group">
						<label>Email</label>
						<input type="email" class="form-control" required name="email">
					</div>  				
				</div>
				<div class="modal-footer">
					<input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
					<input type="submit" class="btn btn-info" value="Save">
				</div>
			</form>
		</div>
	</div>
</div>
<!-- Delete Modal HTML -->
<div id="deleteEmployeeModal" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<form action="index.cfm" method="post">
				<input type="hidden" name="action" value="home.delete_user">
				<div class="modal-header">						
					<h4 class="modal-title">Delete Employee</h4>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">	
                	<div class="form-group">
						<label>Input ID</label>
						<input type="text" class="form-control" required name="id">
					</div>				
					<p>Are you sure you want to delete these Records?</p>
					<p class="text-warning"><small>This action cannot be undone.</small></p>
				</div>
				<div class="modal-footer">
					<input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
					<input type="submit" class="btn btn-danger" value="Delete">
				</div>
			</form>
		</div>
	</div>
</div> 