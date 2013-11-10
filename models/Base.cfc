/**
*
* @file  /models/Base.cfc
* @author  Mark Rabey
* @description
*
*/

component output="false" displayname="Base" mappedSuperClass="true"  {

	property name="id" fieldtype="id" type="guid" ormtype="string" generator="assigned";
	property name="isDeleted" type="boolean" ormtype="boolean" sqltype="bit";
	property name="createdDate" type="timestamp" ormtype="timestamp" sqltype="timestamp";

	public Base function init(){
		this.refreshProperties();
		return this;
	}

	public void function refreshProperties() {
		if (!structKeyExists(VARIABLES, "id")) { VARIABLES.id = createUUID(); }
		if (!structKeyExists(VARIABLES, "isDeleted")) { VARIABLES.isDeleted = false; }
		if (!structKeyExists(VARIABLES, "createdDate")) { VARIABLES.createdDate = now(); }
	}

	public boolean function doesValidate() {
		return structIsEmpty(this.validate());
	}

	public struct function validate() {
		var _validationErrors = {};
		return _validationErrors;
	}

	public boolean function hasProperty(required string property) {
		return structKeyExists(this.getProperties(),ARGUMENTS.property);
	}

	public struct function getProperties() {
		var _thisData = GetMetaData(this);
		var _properties = {};
		for (var _property in _thisData.properties) {
			_properties[_property.name] = this.getProperty(_property.name);
		}
		if (structKeyExists(_thisData, "extends")) {
			for (var _property in _thisData.extends.properties) {
				_properties[_property.name] = VARIABLES[_property.name];
			}
		}
		return _properties;
	}

	public any function getProperty(required string property) {
		var method = this['get#ARGUMENTS.property#'];
		return method();
	}

	public string function getClassName() {
		return ListLast( GetMetaData( this ).fullname, "." );
	}

	public void function setProperty(required string property, required any value) {
		var method = this['set#ARGUMENTS.property#'];
		method(ARGUMENTS.value);
	}


}