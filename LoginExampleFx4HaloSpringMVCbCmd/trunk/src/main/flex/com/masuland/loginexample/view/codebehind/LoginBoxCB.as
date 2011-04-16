package com.masuland.loginexample.view.codebehind
{
	import com.masuland.loginexample.action.event.AppEvent;
	import com.masuland.loginexample.action.event.LoginEvent;
	import com.masuland.loginexample.action.event.RegisterEvent;
	import com.masuland.loginexample.data.AppModel;
	import com.masuland.loginexample.data.state.LoginBoxState;
	import com.masuland.loginexample.data.vo.AuthenticationVO;
	
	import flash.events.EventDispatcher;

	[RouteEvents(events='LoginEvent.EVENT_NAME, RegisterEvent.EVENT_NAME, AppEvent.GOTO_LOGIN, AppEvent.GOTO_REGISTER')]
	
	[Event(name='LoginEvent.EVENT_NAME', type='com.masuland.loginexample.control.event.LoginEvent')]
	[Event(name='RegisterEvent.EVENT_NAME', type='com.masuland.loginexample.control.event.RegisterEvent')]
	[Event(name='AppEvent.GOTO_LOGIN', type='com.masuland.loginexample.control.event.AppEvent')]
	[Event(name='AppEvent.GOTO_REGISTER', type='com.masuland.loginexample.control.event.AppEvent')]
	
	public class LoginBoxCB extends EventDispatcher
	{
		//----------------------
		// Properties
		//----------------------
		
		[Bindable]
		public var username:String = '';
		
		[Bindable]
		public var email:String = '';
		
		[Bindable]
		public var password:String = '';
		
		[Bindable]
		public var repeatPassword:String = '';
		
		//----------------------
		// Methods
		//----------------------
		
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