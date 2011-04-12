package com.masuland.loginexample.application.event
{
	import flash.events.Event;

	public class AppEvent extends Event
	{
		public static const INITIALIZE_CLIENT:String = 'com.masuland.loginexample.swiz.control.event.AppEvent.INITIALIZE_CLIENT';
		public static const GET_SETTINGS:String = 'com.masuland.loginexample.swiz.control.event.AppEvent.GET_SETTINGS';
		public static const GOTO_LOGIN:String = 'com.masuland.loginexample.swiz.control.event.AppEvent.GOTO_LOGIN';
		public static const GOTO_REGISTER:String = 'com.masuland.loginexample.swiz.control.event.AppEvent.GOTO_REGISTER';
		public static const LOGOUT:String = 'com.masuland.loginexample.swiz.control.event.AppEvent.LOGOUT';

		/**  */
		public function AppEvent(type:String, cancelable:Boolean=false)
		{
			super(type, true, cancelable);
		}
	}
}