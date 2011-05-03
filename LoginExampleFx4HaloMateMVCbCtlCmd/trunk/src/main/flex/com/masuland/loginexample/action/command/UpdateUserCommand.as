package com.masuland.loginexample.action.command
{
	import com.masuland.loginexample.action.event.UpdateUserEvent;
	import com.masuland.loginexample.data.AppModel;
	import com.masuland.loginexample.data.state.LoginBoxState;
	import com.masuland.loginexample.data.vo.UserVO;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.Responder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;

	public class UpdateUserCommand
	{
		//----------------------
		// Properties
		//----------------------
		
		public var appModel:AppModel;
		
		//----------------------
		// Handler
		//----------------------
		
		/**  */
		public function updateUser_resultHandler(user:UserVO):void
		{
			appModel.currentUser = user;
		}
		
		/**  */
		public function updateUser_faultHandler(event:FaultEvent):void
		{
			appModel.loginBoxState = LoginBoxState.LOGIN;
		}
	}
}