package com.masuland.loginexample.action.command
{
	import com.masuland.loginexample.action.event.AppEvent;
	import com.masuland.loginexample.data.AppModel;
	import com.masuland.loginexample.data.state.AppStackState;
	import com.masuland.loginexample.data.state.LoginBoxState;
	import com.masuland.loginexample.data.state.SettingsBoxState;

	public class InitAppCommand
	{
		//----------------------
		// Properties
		//----------------------
		
		[MessageDispatcher]
		public var dispatcher:Function;
		
		[Inject]
		public var appModel:AppModel;
		
		//----------------------
		// Methods
		//----------------------
		
		[Init]
		public function init():void
		{
			dispatcher(new AppEvent(AppEvent.INIT_APP));
		}
		
		/**
		 * 
		 */
		[MessageHandler(selector='AppEvent.INIT_APP')]
		public function initApp(event:AppEvent):void
		{
			appModel.appStackState = AppStackState.LOGIN;
			appModel.loginBoxState = LoginBoxState.LOGIN;
			appModel.settingsBoxState = SettingsBoxState.OPEN;
			
			// get settings
			dispatcher(new AppEvent(AppEvent.GET_SETTINGS));
		}
	}
}