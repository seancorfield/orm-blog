/**
*
* @file  /models/Post.cfc
* @author
* @description
*
*/

component extends="Base" output="false" persistent="true" entityname="Post" table="posts"  {

	public Post function init(){
		this.refreshProperties();
		return super.init();
	}
}