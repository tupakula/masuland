package com.masuland.loginexample.action.command
{
	import com.masuland.loginexample.data.AppModel;
	import com.masuland.loginexample.data.state.AppStackState;
	import com.masuland.loginexample.data.state.LoginBoxState;
	import com.masuland.loginexample.data.vo.UserVO;
	
	import mx.rpc.events.FaultEvent;

	/**
	 * @author masuland.com
	 */
	public class LoginCommand
	{
		//----------------------
		// Properties
		//----------------------
		
		public var appModel:AppModel;
		
		//----------------------
		// Methods
		//----------------------
		
		public function beforeLogin():void
		{
			appModel.loginBoxState = LoginBoxState.LOGIN_PROGRESS;
		}
		
		//----------------------
		// Handler
		//----------------------
		
		public function login_resultHandler(user:UserVO):void
		{
			appModel.currentUser = user;
			appModel.appStackState = AppStackState.USER;
			appModel.loginBoxState = LoginBoxState.HIDDEN;
		}
		
		public function login_faultHandler(event:FaultEvent):void
		{
			appModel.loginBoxState = LoginBoxState.LOGIN;
		}
	}
}
