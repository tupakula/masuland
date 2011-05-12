package com.masuland.loginexample.action.event
{	
	import com.masuland.loginexample.data.vo.LocaleVO;
	
	import flash.events.Event;

	/**
	 * @author masuland.com
	 */
	public class LoadLocaleEvent extends Event
	{	
		//----------------------
		// Constants
		//----------------------
		
		public static const EVENT_NAME:String = 'com.masuland.loginexample.swiz.control.event.LoadLocaleEvent.EVENT_NAME';
		
		//----------------------
		// Properties
		//----------------------
		
		public var locale:LocaleVO;
		
		//----------------------
		// Constructor
		//----------------------
		
		public function LoadLocaleEvent(locale:LocaleVO, cancelable:Boolean=false)
		{
			super(EVENT_NAME, true, cancelable);
			
			this.locale = locale;
		}
	}
}