package com.masuland.loginexample.swiz10.control.event
{	
	import com.masuland.loginexample.swiz10.vo.AuthenticationVO;
	
	import flash.events.Event;
	import flash.utils.getQualifiedClassName;

	/**  */
	public class LoginEvent extends Event
	{	
		/**  */
		public static const EVENT_NAME:String = 'com.masuland.loginexample.swiz10.control.event.LoginEvent.EVENT_NAME';
		
		public var auth:AuthenticationVO;
		public var nextEvent:Event;
		
		/**  */
		public function LoginEvent(auth:AuthenticationVO, cancelable:Boolean=false)
		{
			super(EVENT_NAME, true, cancelable);
			
			this.auth = auth;
			this.nextEvent = nextEvent;
		}
	}
}