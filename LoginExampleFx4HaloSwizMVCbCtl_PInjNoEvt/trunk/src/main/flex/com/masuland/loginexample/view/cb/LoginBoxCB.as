package com.masuland.loginexample.view.cb
{
	import com.masuland.loginexample.control.IAppController;
	import com.masuland.loginexample.state.LoginBoxState;
	import com.masuland.loginexample.vo.AuthenticationVO;

	public class LoginBoxCB implements ILoginBoxCB
	{
		//----------------------
		// Properties
		//----------------------
		
		[Inject]
		public var appController:IAppController;
		
		private var _username:String = '';
		
		private var _email:String = '';
		
		private var _password:String = '';
		
		private var _repeatPassword:String = '';
		
		//----------------------
		// Getter / Setter
		//----------------------
		
		[Bindable]
		public function get username():String
		{
			return _username;
		}

		public function set username(value:String):void
		{
			_username = value;
		}

		[Bindable]
		public function get email():String
		{
			return _email;
		}

		public function set email(value:String):void
		{
			_email = value;
		}

		[Bindable]
		public function get password():String
		{
			return _password;
		}

		public function set password(value:String):void
		{
			_password = value;
		}

		[Bindable]
		public function get repeatPassword():String
		{
			return _repeatPassword;
		}

		public function set repeatPassword(value:String):void
		{
			_repeatPassword = value;
		}

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