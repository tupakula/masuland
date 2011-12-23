package com.masuland.loginexample.data.vo
{
	[RemoteClass(alias='com.masuland.loginexample.data.dto.AuthenticationDTO')]
	[Bindable]
	/**
	 * @author masuland.com
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