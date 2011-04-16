package com.masuland.loginexample.action.event
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import flash.utils.getQualifiedClassName;

	public class InitialiseClientEvent extends CairngormEvent
	{		
		/**  */
		public static const EVENT_NAME:String = getQualifiedClassName(
			Class(InitialiseClientEvent)).substring(
				getQualifiedClassName(Class(InitialiseClientEvent)).lastIndexOf('::')+2, 
				getQualifiedClassName(Class(InitialiseClientEvent)).length);

		public function InitialiseClientEvent(bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(EVENT_NAME, bubbles, cancelable);
		}
	}
}