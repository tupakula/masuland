package com.masuland.loginexample.cairngorm221.business
{
	import com.adobe.cairngorm.business.ServiceLocator;
	import com.masuland.loginexample.cairngorm221.vo.AuthenticationVO;
	import com.masuland.loginexample.cairngorm221.vo.UserVO;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	import mx.rpc.remoting.RemoteObject;

	/**
	 * 
	 * @author Sebastian.Mohr (masuland@gmail.com)
	 */
	public class AppMockDelegate implements IAppDelegate
	{
		private var service:RemoteObject = ServiceLocator.getInstance().getRemoteObject(AppServices.APP_SERVICE);
		private var responder:IResponder;
		
		public function AppMockDelegate(responder:IResponder)
		{
			this.responder = responder;
		}
		
		/**
		 * 
		 */
		public function getSettings():void
		{
			var token:AsyncToken;
			
			token = service.getSettings();
			token.addResponder(responder);
		}

		/**
		 * 
		 */
		public function login(auth:AuthenticationVO):void
		{
			var token:AsyncToken;

			token = service.login(auth);
			token.addResponder(responder);
		}

		/**
		 * 
		 */
		public function register(auth:AuthenticationVO):void
		{
			var token:AsyncToken;

			token = service.register(auth);
			token.addResponder(responder);
		}

		/**
		 * 
		 */
		public function updateUser(user:UserVO):void
		{
			var token:AsyncToken;

			token = service.updateUser(user);
			token.addResponder(responder);
		}
	}
}
