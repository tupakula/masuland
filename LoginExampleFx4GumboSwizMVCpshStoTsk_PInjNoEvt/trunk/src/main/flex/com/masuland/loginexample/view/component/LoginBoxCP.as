package com.masuland.loginexample.view.component
{
	import com.masuland.loginexample.action.IAppStories;
	import com.masuland.loginexample.data.state.LoginBoxState;
	import com.masuland.loginexample.data.vo.AuthenticationVO;
	
	import flash.events.MouseEvent;
	
	import mx.automation.IAutomationObject;
	import mx.events.FlexEvent;
	
	import spark.components.Button;
	import spark.components.TextInput;
	import spark.components.supportClasses.SkinnableComponent;

	[SkinState('login')]
	[SkinState('loginProgress')]
	[SkinState('register')]
	[SkinState('registerProgress')]
	[SkinState('loggedIn')]
	public class LoginBoxCP extends SkinnableComponent
	{
		//----------------------
		// Skin Parts
		//----------------------
		
		[SkinPart(required='true')]
		public var tip_username:TextInput;
		
		[SkinPart(required='true')]
		public var tip_email:TextInput;
		
		[SkinPart(required='true')]
		public var tip_password:TextInput;
		
		[SkinPart(required='true')]
		public var tip_repeatPassword:TextInput;
		
		[SkinPart(required='true')]
		public var btn_doLogin:Button;
		
		[SkinPart(required='true')]
		public var btn_gotoRegister:Button;
		
		[SkinPart(required='true')]
		public var btn_doRegister:Button;
		
		[SkinPart(required='true')]
		public var btn_gotoLogin:Button;
		
		//----------------------
		// Properties
		//----------------------
		
		protected var auth:AuthenticationVO = new AuthenticationVO();
		
		[Inject]
		public var appStories:IAppStories;

		private var _loginBoxState:String;
		private var _isResetFormDirty:Boolean;
		
		//----------------------
		// Getter / Setter
		//----------------------
		
		[Inject(source='appModel.loginBoxState', bind='true')]
		[Bindable]
		public function get loginBoxState():String
		{
			return _loginBoxState;
		}
		
		public function set loginBoxState(value:String):void
		{
			_loginBoxState = value;
			
			invalidateSkinState();
		}

		//----------------------
		// Methods
		//----------------------
		
		override protected function partAdded(partName:String, instance:Object):void 
		{
			super.partAdded(partName, instance);
			
			if (instance == tip_username) 
			{
				tip_username.addEventListener(FlexEvent.ENTER, tip_username_enterHandler);
			}
			if (instance == tip_email) 
			{
				tip_email.addEventListener(FlexEvent.ENTER, tip_email_enterHandler);
			}
			if (instance == tip_password) 
			{
				tip_password.addEventListener(FlexEvent.ENTER, tip_password_enterHandler);
			}
			if (instance == tip_repeatPassword) 
			{
				tip_repeatPassword.addEventListener(FlexEvent.ENTER, tip_repeatPassword_enterHandler);
			}
			if (instance == btn_doLogin) 
			{
				btn_doLogin.addEventListener(MouseEvent.CLICK, btn_doLogin_clickHandler);
			}
			if (instance == btn_gotoRegister) 
			{
				btn_gotoRegister.addEventListener(MouseEvent.CLICK, btn_gotoRegister_clickHandler);
			}
			if (instance == btn_doRegister) 
			{
				btn_doRegister.addEventListener(MouseEvent.CLICK, btn_doRegister_clickHandler);
			}
			if (instance == btn_gotoLogin) 
			{
				btn_gotoLogin.addEventListener(MouseEvent.CLICK, btn_gotoLogin_clickHandler);
			}
		}
		
		override protected function partRemoved(partName:String, instance:Object):void 
		{
			super.partRemoved(partName, instance);
			
			if (instance == tip_username) 
			{
				tip_username.removeEventListener(FlexEvent.ENTER, tip_username_enterHandler);
			}
			if (instance == tip_email) 
			{
				tip_email.removeEventListener(FlexEvent.ENTER, tip_email_enterHandler);
			}
			if (instance == tip_password) 
			{
				tip_password.removeEventListener(FlexEvent.ENTER, tip_password_enterHandler);
			}
			if (instance == tip_repeatPassword) 
			{
				tip_repeatPassword.removeEventListener(FlexEvent.ENTER, tip_repeatPassword_enterHandler);
			}
			if (instance == btn_doLogin) 
			{
				btn_doLogin.removeEventListener(MouseEvent.CLICK, btn_doLogin_clickHandler);
			}
			if (instance == btn_gotoRegister) 
			{
				btn_gotoRegister.removeEventListener(MouseEvent.CLICK, btn_gotoRegister_clickHandler);
			}
			if (instance == btn_doRegister) 
			{
				btn_doRegister.removeEventListener(MouseEvent.CLICK, btn_doRegister_clickHandler);
			}
			if (instance == btn_gotoLogin) 
			{
				btn_gotoLogin.removeEventListener(MouseEvent.CLICK, btn_gotoLogin_clickHandler);
			}
		}
		
		override protected function getCurrentSkinState():String
		{
			return _loginBoxState;
		} 
		
		override protected function commitProperties():void
		{
			super.commitProperties();
			
			if (_isResetFormDirty)
			{
				tip_username.text = '';
				tip_email.text = '';
				tip_password.text = '';
				tip_repeatPassword.text = '';
				
				_isResetFormDirty = false;
			}
		}
		
		public function doLoginOrRegister():void
		{
			// Set authentication values
			auth.username = tip_username.text;
			auth.email = tip_email.text;
			auth.password = tip_password.text;
			
			if (_loginBoxState == LoginBoxState.LOGIN)
			{
				appStories.login(auth);
			}
			else if (_loginBoxState == LoginBoxState.REGISTER)
			{
				appStories.register(auth);
			}
			
			_isResetFormDirty = true;
			invalidateProperties();
		}

		public function gotoLogin():void
		{
			appStories.gotoLogin();
		}
		
		public function gotoRegister():void
		{
			appStories.gotoRegister();
		}
		
		//----------------------
		// Handler
		//----------------------
		
		protected function tip_username_enterHandler(event:FlexEvent):void
		{
			doLoginOrRegister();
		}
		
		protected function tip_email_enterHandler(event:FlexEvent):void
		{
			doLoginOrRegister();
		}
		
		protected function tip_password_enterHandler(event:FlexEvent):void
		{
			doLoginOrRegister();
		}
		
		protected function tip_repeatPassword_enterHandler(event:FlexEvent):void
		{
			doLoginOrRegister();
		}
		
		protected function btn_doLogin_clickHandler(event:MouseEvent):void
		{
			doLoginOrRegister();
		}
		
		protected function btn_gotoRegister_clickHandler(event:MouseEvent):void
		{
			gotoRegister()
		}
		
		protected function btn_doRegister_clickHandler(event:MouseEvent):void
		{
			doLoginOrRegister();
		}
		
		protected function btn_gotoLogin_clickHandler(event:MouseEvent):void
		{
			gotoLogin();
		}
		
		//------------------------------
		// Automation
		//------------------------------
		
		override public function getAutomationChildren():Array 
		{
			return [tip_username, tip_email, tip_password, tip_repeatPassword, btn_doLogin, btn_gotoRegister, btn_doRegister, btn_gotoLogin];
		}
		
		override public function getAutomationChildAt(index:int):IAutomationObject 
		{
			switch (index)
			{
				case 0:
					return tip_username;
					
				case 1:
					return tip_email;
					
				case 2:
					return tip_password;
					
				case 3:
					return tip_repeatPassword;
					
				case 4:
					return btn_doLogin;
					
				case 5:
					return btn_gotoRegister;
					
				case 6:
					return btn_doRegister;
					
				default:
					return btn_gotoLogin;
			}
		}
		
		override public function get numAutomationChildren():int 
		{
			return 8;
		}
	}
}