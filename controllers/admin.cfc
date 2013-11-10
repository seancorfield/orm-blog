/**
*
* @file  /controllers/admin.cfc
* @author
* @description
*
*/

component output="false" displayname=""  {

	public void function init(required org.corfield.framework fw) {
		variables.fw = fw;
	}

	public void function default(required struct RC) role="admin" {
		// Please hold...
	}

	public void function setup(required struct RC) {
		if (structKeyExists(RC, "btnSave")) {
			if (RC.password != RC.confirmPassword) {
				rc.error = "Passwords do not match.";
			} else {
				VARIABLES.fw.service('settingsService.editSettingsAndSave','settings');
				VARIABLES.fw.service('userService.editUserAndSave','user');
			}
		}
		VARIABLES.fw.service('settingsService.getSettings','settings');
		VARIABLES.fw.service('userService.getUser','user');
		VARIABLES.fw.service('userService.getUserCount','userCount');
	}

	public void function endSetup(required struct RC) {
		if (RC.userCount > 0 || (structKeyExists(RC, "btnSave") && !structKeyExists(RC, "error"))) {
			VARIABLES.fw.redirect('admin');
		}
		for (var key in RC.settings.getProperties()) {
			if (key != 'id') { RC[key] = RC.settings.getProperty(key); }
		}
		for (var key in RC.user.getProperties()) {
			if (key != 'id' && key != 'password') { RC[key] = RC.user.getProperty(key); }
		}
		RC.settingsId = RC.settings.getId();
		RC.userId = RC.user.getId();
	}

	public void function editSettings(required struct RC) role="admin" {
		if (structKeyExists(RC, "btnSaveSettings")) {
			VARIABLES.fw.service('settingsService.editSettingsAndSave','settings');
		} else {
			VARIABLES.fw.service('settingsService.getSettings','settings');
		}

	}

	public void function endEditSettings(required struct RC) {
		if (structKeyExists(RC, "btnSaveSettings")) {
			VARIABLES.fw.redirect('admin');
		}
		for (var key in RC.settings.getProperties()) {
			RC[key] = RC.settings.getProperty(key);
		}
	}
}
