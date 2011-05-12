package com.masuland.loginexample.application.event
{	
	import com.masuland.loginexample.domain.vo.LayoutVO;
	
	import flash.events.Event;

	/**
	 * @author masuland.com
	 */
	public class LoadLayoutEvent extends Event
	{	
		//----------------------
		// Constants
		//----------------------
		
		public static const EVENT_NAME:String = 'LoadLayoutEvent.EVENT_NAME';
		
		//----------------------
		// Properties
		//----------------------
		
		public var layout:LayoutVO;
		
		//----------------------
		// Constructor
		//----------------------
		
		public function LoadLayoutEvent(layout:LayoutVO, bubbles:Boolean=true, cancelable:Boolean=true)
		{
			super(EVENT_NAME, bubbles, cancelable);
			
			this.layout = layout;
		}
	}
}