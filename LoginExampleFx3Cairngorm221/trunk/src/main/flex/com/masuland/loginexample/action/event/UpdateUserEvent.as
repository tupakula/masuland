package com.masuland.loginexample.action.event
{	
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.masuland.loginexample.data.vo.UserVO;

	import flash.utils.getQualifiedClassName;

	/**
	 * @author masuland.com
	 */
	public class UpdateUserEvent extends CairngormEvent
	{	
		//----------------------
		// Constants
		//----------------------
		
		public static const EVENT_NAME:String = getQualifiedClassName(
			Class(UpdateUserEvent)).substring(
				getQualifiedClassName(Class(UpdateUserEvent)).lastIndexOf('::')+2, 
				getQualifiedClassName(Class(UpdateUserEvent)).length);
		
		//----------------------
		// Properties
		//----------------------
		
		public var user:UserVO;
		
		//----------------------
		// Constructor
		//----------------------
		
		public function UpdateUserEvent(user:UserVO, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(EVENT_NAME, bubbles, cancelable);
			
			this.user = user;
		}
	}
}