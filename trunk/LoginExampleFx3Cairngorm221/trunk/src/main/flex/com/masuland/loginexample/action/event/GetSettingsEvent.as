package com.masuland.loginexample.action.event
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import flash.utils.getQualifiedClassName;

	/**
	 * @author masuland.com
	 */
	public class GetSettingsEvent extends CairngormEvent
	{		
		//----------------------
		// Constants
		//----------------------
		
		public static const EVENT_NAME:String = getQualifiedClassName(
			Class(GetSettingsEvent)).substring(
				getQualifiedClassName(Class(GetSettingsEvent)).lastIndexOf('::')+2, 
				getQualifiedClassName(Class(GetSettingsEvent)).length);

		//----------------------
		// Constructor
		//----------------------
		
		public function GetSettingsEvent(bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(EVENT_NAME, bubbles, cancelable);
		}
	}
}