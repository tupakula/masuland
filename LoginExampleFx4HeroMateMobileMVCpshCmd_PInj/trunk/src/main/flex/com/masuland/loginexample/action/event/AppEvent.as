package com.masuland.loginexample.action.event
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
		
		public static const INIT_APP:String = 'AppEvent.INIT_APP';
		public static const GET_SETTINGS:String = 'AppEvent.GET_SETTINGS';
		public static const GOTO_LOGIN:String = 'AppEvent.GOTO_LOGIN';
		public static const GOTO_REGISTER:String = 'AppEvent.GOTO_REGISTER';
		public static const LOGOUT:String = 'AppEvent.LOGOUT';

		//----------------------
		// Constructor
		//----------------------
		
		public function AppEvent(type:String, bubbles:Boolean=true, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		//----------------------
		// Methods
		//----------------------
		
		override public function clone():Event
		{
			return new AppEvent(type);
		}
	}
}
