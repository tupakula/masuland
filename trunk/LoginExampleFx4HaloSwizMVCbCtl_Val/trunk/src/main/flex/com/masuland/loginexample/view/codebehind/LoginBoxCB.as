package com.masuland.loginexample.view.codebehind
{
	import com.masuland.loginexample.action.event.AppEvent;
	import com.masuland.loginexample.action.event.LoginEvent;
	import com.masuland.loginexample.action.event.RegisterEvent;
	import com.masuland.loginexample.data.AppModel;
	import com.masuland.loginexample.data.state.LoginBoxState;
	import com.masuland.loginexample.data.vo.AuthenticationVO;
	
	import flash.events.IEventDispatcher;
	
	import mx.binding.utils.ChangeWatcher;
	import mx.events.PropertyChangeEvent;

	public class LoginBoxCB
	{
		//----------------------
		// Properties
		//----------------------
		
		[Inject]
		[Bindable]
		public var appModel:AppModel;

		[Bindable]
		public var username:String = '';
		
		[Bindable]
		public var email:String = '';
		
		[Bindable]
		public var password:String = '';
		
		[Bindable]
		public var repeatPassword:String = '';
		
		[Bindable]
		public var validatorGroup:LoginBoxValidatorGroup = new LoginBoxValidatorGroup();

		[Dispatcher]
		public var dispatcher:IEventDispatcher;
		
		//----------------------
		// Constructor
		//----------------------
		
		public function LoginBoxCB()
		{
			validatorGroup.cb = this;
			validatorGroup.initialized(this, "LoginBoxCB");
			validatorGroup.validate(true);
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
			
			validatorGroup.reset();
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