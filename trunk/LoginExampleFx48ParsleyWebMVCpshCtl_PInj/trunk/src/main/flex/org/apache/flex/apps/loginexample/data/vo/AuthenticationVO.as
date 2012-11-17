package org.apache.flex.apps.loginexample.data.vo
{
	[RemoteClass(alias='org.apache.flex.apps.loginexample.data.dto.AuthenticationDTO')]
	[Bindable]
	/**
	 * 
	 */
	public class AuthenticationVO
	{
		//----------------------
		// Properties
		//----------------------
		
		public var username:String;
		public var password:String;
		public var email:String;
	}
}