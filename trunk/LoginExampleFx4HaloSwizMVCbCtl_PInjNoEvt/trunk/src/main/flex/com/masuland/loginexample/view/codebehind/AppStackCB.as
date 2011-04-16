package com.masuland.loginexample.view.codebehind
{
	public class AppStackCB implements IAppStackCB
	{
		//----------------------
		// Properties
		//----------------------
		
		private var _loginBoxState:String;

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
		}
	}
}