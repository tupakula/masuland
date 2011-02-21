package com.masuland.loginexample.control.event
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import flash.utils.getQualifiedClassName;

	public class GotoRegisterEvent extends CairngormEvent
	{		
		/**  */
		public static const EVENT_NAME:String = getQualifiedClassName(
			Class(GotoRegisterEvent)).substring(
				getQualifiedClassName(Class(GotoRegisterEvent)).lastIndexOf('::')+2, 
				getQualifiedClassName(Class(GotoRegisterEvent)).length);

		public function GotoRegisterEvent(bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(EVENT_NAME, bubbles, cancelable);
		}
	}
}