package com.masuland.loginexample.action.command
{
	import com.masuland.loginexample.data.AppModel;
	import com.masuland.loginexample.data.state.LoginBoxState;

	public class GotoLoginCommand
	{
		//----------------------
		// Properties
		//----------------------
		
		[Inject]
		public var appModel:AppModel;
		
		//----------------------
		// Methods
		//----------------------
		
		/**
		 * 
		 */
		[EventHandler(name='AppEvent.GOTO_LOGIN')]
		public function gotoLogin():void 
		{
			appModel.loginBoxState = LoginBoxState.LOGIN;
		}
	}
}