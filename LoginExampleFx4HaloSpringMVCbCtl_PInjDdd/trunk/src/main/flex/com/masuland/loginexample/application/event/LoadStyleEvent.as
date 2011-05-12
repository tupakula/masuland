package com.masuland.loginexample.application.event
{	
	import com.masuland.loginexample.domain.vo.StyleVO;
	
	import flash.events.Event;

	/**
	 * @author masuland.com
	 */
	public class LoadStyleEvent extends Event
	{	
		//----------------------
		// Constants
		//----------------------
		
		public static const EVENT_NAME:String = 'LoadStyleEvent.EVENT_NAME';
		
		//----------------------
		// Properties
		//----------------------
		
		public var style:StyleVO;
		
		//----------------------
		// Constructor
		//----------------------
		
		public function LoadStyleEvent(style:StyleVO, bubbles:Boolean=true, cancelable:Boolean=true)
		{
			super(EVENT_NAME, bubbles, cancelable);
			
			this.style = style;
		}
	}
}