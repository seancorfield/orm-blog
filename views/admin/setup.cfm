<cfoutput>
	<div class="page-header">
		<h1>Site Setup</h1>
	</div>
	<div class="alert alert-info">
		Before you can use the site, you must set a site name and create an administrator.
	</div>
	<cfif structKeyExists(RC, "error")>
		<div class="alert alert-danger">
			<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
			<strong>ERROR!</strong> #RC.error#
		</div>
	</cfif>
	<form action="#buildURL(RC.action)#" method="POST" role="form">
		<fieldset>
			<legend>Edit Site Settings</legend>

			<div class="row">
				<div class="form-group col-md-4">
					<label for="siteName">Site Name</label>
					<input type="text" class="form-control" name="siteName" id="siteName" value="#RC.siteName#" placeholder="Site Name" required>
				</div>
			</div>
			<div class="row">
				<div class="form-group col-md-4">
					<label for="copyrightName">Site Copyright Name <small>(if different from site name)</small></label>
					<input type="text" class="form-control" name="copyrightName" id="copyrightName" value="#RC.copyrightName#" placeholder="Copyright Name">
				</div>
			</div>
		</fieldset>

		<fieldset>
			<legend>Admin User</legend>
			<div class="row">
				<div class="form-group col-md-4">
					<label for="firstName">First Name</label>
					<input type="text" class="form-control" name="firstName" id="firstName" value="#RC.firstName#" placeholder="First Name" required>
				</div>
			</div>
			<div class="row">
				<div class="form-group col-md-4">
					<label for="lastName">Last Name</label>
					<input type="text" class="form-control" name="lastName" id="lastName" value="#RC.lastName#" placeholder="Last Name" required>
				</div>
			</div>
			<div class="row">
				<div class="form-group col-md-4">
					<label for="emailAddress">Email Address</label>
					<input type="email" class="form-control" name="emailAddress" id="emailAddress" value="#RC.emailAddress#" placeholder="you@yourdomain.com">
				</div>
			</div>
			<div class="row">
				<div class="form-group col-md-4">
					<label for="password">Password</label>
					<input type="password" class="form-control" name="password" id="password" placeholder="">
				</div>
			</div>
			<div class="row">
				<div class="form-group col-md-4">
					<label for="confirmPassword">Confirm Password</label>
					<input type="password" class="form-control" name="confirmPassword" id="confirmPassword" placeholder="">
				</div>
			</div>
			<input type="hidden" name="userPermissions" value="admin,user" />
		</fieldset>

		<div class="row">
			<div class="container">
				<button type="submit" name="btnSave" class="btn btn-primary">Submit</button>
			</div>
		</div>
	</form>
</cfoutput>