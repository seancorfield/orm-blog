/**
*
* @file  /services/baseService.cfc
* @author
* @description
*
*/

component output="false" displayname="baseService"  {

	public function init(){
		return this;
	}

	public any function setValuesForObject(required any object, required struct values) {
		for (var key in ARGUMENTS.values) {
			if (ARGUMENTS.object.hasProperty(key)) {
				ARGUMENTS.object.setProperty(key,ARGUMENTS.values[key]);
			}
		}
		return ARGUMENTS.object;
	}

	public any function saveObject(required objectToSave) {
		if (ARGUMENTS.objectToSave.doesValidate()) {
			transaction {
				try {
					EntitySave(ARGUMENTS.objectToSave);
				}
				catch(any e) {
					writeDump(e);
					abort;
				}

			}
		}
		return ARGUMENTS.objectToSave;
	}
}