/**
*
* @file  /models/User.cfc
* @author
* @description
*
*/

component extends="Base" output="false" persistent="true" entityname="User" table="users" {

	property name="firstName" type="string" ormtype="string" sqltype="varchar(250)";
	property name="lastName" type="string" ormtype="string" sqltype="varchar(250)";
	property name="emailAddress" type="string" ormtype="string" sqltype="varchar(250)";
	property name="password" type="string" ormtype="string" sqltype="varchar(8000)";
	property name="permissions" fieldtype="collection" type="array" table="user_permissions" fkcolumn="fk_userId" elementcolumn="permission" elementtype="string" lazy="true";

	public function init(){
		this.refreshProperties();
		return super.init();
	}

	public void function refreshProperties() {
		super.refreshProperties();
		if (!structKeyExists(VARIABLES, "firstName")) { VARIABLES.firstName = ""; }
		if (!structKeyExists(VARIABLES, "lastName")) { VARIABLES.lastName = ""; }
		if (!structKeyExists(VARIABLES, "emailAddress")) { VARIABLES.emailAddress = ""; }
		if (!structKeyExists(VARIABLES, "password")) { VARIABLES.password = ""; }
		if (!structKeyExists(VARIABLES, "permissions")) { VARIABLES.permissions = []; }
	}

	public void function setPassword(required string password) {
		VARIABLES.password = hash(ARGUMENTS.password, "SHA-512");
	}
}