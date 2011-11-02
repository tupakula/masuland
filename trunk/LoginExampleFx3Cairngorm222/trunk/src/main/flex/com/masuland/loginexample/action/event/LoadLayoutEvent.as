package com.masuland.loginexample.action.event
{	
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.masuland.loginexample.data.vo.LayoutVO;

	import flash.utils.getQualifiedClassName;
	
	/**
	 * @author masuland.com
	 */
	public class LoadLayoutEvent extends CairngormEvent
	{	
		//----------------------
		// Constants
		//----------------------
		
		public static const EVENT_NAME:String = getQualifiedClassName(
			Class(LoadLayoutEvent)).substring(
				getQualifiedClassName(Class(LoadLayoutEvent)).lastIndexOf('::')+2, 
				getQualifiedClassName(Class(LoadLayoutEvent)).length);
		
		//----------------------
		// Properties
		//----------------------
		
		public var layout:LayoutVO;
		
		//----------------------
		// Constructor
		//----------------------
		
		public function LoadLayoutEvent(layout:LayoutVO, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(EVENT_NAME, bubbles, cancelable);
			
			this.layout = layout;
		}
	}
}