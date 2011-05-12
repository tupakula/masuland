package com.masuland.loginexample.action.event
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.masuland.loginexample.data.vo.AuthenticationVO;
	
	import flash.events.Event;
	import flash.utils.getQualifiedClassName;

	/**
	 * @author masuland.com
	 */
	public class RegisterEvent extends CairngormEvent
	{
		//----------------------
		// Constants
		//----------------------
		
		public static const EVENT_NAME:String = getQualifiedClassName(
			Class(RegisterEvent)).substring(
				getQualifiedClassName(Class(RegisterEvent)).lastIndexOf('::')+2, 
				getQualifiedClassName(Class(RegisterEvent)).length);

		//----------------------
		// Properties
		//----------------------
		
		public var auth:AuthenticationVO;
		public var nextEvent:Event;
		
		//----------------------
		// Constructor
		//----------------------
		
		public function RegisterEvent(auth:AuthenticationVO, nextEvent:Event=null, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(EVENT_NAME, bubbles, cancelable);
			
			this.auth = auth;
			this.nextEvent = nextEvent;
		}
	}
}