package com.masuland.loginexample.control.event
{
	import flash.events.Event;

	public class AppEvent extends Event
	{
		public static const INIT_APP:String = 'AppEvent.INIT_APP';
		public static const GET_SETTINGS:String = 'AppEvent.GET_SETTINGS';
		public static const GOTO_LOGIN:String = 'AppEvent.GOTO_LOGIN';
		public static const GOTO_REGISTER:String = 'AppEvent.GOTO_REGISTER';
		public static const LOGOUT:String = 'AppEvent.LOGOUT';

		/**  */
		public function AppEvent(type:String, bubbles:Boolean=true, cancelable:Boolean=true)
		{
			super(type, bubbles, cancelable);
		}
	}
}