<cfoutput>
	<form action="#buildUrl(rc.action)#" method="POST" class="form-horizontal" role="form">
			<div class="form-group">
				<legend>Sign In</legend>
			</div>
			<div class="row">
				<div class="form-group col-md-4">
					<label for="emailAddress">Email Address</label>
					<input type="email" class="form-control" name="emailAddress" id="emailAddress" placeholder="you@yourdomain.com">
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
					<button type="submit" name="btnSignin" class="btn btn-primary">Submit</button>
				</div>
			</div>
	</form>
</cfoutput>