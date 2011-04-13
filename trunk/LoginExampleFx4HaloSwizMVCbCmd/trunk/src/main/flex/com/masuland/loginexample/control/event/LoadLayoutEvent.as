package com.masuland.loginexample.control.event
{	
	import com.masuland.loginexample.vo.LayoutVO;
	
	import flash.events.Event;
	import flash.utils.getQualifiedClassName;

	/**  */
	public class LoadLayoutEvent extends Event
	{	
		/**  */
		public static const EVENT_NAME:String = 'LoadLayoutEvent.EVENT_NAME';
		
		public var layout:LayoutVO;
		
		/**  */
		public function LoadLayoutEvent(layout:LayoutVO, cancelable:Boolean=false)
		{
			super(EVENT_NAME, true, cancelable);
			
			this.layout = layout;
		}
	}
}