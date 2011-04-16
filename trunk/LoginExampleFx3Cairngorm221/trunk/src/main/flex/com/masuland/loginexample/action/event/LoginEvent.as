package com.masuland.loginexample.action.event
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.masuland.loginexample.data.vo.AuthenticationVO;
	
	import flash.events.Event;
	import flash.utils.getQualifiedClassName;

	public class LoginEvent extends CairngormEvent
	{
		/**  */
		public static const EVENT_NAME:String = getQualifiedClassName(
			Class(LoginEvent)).substring(
				getQualifiedClassName(Class(LoginEvent)).lastIndexOf('::')+2, 
				getQualifiedClassName(Class(LoginEvent)).length);

		public var auth:AuthenticationVO;
		public var nextEvent:Event;
		
		public function LoginEvent(auth:AuthenticationVO, nextEvent:Event=null, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(EVENT_NAME, bubbles, cancelable);
			
			this.auth = auth;
			this.nextEvent = nextEvent;
		}
	}
}