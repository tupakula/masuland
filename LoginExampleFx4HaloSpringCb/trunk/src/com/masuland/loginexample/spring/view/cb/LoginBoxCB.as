package com.masuland.loginexample.spring.view.cb
{
	import com.masuland.loginexample.spring.control.event.AppEvent;
	import com.masuland.loginexample.spring.control.event.LoginEvent;
	import com.masuland.loginexample.spring.control.event.RegisterEvent;
	import com.masuland.loginexample.spring.model.AppModel;
	import com.masuland.loginexample.spring.state.LoginBoxState;
	import com.masuland.loginexample.spring.vo.AuthenticationVO;
	
	import flash.events.EventDispatcher;

	[RouteEvents(events="LoginEvent.EVENT_NAME, RegisterEvent.EVENT_NAME, AppEvent.GOTO_LOGIN, AppEvent.GOTO_REGISTER")]
	
	[Event(name="LoginEvent.EVENT_NAME", type="com.masuland.loginexample.spring.control.event.LoginEvent")]
	[Event(name="RegisterEvent.EVENT_NAME", type="com.masuland.loginexample.spring.control.event.RegisterEvent")]
	[Event(name="AppEvent.GOTO_LOGIN", type="com.masuland.loginexample.spring.control.event.AppEvent")]
	[Event(name="AppEvent.GOTO_REGISTER", type="com.masuland.loginexample.spring.control.event.AppEvent")]
	
	public class LoginBoxCB extends EventDispatcher
	{
		[Bindable]
		public var username:String = '';
		
		[Bindable]
		public var email:String = '';
		
		[Bindable]
		public var password:String = '';
		
		[Bindable]
		public var repeatPassword:String = '';
		
		public function ctaLoginOrRegister(auth:AuthenticationVO, loginBoxState:String):void
		{
			if (loginBoxState == LoginBoxState.LOGIN)
			{
				login(auth);
				resetForm();
			}
			else if (loginBoxState == LoginBoxState.REGISTER)
			{
				register(auth);
				resetForm();
			}
		}
		
		private function resetForm():void
		{
			username = '';
			email = '';
			password = '';
			repeatPassword = '';
		}
		
		private function login(auth:AuthenticationVO):void
		{
			dispatchEvent(new LoginEvent(auth));
		}
		
		private function register(auth:AuthenticationVO):void
		{
			dispatchEvent(new RegisterEvent(auth));
		}

		public function gotoLogin():void
		{
			dispatchEvent(new AppEvent(AppEvent.GOTO_LOGIN));
		}
		
		public function gotoRegister():void
		{
			dispatchEvent(new AppEvent(AppEvent.GOTO_REGISTER));
		}
	}
}