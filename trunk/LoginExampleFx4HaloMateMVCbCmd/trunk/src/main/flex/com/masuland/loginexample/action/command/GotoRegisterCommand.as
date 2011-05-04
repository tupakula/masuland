package com.masuland.loginexample.action.command
{
	import com.masuland.loginexample.data.AppModel;
	import com.masuland.loginexample.data.state.LoginBoxState;

	public class GotoRegisterCommand
	{
		//----------------------
		// Properties
		//----------------------
		
		public var appModel:AppModel;
		
		//----------------------
		// Methods
		//----------------------
		
		/**
		 * 
		 */
		public function gotoRegister():void 
		{
			appModel.loginBoxState = LoginBoxState.REGISTER;
		}
	}
}