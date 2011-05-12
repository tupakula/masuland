package com.masuland.loginexample.cairngorm221.business
{
	import com.adobe.cairngorm.business.ServiceLocator;
	import com.masuland.loginexample.data.vo.AuthenticationVO;
	import com.masuland.loginexample.data.vo.UserVO;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	import mx.rpc.remoting.RemoteObject;

	/**
	 * @author masuland.com
	 */
	public class AppAmfDelegate implements IAppDelegate
	{
		//----------------------
		// Constants
		//----------------------
		
		private var service:RemoteObject = ServiceLocator.getInstance().getRemoteObject(AppServices.APP_SERVICE);
		private var responder:IResponder;
		
		//----------------------
		// Constructor
		//----------------------
		
		public function AppAmfDelegate(responder:IResponder)
		{
			this.responder = responder;
		}
		
		//----------------------
		// Methods
		//----------------------
		
		public function getSettings():void
		{
			var token:AsyncToken;
			
			token = service.getSettings();
			token.addResponder(responder);
		}

		public function login(auth:AuthenticationVO):void
		{
			var token:AsyncToken;

			token = service.login(auth);
			token.addResponder(responder);
		}

		public function register(auth:AuthenticationVO):void
		{
			var token:AsyncToken;

			token = service.register(auth);
			token.addResponder(responder);
		}

		public function updateUser(user:UserVO):void
		{
			var token:AsyncToken;

			token = service.updateUser(user);
			token.addResponder(responder);
		}
	}
}
