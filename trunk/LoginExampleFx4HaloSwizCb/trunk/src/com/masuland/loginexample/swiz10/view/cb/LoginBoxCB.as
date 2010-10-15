package com.masuland.loginexample.swiz10.view.cb
{
	import com.masuland.loginexample.swiz10.control.event.AppEvent;
	import com.masuland.loginexample.swiz10.control.event.LoginEvent;
	import com.masuland.loginexample.swiz10.control.event.RegisterEvent;
	import com.masuland.loginexample.swiz10.model.AppModel;
	import com.masuland.loginexample.swiz10.state.LoginBoxState;
	import com.masuland.loginexample.swiz10.vo.AuthenticationVO;
	
	import flash.events.IEventDispatcher;

	public class LoginBoxCB
	{
		[Bindable]
		public var username:String = '';
		
		[Bindable]
		public var email:String = '';
		
		[Bindable]
		public var password:String = '';
		
		[Bindable]
		public var repeatPassword:String = '';

		[Dispatcher]
		public var dispatcher:IEventDispatcher;
		
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
			dispatcher.dispatchEvent(new LoginEvent(auth));
		}
		
		private function register(auth:AuthenticationVO):void
		{
			dispatcher.dispatchEvent(new RegisterEvent(auth));
		}

		public function gotoLogin():void
		{
			dispatcher.dispatchEvent(new AppEvent(AppEvent.GOTO_LOGIN));
		}
		
		public function gotoRegister():void
		{
			dispatcher.dispatchEvent(new AppEvent(AppEvent.GOTO_REGISTER));
		}
	}
}