package com.masuland.loginexample.spring.business
{
	import com.masuland.loginexample.spring.vo.AuthenticationVO;
	import com.masuland.loginexample.spring.vo.UserVO;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
 
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
