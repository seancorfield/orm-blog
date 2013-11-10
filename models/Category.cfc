/**
*
* @file  /models/Category.cfc
* @author
* @description
*
*/

component extends="Base" output="false" persistent="true" entityname="Category" table="categories"  {

	public Category function init(){
		this.refreshProperties();
		return super.init();
	}
}