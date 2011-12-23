package com.masuland.loginexample.action.event
{	
	import com.masuland.loginexample.vo.LocaleVO;
	
	import flash.events.Event;

	/**
	 * @author masuland.com
	 */
	public class LoadLocaleEvent extends Event
	{	
		//----------------------
		// Constants
		//----------------------
		
		public static const EVENT_NAME:String = 'LoadLocaleEvent.EVENT_NAME';
		
		//----------------------
		// Properties
		//----------------------
		
		public var locale:LocaleVO;
		
		//----------------------
		// Constructor
		//----------------------
		
		public function LoadLocaleEvent(locale:LocaleVO, bubbles:Boolean=true, cancelable:Boolean=true)
		{
			super(EVENT_NAME, bubbles, cancelable);
			
			this.locale = locale;
		}
	}
}