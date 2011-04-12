package com.masuland.loginexample.application.event
{	
	import com.masuland.loginexample.domain.vo.UserVO;
	
	import flash.events.Event;
	import flash.utils.getQualifiedClassName;

	/**  */
	public class UpdateUserEvent extends Event
	{	
		/**  */
		public static const EVENT_NAME:String = 'UpdateUserEvent.EVENT_NAME';
		
		public var user:UserVO;
		
		/**  */
		public function UpdateUserEvent(user:UserVO, bubbles:Boolean=true, cancelable:Boolean=true)
		{
			super(EVENT_NAME, bubbles, cancelable);
			
			this.user = user;
		}
	}
}