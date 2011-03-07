package com.masuland.loginexample.control.event
{	
	import com.masuland.loginexample.vo.LayoutVO;
	
	import flash.events.Event;
	import flash.utils.getQualifiedClassName;

	/**  */
	public class LoadLayoutEvent extends Event
	{	
		/**  */
		public static const EVENT_NAME:String = getQualifiedClassName(
			Class(LoadLayoutEvent)).substring(
				getQualifiedClassName(Class(LoadLayoutEvent)).lastIndexOf('::')+2, 
				getQualifiedClassName(Class(LoadLayoutEvent)).length);
		
		public var layout:LayoutVO;
		
		/**  */
		public function LoadLayoutEvent(layout:LayoutVO, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(EVENT_NAME, bubbles, cancelable);
			
			this.layout = layout;
		}
	}
}