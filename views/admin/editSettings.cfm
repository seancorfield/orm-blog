<cfoutput>
	<form action="#buildURL(RC.action)#" method="POST" role="form">
		<legend>Edit Site Settings</legend>

		<div class="row">
			<div class="form-group col-md-4">
				<label for="siteName">Site Name</label>
				<input type="text" class="form-control" name="siteName" id="siteName" value="#RC.siteName#" placeholder="Site Name">
			</div>
		</div>
		<div class="row">
			<div class="form-group col-md-4">
				<label for="copyrightName">Site Copyright Name <small>(if different from site name)</small></label>
				<input type="text" class="form-control" name="copyrightName" id="copyrightName" value="#RC.copyrightName#" placeholder="Copyright Name">
			</div>
		</div>
		<div class="row">
			<div class="container">
				<button type="submit" name="btnSaveSettings" class="btn btn-primary">Submit</button>
			</div>
		</div>
	</form>
</cfoutput>