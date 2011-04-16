package com.masuland.loginexample.view.codebehind
{
	import com.masuland.loginexample.action.IAppController;
	import com.masuland.loginexample.data.state.LoginBoxState;
	import com.masuland.loginexample.data.vo.AuthenticationVO;

	public class LoginBoxCB implements ILoginBoxCB
	{
		//----------------------
		// Properties
		//----------------------
		
		[Inject]
		public var appController:IAppController;
		
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
			appController.login(auth);
		}
		
		private function register(auth:AuthenticationVO):void
		{
			appController.register(auth);
		}
		
		public function gotoLogin():void
		{
			appController.gotoLogin();
		}
		
		public function gotoRegister():void
		{
			appController.gotoRegister();
		}
	}
}