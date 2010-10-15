package com.masuland.loginexample.swiz10.control.event
{	
	import com.masuland.loginexample.swiz10.vo.LayoutVO;
	
	import flash.events.Event;
	import flash.utils.getQualifiedClassName;

	/**  */
	public class LoadLayoutEvent extends Event
	{	
		/**  */
		public static const EVENT_NAME:String = 'com.masuland.loginexample.swiz10.control.event.LoadLayoutEvent.EVENT_NAME';
		
		public var layout:LayoutVO;
		
		/**  */
		public function LoadLayoutEvent(layout:LayoutVO, cancelable:Boolean=false)
		{
			super(EVENT_NAME, true, cancelable);
			
			this.layout = layout;
		}
	}
}