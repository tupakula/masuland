package com.masuland.loginexample.control.event
{	
	import com.masuland.loginexample.vo.AuthenticationVO;
	
	import flash.events.Event;
	import flash.utils.getQualifiedClassName;

	/**  */
	public class LoginEvent extends Event
	{	
		/**  */
		public static const EVENT_NAME:String = getQualifiedClassName(
			Class(LoginEvent)).substring(
				getQualifiedClassName(Class(LoginEvent)).lastIndexOf('::')+2, 
				getQualifiedClassName(Class(LoginEvent)).length);
		
		public var auth:AuthenticationVO;
		public var nextEvent:Event;
		
		/**  */
		public function LoginEvent(auth:AuthenticationVO, nextEvent:Event=null, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(EVENT_NAME, bubbles, cancelable);
			
			this.auth = auth;
			this.nextEvent = nextEvent;
		}
	}
}