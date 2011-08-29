package com.masuland.loginexample.control.event
{	
	import com.masuland.loginexample.vo.UserVO;
	
	import flash.events.Event;

	/**
	 * @author masuland.com
	 */
	public class UpdateUserEvent extends Event
	{	
		//----------------------
		// Constants
		//----------------------
		
		public static const EVENT_NAME:String = 'UpdateUserEvent.EVENT_NAME';
		
		//----------------------
		// Properties
		//----------------------
		
		public var user:UserVO;
		
		//----------------------
		// Constructor
		//----------------------
		
		public function UpdateUserEvent(user:UserVO, bubbles:Boolean=true, cancelable:Boolean=true)
		{
			super(EVENT_NAME, bubbles, cancelable);
			
			this.user = user;
		}
	}
}