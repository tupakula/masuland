package com.masuland.loginexample.action.command
{
	import com.masuland.loginexample.action.event.AppEvent;
	import com.masuland.loginexample.data.AppModel;
	import com.masuland.loginexample.data.state.AppStackState;
	import com.masuland.loginexample.data.state.LoginBoxState;
	import com.masuland.loginexample.data.state.SettingsBoxState;
	
	import flash.events.IEventDispatcher;

	/**
	 * @author masuland.com
	 */
	public class InitAppCommand
	{
		//----------------------
		// Properties
		//----------------------
		
		public var appModel:AppModel;
		
		private var dispatcher:IEventDispatcher;
		
		//----------------------
		// Constructor
		//----------------------
		
		public function InitAppCommand(dispatcher:IEventDispatcher)
		{
			this.dispatcher = dispatcher;
		}

		//----------------------
		// Methods
		//----------------------
		
		public function initApp():void
		{
			appModel.appStackState = AppStackState.LOGIN;
			appModel.loginBoxState = LoginBoxState.LOGIN;
			appModel.settingsBoxState = SettingsBoxState.OPEN;
			
			// Get settings
			dispatcher.dispatchEvent(new AppEvent(AppEvent.GET_SETTINGS));
		}
	}
}
