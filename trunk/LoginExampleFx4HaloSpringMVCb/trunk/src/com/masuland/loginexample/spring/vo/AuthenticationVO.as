package com.masuland.loginexample.spring.vo
{
	[Bindable]
	/**
	 * A single user
	 * @author Sebastian.Mohr (masuland@gmail.com)
	 */
	public class AuthenticationVO
	{
		public var username:String;
		public var password:String;
		public var email:String;
		
		public function AuthenticationVO()
		{
		}
	}
}