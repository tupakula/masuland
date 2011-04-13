package com.masuland.loginexample.control.command
{
	import com.masuland.loginexample.control.event.AppEvent;
	import com.masuland.loginexample.model.AppModel;
	import com.masuland.loginexample.state.AppStackState;
	import com.masuland.loginexample.state.LoginBoxState;
	import com.masuland.loginexample.state.SettingsBoxState;
	
	import flash.events.IEventDispatcher;

	public class InitAppCommand
	{
		//----------------------
		// Properties
		//----------------------
		
		[Dispatcher]
		public var dispatcher:IEventDispatcher;
		
		[Inject]
		public var appModel:AppModel;
		
		//----------------------
		// Methods
		//----------------------
		
		[EventHandler(event='mx.events.FlexEvent.APPLICATION_COMPLETE')]
		public function init():void
		{
			dispatcher.dispatchEvent(new AppEvent(AppEvent.INIT_APP));
		}
		
		/**
		 * 
		 */
		[EventHandler(event='AppEvent.INIT_APP')]
		public function initApp(event:AppEvent):void
		{
			appModel.appStackState = AppStackState.LOGIN;
			appModel.loginBoxState = LoginBoxState.LOGIN;
			appModel.settingsBoxState = SettingsBoxState.OPEN;
			
			// get settings
			dispatcher.dispatchEvent(new AppEvent(AppEvent.GET_SETTINGS));
		}
	}
}