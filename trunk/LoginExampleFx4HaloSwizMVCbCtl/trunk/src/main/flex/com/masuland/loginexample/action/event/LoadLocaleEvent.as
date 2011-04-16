package com.masuland.loginexample.action.event
{	
	import com.masuland.loginexample.data.vo.LocaleVO;
	
	import flash.events.Event;
	import flash.utils.getQualifiedClassName;

	/**  */
	public class LoadLocaleEvent extends Event
	{	
		/**  */
		public static const EVENT_NAME:String = 'com.masuland.loginexample.swiz.control.event.LoadLocaleEvent.EVENT_NAME';
		
		public var locale:LocaleVO;
		
		/**  */
		public function LoadLocaleEvent(locale:LocaleVO, cancelable:Boolean=false)
		{
			super(EVENT_NAME, true, cancelable);
			
			this.locale = locale;
		}
	}
}