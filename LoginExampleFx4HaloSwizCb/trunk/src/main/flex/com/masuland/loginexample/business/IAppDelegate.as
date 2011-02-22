package com.masuland.loginexample.business
{
	import com.masuland.loginexample.vo.AuthenticationVO;
	import com.masuland.loginexample.vo.UserVO;
	
	import mx.rpc.AsyncToken;
 
	public interface IAppDelegate
	{
		/**
		 * getSettings()
		 * 
		 * @return SettingsVO
		 */
		function getSettings():AsyncToken;

		/**
		 * login()
		 * 
		 * @param auth
		 * @return UserVO
		 */
		function login(auth:AuthenticationVO):AsyncToken;

		/**
		 * register()
		 * 
		 * @param auth
		 * @return UserVO
		 */
		function register(auth:AuthenticationVO):AsyncToken;

		/**
		 * updateUser()
		 * 
		 * @param user
		 * @return UserVO
		 */
		function updateUser(user:UserVO):AsyncToken;
	}
}
