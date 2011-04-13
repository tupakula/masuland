package com.masuland.loginexample.control.command
{
	import com.masuland.loginexample.control.event.AppEvent;
	import com.masuland.loginexample.model.AppModel;
	import com.masuland.loginexample.state.AppStackState;
	import com.masuland.loginexample.state.LoginBoxState;
	import com.masuland.loginexample.state.SettingsBoxState;
	
	import flash.events.EventDispatcher;

	[RouteEvents(events='AppEvent.GET_SETTINGS')]
	[Event(name='AppEvent.GET_SETTINGS', type='com.masuland.loginexample.control.event.AppEvent')]
	public class InitAppCommand extends EventDispatcher
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
		[EventHandler(name='AppEvent.INIT_APP')]
		public function initApp(event:AppEvent):void
		{
			appModel.appStackState = AppStackState.LOGIN;
			appModel.loginBoxState = LoginBoxState.LOGIN;
			appModel.settingsBoxState = SettingsBoxState.OPEN;
			
			// get settings
			dispatchEvent(new AppEvent(AppEvent.GET_SETTINGS));
		}
	}
}