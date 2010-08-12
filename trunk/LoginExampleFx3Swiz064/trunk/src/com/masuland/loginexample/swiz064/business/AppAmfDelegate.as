package com.masuland.loginexample.swiz064.business
{
	import com.masuland.loginexample.swiz064.vo.AuthenticationVO;
	import com.masuland.loginexample.swiz064.vo.UserVO;
	
	import mx.rpc.AsyncToken;
 
	/**
	 * 
	 * @author masu
	 */
	public class AppAmfDelegate implements IAppDelegate
	{
		/**  */
		[Autowire]
		public var appRemoteObject:AppRemoteObject;

		/**
		 * 
		 */
		public function AppAmfDelegate() {}
 
		/**
		 * 
		 */
		public function getSettings():AsyncToken
		{
			return appRemoteObject.getStyles.send();
		}

		/**
		 * 
		 */
		public function login(auth:AuthenticationVO):AsyncToken
		{
			return appRemoteObject.login.send(auth);
		}

		/**
		 * 
		 */
		public function register(auth:AuthenticationVO):AsyncToken
		{
			return appRemoteObject.register.send(auth);
		}

		/**
		 * 
		 */
		public function updateUser(user:UserVO):AsyncToken
		{
			return appRemoteObject.updateUser.send(user);
		}
	}
}
