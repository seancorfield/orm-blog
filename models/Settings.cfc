/**
*
* @file  /models/Settings.cfc
* @author
* @description
*
*/

component extends="Base" output="false" persistent="true" entityname="Settings" table="settings" {

	property name="siteName" type="string" ormtype="string" sqltype="varchar(250)";
	property name="copyrightName" type="string" ormtype="string" sqltype="varchar(250)";

	public Settings function init(){
		this.refreshProperties();
		return super.init();
	}

	public void function refreshProperties() {
		super.refreshProperties();
		if (!structKeyExists(VARIABLES, "siteName")) { VARIABLES.siteName = ""; }
		if (!structKeyExists(VARIABLES, "copyrightName")) { VARIABLES.copyrightName = ""; }
	}
}