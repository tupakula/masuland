package com.masuland.loginexample.application.event
{	
	import com.masuland.loginexample.domain.vo.AuthenticationVO;
	
	import flash.events.Event;

	/**
	 * @author masuland.com
	 */
	public class RegisterEvent extends Event
	{	
		//----------------------
		// Constants
		//----------------------
		
		public static const EVENT_NAME:String = 'com.masuland.loginexample.swiz.control.event.RegisterEvent.EVENT_NAME';
		
		//----------------------
		// Properties
		//----------------------
		
		public var auth:AuthenticationVO;
		
		//----------------------
		// Constructor
		//----------------------
		
		public function RegisterEvent(auth:AuthenticationVO, cancelable:Boolean=false)
		{
			super(EVENT_NAME, true, cancelable);
			
			this.auth = auth;
		}
	}
}