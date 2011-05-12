package com.masuland.loginexample.action.event
{	
	import com.masuland.loginexample.data.vo.LayoutVO;
	
	import flash.events.Event;
	import flash.utils.getQualifiedClassName;

	/**
	 * @author masuland.com
	 */
	public class LoadLayoutEvent extends Event
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