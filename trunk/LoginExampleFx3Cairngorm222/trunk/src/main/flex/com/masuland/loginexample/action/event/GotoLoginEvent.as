package com.masuland.loginexample.action.event
{
	import com.adobe.cairngorm.control.CairngormEvent;

	import flash.utils.getQualifiedClassName;

	/**
	 * @author masuland.com
	 */
	public class GotoLoginEvent extends CairngormEvent
	{		
		//----------------------
		// Constants
		//----------------------
		
		public static const EVENT_NAME:String = getQualifiedClassName(
			Class(GotoLoginEvent)).substring(
				getQualifiedClassName(Class(GotoLoginEvent)).lastIndexOf('::')+2, 
				getQualifiedClassName(Class(GotoLoginEvent)).length);

		//----------------------
		// Constructor
		//----------------------
		
		public function GotoLoginEvent(bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(EVENT_NAME, bubbles, cancelable);
		}
	}
}