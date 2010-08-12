package com.masuland.loginexample.spring.control.event
{	
	import com.masuland.loginexample.spring.vo.AuthenticationVO;
	
	import flash.events.Event;
	import flash.utils.getQualifiedClassName;

	/**  */
	public class LoginEvent extends Event
	{	
		/**  */
		public static const EVENT_NAME:String = 'LoginEvent.EVENT_NAME';
		
		public var auth:AuthenticationVO;
		public var nextEvent:Event;
		
		/**  */
		public function LoginEvent(auth:AuthenticationVO, bubbles:Boolean=true, cancelable:Boolean=true)
		{
			super(EVENT_NAME, bubbles, cancelable);
			
			this.auth = auth;
			this.nextEvent = nextEvent;
		}
	}
}