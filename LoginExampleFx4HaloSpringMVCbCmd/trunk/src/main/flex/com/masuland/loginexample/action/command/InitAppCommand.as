package com.masuland.loginexample.action.command
{
	import com.masuland.loginexample.action.event.AppEvent;
	import com.masuland.loginexample.data.AppModel;
	import com.masuland.loginexample.data.state.AppStackState;
	import com.masuland.loginexample.data.state.LoginBoxState;
	import com.masuland.loginexample.data.state.SettingsBoxState;
	
	import flash.events.EventDispatcher;

	[RouteEvents(events='AppEvent.GET_SETTINGS')]
	[Event(name='AppEvent.GET_SETTINGS', type='com.masuland.loginexample.control.event.AppEvent')]
	/**
	 * @author masuland.com
	 */
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
