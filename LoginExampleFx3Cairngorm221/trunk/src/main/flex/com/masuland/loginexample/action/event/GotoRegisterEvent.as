package com.masuland.loginexample.action.event
{
	import com.adobe.cairngorm.control.CairngormEvent;

	import flash.utils.getQualifiedClassName;

	/**
	 * @author masuland.com
	 */
	public class GotoRegisterEvent extends CairngormEvent
	{		
		//----------------------
		// Constants
		//----------------------
		
		public static const EVENT_NAME:String = getQualifiedClassName(
			Class(GotoRegisterEvent)).substring(
				getQualifiedClassName(Class(GotoRegisterEvent)).lastIndexOf('::')+2, 
				getQualifiedClassName(Class(GotoRegisterEvent)).length);

		//----------------------
		// Constructor
		//----------------------
		
		public function GotoRegisterEvent(bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(EVENT_NAME, bubbles, cancelable);
		}
	}
}