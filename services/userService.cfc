/**
*
* @file  /services/userService.cfc
* @author
* @description
*
*/

component extends="baseService" output="false" displayname="userService"  {

	public function init(){
		return super.init();
	}

	public array function getUsers(numeric maxresults=10,numeric offset=0) {
		return ORMExecuteQuery('FROM User where isDeleted=:isDeleted',{isDeleted=false},false);
	}



	public models.User function getUser() {
		if (isStruct(ARGUMENTS[1])) { ARGUMENTS = ARGUMENTS[1]; }
		var _user = "";
		if (structKeyExists(ARGUMENTS, "userId")) {
			_user = EntityLoadByPk('User',ARGUMENTS.userId);
		} else if(structKeyExists(ARGUMENTS, "emailAddress") && structKeyExists(ARGUMENTS, "password")) {
			_user = ORMExecuteQuery('FROM User WHERE emailAddress=:emailAddress AND password=:password',{emailAddress=ARGUMENTS.emailAddress,password=hash(ARGUMENTS.password, "SHA-512")},true);
		} else if(structKeyExists(ARGUMENTS, "id")) {
			_user = EntityLoadByPk('User',ARGUMENTS.id);
		}
		if (!isDefined("_user") || !isObject(_user)) { _user = EntityNew('User'); }
		// writeDump(_user); abort;
		return _user;
	}

	public models.User function editUser() {
		if (isStruct(ARGUMENTS[1])) { ARGUMENTS = ARGUMENTS[1]; }
		var _user = this.getUser(ARGUMENTS);
		if (structKeyExists(ARGUMENTS, "userPermissions")) {
			ARGUMENTS.permissions = [];
			for (var _permission in listToArray(ARGUMENTS.userPermissions)) {
				arrayAppend(ARGUMENTS.permissions,_permission);
			}
		}
		return this.setValuesForObject(_user,ARGUMENTS);
	}

	public models.User function editUserAndSave() {
		return this.saveObject(this.editUser(ARGUMENTS));
	}

	public numeric function getUserCount() {
		return arrayLen(this.getUsers());
	}


}