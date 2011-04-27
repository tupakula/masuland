package com.masuland.loginexample.action.event
{	
	import com.masuland.loginexample.data.vo.LayoutVO;
	
	import flash.events.Event;
	import flash.utils.getQualifiedClassName;

	/**  */
	public class LoadLayoutEvent extends Event
	{	
		/**  */
		public static const EVENT_NAME:String = 'LoadLayoutEvent.EVENT_NAME';
		
		public var layout:LayoutVO;
		public var refreshStyleAndLocales:Boolean;
		
		/**  */
		public function LoadLayoutEvent(layout:LayoutVO, refreshStyleAndLocales:Boolean=true, bubbles:Boolean=true, cancelable:Boolean=true)
		{
			super(EVENT_NAME, bubbles, cancelable);
			
			this.layout = layout;
			this.refreshStyleAndLocales = refreshStyleAndLocales;
		}
		
		override public function clone():Event
		{
			return new LoadLayoutEvent(layout);
		}
	}
}