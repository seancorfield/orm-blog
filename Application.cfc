/**
*
* @file  /Application.cfc
* @author  Mark Rabey
* @description
*
*/

component extends="org.corfield.framework" {

	this.root = getDirectoryFromPath(getCurrentTemplatePath());
	this.name = 'ORM-Blog';
	this.clientstorage = true;
	this.sessionmanagement = true;
	this.sessionTimeout = createTimeSpan( 1, 0, 0, 0 );
	this.datasource = "orm_blog_public";
	this.ormenabled = true;
	this.ormsettings = {
		dbcreate      = "update",
		dialect       = "MySQL",
		eventHandling = true,
		cfclocation = 'models'
	};

	variables.framework = {
		action = 'action',
		generateSES = true,
		reloadApplicationOnEveryRequest = false,
		applicationKey = "framework"
	};

	public void function setupApplication() {
		ORMReload();
		var _settingsService = new services.settingsService();
		APPLICATION.siteSettings = _settingsService.getSettings();
	}



	public void function setupRequest() {
		REQUEST.includesPath = replaceNoCase(cgi.script_name, "index.cfm", "includes");
		REQUEST.security = new services.securityService();
		if (REQUEST.context.action != 'admin.setup' && !len(APPLICATION.siteSettings.getSiteName())) {
			redirect('admin.setup');
		}
	}

	public void function after() {
		var _actionData = {};
		if (structKeyExists(application[framework.applicationKey].cache.controllers, getSection()) && structKeyExists(application[framework.applicationKey].cache.controllers[getSection()],getItem())) {
			_actionData = GetMetaData(application[framework.applicationKey].cache.controllers[getSection()][getItem()]);
		}

		var _requiredRole = (structKeyExists(_actionData, "role")?_actionData.role:"guest");
		if (!REQUEST.security.isAllowed(_requiredRole,SESSION)) {
			redirect('main.notAllowed');
		}
	}




}