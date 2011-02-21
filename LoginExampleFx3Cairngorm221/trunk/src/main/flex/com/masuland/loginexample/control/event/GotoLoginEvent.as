package com.masuland.loginexample.control.event
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import flash.utils.getQualifiedClassName;

	public class GotoLoginEvent extends CairngormEvent
	{		
		/**  */
		public static const EVENT_NAME:String = getQualifiedClassName(
			Class(GotoLoginEvent)).substring(
				getQualifiedClassName(Class(GotoLoginEvent)).lastIndexOf('::')+2, 
				getQualifiedClassName(Class(GotoLoginEvent)).length);

		public function GotoLoginEvent(bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(EVENT_NAME, bubbles, cancelable);
		}
	}
}