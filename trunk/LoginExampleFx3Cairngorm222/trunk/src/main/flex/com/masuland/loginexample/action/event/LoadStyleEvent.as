package com.masuland.loginexample.action.event
{	
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.masuland.loginexample.data.vo.StyleVO;

	import flash.utils.getQualifiedClassName;
	
	/**
	 * @author masuland.com
	 */
	public class LoadStyleEvent extends CairngormEvent
	{	
		//----------------------
		// Constants
		//----------------------
		
		public static const EVENT_NAME:String = getQualifiedClassName(
			Class(LoadStyleEvent)).substring(
				getQualifiedClassName(Class(LoadStyleEvent)).lastIndexOf('::')+2, 
				getQualifiedClassName(Class(LoadStyleEvent)).length);
		
		//----------------------
		// Properties
		//----------------------
		
		public var style:StyleVO;
		
		//----------------------
		// Constructor
		//----------------------
		
		public function LoadStyleEvent(style:StyleVO, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(EVENT_NAME, bubbles, cancelable);
			
			this.style = style;
		}
	}
}