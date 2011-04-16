package com.masuland.loginexample.action
{
	import com.masuland.loginexample.action.event.LoadLayoutEvent;
	import com.masuland.loginexample.action.event.LoadStyleEvent;
	import com.masuland.loginexample.action.event.LoginEvent;
	import com.masuland.loginexample.action.event.RegisterEvent;
	import com.masuland.loginexample.action.event.UpdateUserEvent;

	[Bindable]
	public class AppEventNames
	{
		public static const INITIALIZE_CLIENT:String = 'InitializeClientEvent';
		
		public static const GET_SETTINGS:String = 'getSettings';
		public static const LOAD_LOCALE:String = 'LoadLocaleEvent';
		public static const LOAD_STYLE:String = LoadStyleEvent.EVENT_NAME;
		public static const LOAD_LAYOUT:String = LoadLayoutEvent.EVENT_NAME;

		public static const GOTO_LOGIN:String = 'gotoLogin';
		public static const GOTO_REGISTER:String = 'gotoRegister';
				
		public static const LOGIN:String = LoginEvent.EVENT_NAME;
		public static const LOGOUT:String = 'Logout';
		public static const REGISTER:String = RegisterEvent.EVENT_NAME;
		public static const UPDATE_USER:String = UpdateUserEvent.EVENT_NAME;
	}
}