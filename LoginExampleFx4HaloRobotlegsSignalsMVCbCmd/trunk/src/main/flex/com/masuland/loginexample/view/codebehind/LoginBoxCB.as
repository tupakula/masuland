package com.masuland.loginexample.view.codebehind
{
	import com.masuland.loginexample.action.signal.GotoLoginSignal;
	import com.masuland.loginexample.action.signal.GotoRegisterSignal;
	import com.masuland.loginexample.action.signal.LoginSignal;
	import com.masuland.loginexample.action.signal.RegisterSignal;
	import com.masuland.loginexample.data.state.LoginBoxState;
	import com.masuland.loginexample.data.vo.AuthenticationVO;

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
		
		[Inject]
		public var loginSignal:LoginSignal;
		
		[Inject]
		public var registerSignal:RegisterSignal;
		
		[Inject]
		public var gotoLoginSignal:GotoLoginSignal;
		
		[Inject]
		public var gotoRegisterSignal:GotoRegisterSignal;
		
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
			loginSignal.dispatch(auth);
		}
		
		private function register(auth:AuthenticationVO):void
		{
			registerSignal.dispatch(auth);
		}

		public function gotoLogin():void
		{
			gotoLoginSignal.dispatch();
		}
		
		public function gotoRegister():void
		{
			gotoRegisterSignal.dispatch();
		}
	}
}