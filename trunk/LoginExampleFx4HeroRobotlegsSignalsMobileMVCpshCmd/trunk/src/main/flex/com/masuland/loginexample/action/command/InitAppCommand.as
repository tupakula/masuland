package com.masuland.loginexample.action.command
{
	import com.masuland.loginexample.action.signal.GetSettingsSignal;
	import com.masuland.loginexample.data.AppModel;
	import com.masuland.loginexample.data.state.AppStackState;
	import com.masuland.loginexample.data.state.LoginBoxState;
	import com.masuland.loginexample.data.state.SettingsBoxState;
	
	import org.robotlegs.mvcs.SignalCommand;

	/**
	 * @author masuland.com
	 */
	public class InitAppCommand extends SignalCommand
	{
		//----------------------
		// Properties
		//----------------------
		
		[Inject]
		public var appModel:AppModel;
		
		[Inject]
		public var getSettingsSignal:GetSettingsSignal;
		
		//----------------------
		// Methods
		//----------------------
		
		override public function execute():void
		{
			appModel.appStackState = AppStackState.LOGIN;
			appModel.loginBoxState = LoginBoxState.LOGIN;
			appModel.settingsBoxState = SettingsBoxState.OPEN;
			
			// Get settings
			getSettingsSignal.dispatch();
		}
	}
}
