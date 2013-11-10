/**
*
* @file  /services/securityService.cfc
* @author
* @description
*
*/

component extends="baseService" output="false" displayname="securityService"  {

	public function init(){
		return this;
	}
	public boolean function isSignedIn() {
		if (structKeyExists(SESSION, "userdata")) {
			return true;
		}
		return false;
	}

	public boolean function isAllowed(required string requiredRole, required struct sessionData) {

		if (isStruct(ARGUMENTS[1])) { ARGUMENTS = ARGUMENTS[1]; }
		if (ARGUMENTS.requiredRole == 'guest') { return true; }
		if (structKeyExists(ARGUMENTS.sessionData, "userdata")) {
			var _userService = new userService();
			var _user = _userService.getUser(userId=ARGUMENTS.sessionData.userdata.id);
			for (var permission in _user.getPermissions()) {
				if (permission == ARGUMENTS.requiredRole) { return true;}
			}
		}
		return false;
	}

	public models.User function authenticateAndSignInUser(required string emailAddress, required string password) {
		if (isStruct(ARGUMENTS[1])) { ARGUMENTS = ARGUMENTS[1]; }
		var _userService = new userService();
		var _user = _userService.getUser(ARGUMENTS);
		if (_user.getEmailAddress() == ARGUMENTS.emailAddress) {
			SESSION.userdata = _user.getProperties();
		}
		return _user;
	}

	public void function signOutUser() {
		if (structKeyExists(SESSION, "userdata")) {
			structDelete(SESSION, "userdata");
		}
	}



}