package com.masuland.loginexample.action.event
{
	import flash.events.Event;

	public class AppEvent extends Event
	{
		public static const INITIALIZE_CLIENT:String = 'AppEvent.INITIALIZE_CLIENT';
		public static const GET_SETTINGS:String = 'AppEvent.GET_SETTINGS';
		public static const GOTO_LOGIN:String = 'AppEvent.GOTO_LOGIN';
		public static const GOTO_REGISTER:String = 'AppEvent.GOTO_REGISTER';
		public static const LOGOUT:String = 'AppEvent.LOGOUT';

		/**  */
		public function AppEvent(type:String, bubbles:Boolean=true, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}