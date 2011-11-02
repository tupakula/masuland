package com.masuland.loginexample.business
{
	import com.masuland.loginexample.data.vo.AuthenticationVO;
	import com.masuland.loginexample.data.vo.UserVO;

	/**
	 * @author masuland.com
	 */
	public interface IAppDelegate
	{
		//----------------------
		// Methods
		//----------------------
		
		/**
		 * getSettings()
		 * 
		 * @return SettingsVO
		 */
		function getSettings():void;
		
		/**
		 * login()
		 * 
		 * @param auth
		 * @return UserVO
		 */
		function login(auth:AuthenticationVO):void;
		
		/**
		 * register()
		 * 
		 * @param auth
		 * @return UserVO
		 */
		function register(auth:AuthenticationVO):void;
		
		/**
		 * updateUser()
		 * 
		 * @param user
		 * @return UserVO
		 */
		function updateUser(user:UserVO):void;
	}
}