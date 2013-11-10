/**
*
* @file  /controllers/user.cfc
* @author
* @description
*
*/

component output="false" displayname=""  {

	public void function init(required org.corfield.framework fw) {
		variables.fw = fw;
	}

	public void function default(required struct RC) {

		return;
	}

	public void function edit(required struct RC) role="admin" {
		if (structKeyExists(RC, "btnSaveUser")) {
			VARIABLES.fw.service('userService.editUserAndSave','user');
		} else {
			VARIABLES.fw.service('userService.getUser','user');
		}

	}

	public void function endEdit() {
		if (structKeyExists(RC, "btnSaveUser")) {
			VARIABLES.fw.redirect('user');
		}
		for (var key in RC.user.getProperties()) {
			RC[key] = RC.user.getProperty(key);
		}
	}

	public void function signin(required struct RC) {
		if (structKeyExists(RC, "btnSignin")) {
			VARIABLES.fw.service('securityService.authenticateAndSignInUser','user');
		}
	}

	public void function endSignin() {
		// if (structKeyExists(RC, "btnSignin") && RC.user.getEmailAddress() == RC.emailAddress) {
		// 	SESSION.userdata = RC.user.getProperties();
		// 	// writeDump(var=SESSION,label="endSignin"); abort;
		// }
		if (REQUEST.security.isSignedIn()) {
			VARIABLES.fw.redirect('');
		}
	}

	public void function signout(required struct RC) {
		VARIABLES.fw.service('securityService.signOutUser','isSignedIn');
	}

	public void function endSignOut() {
		VARIABLES.fw.redirect('');
	}




}