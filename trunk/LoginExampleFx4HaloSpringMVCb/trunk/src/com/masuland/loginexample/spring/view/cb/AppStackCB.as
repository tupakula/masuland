package com.masuland.loginexample.spring.view.cb
{
	public class AppStackCB
	{
		[Autowired(name='appModel', property='loginBoxState')]
		[Bindable]
		public var loginBoxState:String;
	}
}