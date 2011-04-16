package com.masuland.loginexample.action.event
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import flash.utils.getQualifiedClassName;

	public class GetSettingsEvent extends CairngormEvent
	{		
		/**  */
		public static const EVENT_NAME:String = getQualifiedClassName(
			Class(GetSettingsEvent)).substring(
				getQualifiedClassName(Class(GetSettingsEvent)).lastIndexOf('::')+2, 
				getQualifiedClassName(Class(GetSettingsEvent)).length);

		public function GetSettingsEvent(bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(EVENT_NAME, bubbles, cancelable);
		}
	}
}