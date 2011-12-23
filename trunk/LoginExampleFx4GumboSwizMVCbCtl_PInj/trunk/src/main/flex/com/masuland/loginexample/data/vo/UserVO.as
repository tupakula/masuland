package com.masuland.loginexample.data.vo
{
	[RemoteClass(alias='com.masuland.loginexample.data.dto.UserDTO')]
	[Bindable]
	/**
	 * @author masuland.com
	 */
	public class UserVO
	{
		//----------------------
		// Properties
		//----------------------
		
		public var username:String;
		public var firstname:String;
		public var lastname:String;
		public var email:String;
		public var birthday:Date;
		
		//----------------------
		// Methods
		//----------------------
		
		public function clone():UserVO
		{
			var user:UserVO = new UserVO();
			user.username = username;
			user.firstname = firstname;
			user.lastname = lastname;
			user.email = email;
			user.birthday = birthday;
			
			return user;
		}
	}
}