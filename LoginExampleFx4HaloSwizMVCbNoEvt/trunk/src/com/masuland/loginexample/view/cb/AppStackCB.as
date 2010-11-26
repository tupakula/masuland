package com.masuland.loginexample.view.cb
{
	public class AppStackCB implements IAppStackCB
	{
		private var _loginBoxState:String;

		[Inject(source="appModel.loginBoxState", bind="true")]
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