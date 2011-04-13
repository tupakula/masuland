package com.masuland.loginexample.control.command
{
	import com.masuland.loginexample.model.AppModel;
	import com.masuland.loginexample.state.LoginBoxState;

	public class GotoRegisterCommand
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
		[EventHandler(name='AppEvent.GOTO_REGISTER')]
		public function gotoRegister():void 
		{
			appModel.loginBoxState = LoginBoxState.REGISTER;
		}
	}
}