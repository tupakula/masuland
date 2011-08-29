package com.masuland.loginexample.control.event
{	
	import com.masuland.loginexample.vo.AuthenticationVO;
	
	import flash.events.Event;

	/**
	 * @author masuland.com
	 */
	public class RegisterEvent extends Event
	{	
		//----------------------
		// Constants
		//----------------------
		
		public static const EVENT_NAME:String = 'RegisterEvent.EVENT_NAME';
		
		//----------------------
		// Properties
		//----------------------
		
		public var auth:AuthenticationVO;
		
		//----------------------
		// Constructor
		//----------------------
		
		public function RegisterEvent(auth:AuthenticationVO, bubbles:Boolean=true, cancelable:Boolean=true)
		{
			super(EVENT_NAME, bubbles, cancelable);
			
			this.auth = auth;
		}
	}
}