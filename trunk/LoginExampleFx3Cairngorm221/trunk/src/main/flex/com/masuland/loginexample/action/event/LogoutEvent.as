package com.masuland.loginexample.action.event
{
	import com.adobe.cairngorm.control.CairngormEvent;

	import flash.utils.getQualifiedClassName;

	/**
	 * @author masuland.com
	 */
	public class LogoutEvent extends CairngormEvent
	{
		//----------------------
		// Constants
		//----------------------
		
		public static const EVENT_NAME:String = getQualifiedClassName(
			Class(LogoutEvent)).substring(
				getQualifiedClassName(Class(LogoutEvent)).lastIndexOf('::')+2, 
				getQualifiedClassName(Class(LogoutEvent)).length);

		//----------------------
		// Constructor
		//----------------------
		
		public function LogoutEvent(bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(EVENT_NAME, bubbles, cancelable);
		}
	}
}