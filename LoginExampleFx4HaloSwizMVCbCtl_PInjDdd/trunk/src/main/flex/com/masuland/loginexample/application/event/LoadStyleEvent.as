package com.masuland.loginexample.application.event
{	
	import com.masuland.loginexample.domain.vo.StyleVO;
	
	import flash.events.Event;
	import flash.utils.getQualifiedClassName;

	/**  */
	public class LoadStyleEvent extends Event
	{	
		/**  */
		public static const EVENT_NAME:String = 'com.masuland.loginexample.swiz.control.event.LoadStyleEvent.EVENT_NAME';
		
		public var style:StyleVO;
		
		/**  */
		public function LoadStyleEvent(style:StyleVO, cancelable:Boolean=false)
		{
			super(EVENT_NAME, true, cancelable);
			
			this.style = style;
		}
	}
}