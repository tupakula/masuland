package com.masuland.loginexample.control.event
{	
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.masuland.loginexample.vo.LocaleVO;
	
	import flash.utils.getQualifiedClassName;

	/**  */
	public class LoadLocaleEvent extends CairngormEvent
	{	
		/**  */
		public static const EVENT_NAME:String = getQualifiedClassName(
			Class(LoadLocaleEvent)).substring(
				getQualifiedClassName(Class(LoadLocaleEvent)).lastIndexOf('::')+2, 
				getQualifiedClassName(Class(LoadLocaleEvent)).length);
		
		public var locale:LocaleVO;
		
		/**  */
		public function LoadLocaleEvent(locale:LocaleVO, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(EVENT_NAME, bubbles, cancelable);
			
			this.locale = locale;
		}
	}
}