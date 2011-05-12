package com.masuland.loginexample.application.event
{
	import flash.events.Event;

	/**
	 * @author masuland.com
	 */
	public class AppEvent extends Event
	{
		//----------------------
		// Constants
		//----------------------
		
		public static const INIT_APP:String = 'com.masuland.loginexample.swiz.control.event.AppEvent.INIT_APP';
		public static const GET_SETTINGS:String = 'com.masuland.loginexample.swiz.control.event.AppEvent.GET_SETTINGS';
		public static const GOTO_LOGIN:String = 'com.masuland.loginexample.swiz.control.event.AppEvent.GOTO_LOGIN';
		public static const GOTO_REGISTER:String = 'com.masuland.loginexample.swiz.control.event.AppEvent.GOTO_REGISTER';
		public static const LOGOUT:String = 'com.masuland.loginexample.swiz.control.event.AppEvent.LOGOUT';

		//----------------------
		// Constructor
		//----------------------
		
		public function AppEvent(type:String, cancelable:Boolean=false)
		{
			super(type, true, cancelable);
		}
	}
}