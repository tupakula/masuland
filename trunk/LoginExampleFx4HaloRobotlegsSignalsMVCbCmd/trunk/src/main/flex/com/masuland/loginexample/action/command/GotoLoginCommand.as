package com.masuland.loginexample.action.command
{
	import com.masuland.loginexample.data.AppModel;
	import com.masuland.loginexample.data.state.LoginBoxState;
	
	import org.robotlegs.mvcs.SignalCommand;

	public class GotoLoginCommand extends SignalCommand
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
		override public function execute():void
		{
			appModel.loginBoxState = LoginBoxState.LOGIN;
		}
	}
}