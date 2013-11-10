/**
*
* @file  /services/settingsService.cfc
* @author
* @description
*
*/

component extends="baseService" output="false" displayname="settingsService"  {

	public function init(){
		return super.init();
	}

	public models.Settings function getSettings() {
		var _settings = EntityLoad('Settings',{},true);

		if (isNull(_settings) || !isDefined("_settings")) { _settings = EntityNew('Settings'); }
		return _settings;
	}

	public models.Settings function editSettings() {
		if (isStruct(ARGUMENTS[1])) { ARGUMENTS = ARGUMENTS[1]; }
		var _settings = this.getSettings(ARGUMENTS);
		return this.setValuesForObject(_settings,ARGUMENTS);
	}

	public models.Settings function editSettingsAndSave() {
		return this.saveObject(this.editSettings(ARGUMENTS));
	}
}