package com.masuland.loginexample.action.event
{	
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.masuland.loginexample.data.vo.StyleVO;
	
	import flash.utils.getQualifiedClassName;

	/**  */
	public class LoadStyleEvent extends CairngormEvent
	{	
		/**  */
		public static const EVENT_NAME:String = getQualifiedClassName(
			Class(LoadStyleEvent)).substring(
				getQualifiedClassName(Class(LoadStyleEvent)).lastIndexOf('::')+2, 
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