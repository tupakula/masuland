package com.masuland.loginexample.action.event
{	
	import com.masuland.loginexample.data.vo.LayoutVO;
	
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
		public var refreshStyleAndLocales:Boolean; 
		
		//----------------------
		// Constructor
		//----------------------
		
		public function LoadLayoutEvent(layout:LayoutVO, refreshStyleAndLocales:Boolean=true, bubbles:Boolean=true, cancelable:Boolean=true)
		{
			super(EVENT_NAME, bubbles, cancelable);
			
			this.layout = layout;
			this.refreshStyleAndLocales = refreshStyleAndLocales;
		}
		
		//----------------------
		// Methods
		//----------------------
		
		override public function clone():Event
		{
			return new LoadLayoutEvent(layout);
		}
	}
}
