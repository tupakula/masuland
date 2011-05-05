package com.masuland.loginexample.action.event
{	
	import com.masuland.loginexample.data.vo.AuthenticationVO;
	
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
		public function RegisterEvent(auth:AuthenticationVO, bubbles:Boolean=true, cancelable:Boolean=false)
		{
			super(EVENT_NAME, bubbles, cancelable);
			
			this.auth = auth;
			
			this.nextEvent = nextEvent;
		}
		
		override public function clone():Event
		{
			return new RegisterEvent(auth);
		}
	}
}