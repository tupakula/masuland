package com.masuland.loginexample.swiz064.control.event
{	
	import com.masuland.loginexample.swiz064.vo.AuthenticationVO;
	
	import flash.events.Event;
	import flash.utils.getQualifiedClassName;

	/**  */
	public class RegisterEvent extends Event
	{	
		/**  */
		public static const EVENT_NAME:String = getQualifiedClassName(
			Class(RegisterEvent)).substring(
				getQualifiedClassName(Class(RegisterEvent)).lastIndexOf("::")+2, 
				getQualifiedClassName(Class(RegisterEvent)).length);
		
		public var auth:AuthenticationVO;
		public var nextEvent:Event;
		
		/**  */
		public function RegisterEvent(auth:AuthenticationVO, nextEvent:Event=null, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(EVENT_NAME, bubbles, cancelable);
			
			this.auth = auth;
			
			this.nextEvent = nextEvent;
		}
	}
}