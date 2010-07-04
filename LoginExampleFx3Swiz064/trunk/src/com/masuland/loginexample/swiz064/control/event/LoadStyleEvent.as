package com.masuland.loginexample.swiz064.control.event
{	
	import com.masuland.loginexample.swiz064.vo.StyleVO;
	
	import flash.events.Event;
	import flash.utils.getQualifiedClassName;

	/**  */
	public class LoadStyleEvent extends Event
	{	
		/**  */
		public static const EVENT_NAME:String = getQualifiedClassName(
			Class(LoadStyleEvent)).substring(
				getQualifiedClassName(Class(LoadStyleEvent)).lastIndexOf("::")+2, 
				getQualifiedClassName(Class(LoadStyleEvent)).length);
		
		public var style:StyleVO;
		
		/**  */
		public function LoadStyleEvent(style:StyleVO, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(EVENT_NAME, bubbles, cancelable);
			
			this.style = style;
		}
	}
}