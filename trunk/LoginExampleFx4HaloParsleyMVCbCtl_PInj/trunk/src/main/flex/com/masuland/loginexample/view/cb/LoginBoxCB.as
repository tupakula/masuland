package com.masuland.loginexample.view.cb
{
	import com.masuland.loginexample.control.event.AppEvent;
	import com.masuland.loginexample.control.event.LoginEvent;
	import com.masuland.loginexample.control.event.RegisterEvent;
	import com.masuland.loginexample.model.AppModel;
	import com.masuland.loginexample.model.state.LoginBoxState;
	import com.masuland.loginexample.model.vo.AuthenticationVO;

	public class LoginBoxCB
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

		[MessageDispatcher]
		public var dispatcher:Function;
		
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
			dispatcher(new LoginEvent(auth));
		}
		
		private function register(auth:AuthenticationVO):void
		{
			dispatcher(new RegisterEvent(auth));
		}

		public function gotoLogin():void
		{
			dispatcher(new AppEvent(AppEvent.GOTO_LOGIN));
		}
		
		public function gotoRegister():void
		{
			dispatcher(new AppEvent(AppEvent.GOTO_REGISTER));
		}
	}
}