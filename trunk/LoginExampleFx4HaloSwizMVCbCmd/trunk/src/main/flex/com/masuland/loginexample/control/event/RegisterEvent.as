package com.masuland.loginexample.control.event
{	
	import com.masuland.loginexample.vo.AuthenticationVO;
	
	import flash.events.Event;
	import flash.utils.getQualifiedClassName;

	/**  */
	public class RegisterEvent extends Event
	{	
		/**  */
		public static const EVENT_NAME:String = 'RegisterEvent.EVENT_NAME';
		
		public var auth:AuthenticationVO;
		public var nextEvent:Event;
		
		/**  */
		public function RegisterEvent(auth:AuthenticationVO, cancelable:Boolean=false)
		{
			super(EVENT_NAME, true, cancelable);
			
			this.auth = auth;
			
			this.nextEvent = nextEvent;
		}
	}
}