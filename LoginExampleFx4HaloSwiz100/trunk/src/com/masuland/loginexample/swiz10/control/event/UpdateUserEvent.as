package com.masuland.loginexample.swiz10.control.event
{	
	import com.masuland.loginexample.swiz10.vo.UserVO;
	
	import flash.events.Event;
	import flash.utils.getQualifiedClassName;

	/**  */
	public class UpdateUserEvent extends Event
	{	
		/**  */
		public static const EVENT_NAME:String = 'com.masuland.loginexample.swiz10.control.event.UpdateUserEvent.EVENT_NAME';
		
		public var user:UserVO;
		
		/**  */
		public function UpdateUserEvent(user:UserVO, cancelable:Boolean=false)
		{
			super(EVENT_NAME, true, cancelable);
			
			this.user = user;
		}
	}
}