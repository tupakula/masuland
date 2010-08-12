package com.masuland.loginexample.spring.business
{
	import com.masuland.loginexample.spring.vo.AuthenticationVO;
	import com.masuland.loginexample.spring.vo.UserVO;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.remoting.mxml.RemoteObject;
	
	/**
	 * 
	 * @author masu
	 */
	public class AppAmfDelegate implements IAppDelegate
	{
		/**  */
		[Autowired]
		public var appRemoteObject:RemoteObject;

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
