package org.apache.flex.apps.loginexample.data.vo
{
	[RemoteClass(alias='org.apache.flex.apps.loginexample.data.dto.UserDTO')]
	[Bindable]
	/**
	 * 
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