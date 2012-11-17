package org.apache.flex.apps.loginexample.action.event
{	
	import org.apache.flex.apps.loginexample.data.vo.StyleVO;
	
	import flash.events.Event;

	/**
	 * 
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
		
		//----------------------
		// Methods
		//----------------------
		
		override public function clone():Event
		{
			return new LoadStyleEvent(style);
		}
	}
}
