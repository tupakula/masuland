package com.masuland.loginexample.action.event
{	
	import com.masuland.loginexample.data.vo.StyleVO;
	
	import flash.events.Event;

	/**
	 * @author masuland.com
	 */
	public class LoadStyleEvent extends Event
	{	
		//----------------------
		// Constants
		//----------------------
		
		public static const EVENT_NAME:String = 'com.masuland.loginexample.swiz.control.event.LoadStyleEvent.EVENT_NAME';
		
		//----------------------
		// Properties
		//----------------------
		
		public var style:StyleVO;
		
		//----------------------
		// Constructor
		//----------------------
		
		public function LoadStyleEvent(style:StyleVO, cancelable:Boolean=false)
		{
			super(EVENT_NAME, true, cancelable);
			
			this.style = style;
		}
	}
}