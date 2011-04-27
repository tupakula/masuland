package com.masuland.loginexample.action.event
{	
	import com.masuland.loginexample.data.vo.AuthenticationVO;
	
	import flash.events.Event;
	import flash.utils.getQualifiedClassName;

	/**  */
	public class LoginEvent extends Event
	{	
		/**  */
		public static const EVENT_NAME:String = 'com.masuland.loginexample.swiz.control.event.LoginEvent.EVENT_NAME';
		
		public var auth:AuthenticationVO;
		
		/**  */
		public function LoginEvent(auth:AuthenticationVO, cancelable:Boolean=false)
		{
			super(EVENT_NAME, true, cancelable);
			
			this.auth = auth;
		}
		
		override public function clone():Event
		{
			return new LoginEvent(auth);
		}
	}
}