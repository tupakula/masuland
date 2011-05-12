package com.masuland.loginexample.action.event
{	
	import com.masuland.loginexample.data.vo.UserVO;
	
	import flash.events.Event;

	/**
	 * @author masuland.com
	 */
	public class UpdateUserEvent extends Event
	{	
		//----------------------
		// Constants
		//----------------------
		
		public static const EVENT_NAME:String = 'com.masuland.loginexample.swiz.control.event.UpdateUserEvent.EVENT_NAME';
		
		//----------------------
		// Properties
		//----------------------
		
		public var user:UserVO;
		
		//----------------------
		// Constructor
		//----------------------
		
		public function UpdateUserEvent(user:UserVO, cancelable:Boolean=false)
		{
			super(EVENT_NAME, true, cancelable);
			
			this.user = user;
		}
	}
}