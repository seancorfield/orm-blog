/**
*
* @file  /models/Tag.cfc
* @author
* @description
*
*/

component extends="Base" output="false" persistent="true" entityname="Tag" table="tags"  {

	public Tag function init(){
		this.refreshProperties();
		return super.init();
	}
}