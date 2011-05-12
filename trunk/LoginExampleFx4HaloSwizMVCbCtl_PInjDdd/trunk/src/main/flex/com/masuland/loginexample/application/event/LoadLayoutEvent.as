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
		
		public static const EVENT_NAME:String = 'com.masuland.loginexample.swiz.control.event.LoadLayoutEvent.EVENT_NAME';
		
		//----------------------
		// Properties
		//----------------------
		
		public var layout:LayoutVO;
		
		//----------------------
		// Constructor
		//----------------------
		
		public function LoadLayoutEvent(layout:LayoutVO, cancelable:Boolean=false)
		{
			super(EVENT_NAME, true, cancelable);
			
			this.layout = layout;
		}
	}
}