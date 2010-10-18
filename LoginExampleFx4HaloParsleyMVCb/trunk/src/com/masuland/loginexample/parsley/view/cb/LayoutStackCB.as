package com.masuland.loginexample.parsley.view.cb
{
	import com.masuland.loginexample.parsley.control.event.AppEvent;
	import com.masuland.loginexample.parsley.control.event.LoadLayoutEvent;
	import com.masuland.loginexample.parsley.control.event.LoadLocaleEvent;
	import com.masuland.loginexample.parsley.control.event.LoadStyleEvent;
	import com.masuland.loginexample.parsley.vo.LayoutVO;
	import com.masuland.loginexample.parsley.vo.LocaleVO;
	import com.masuland.loginexample.parsley.vo.SettingsVO;
	import com.masuland.loginexample.parsley.vo.StyleVO;

	public class LayoutStackCB
	{
		[MessageDispatcher]
		public var dispatcher:Function;

		[Subscribe(scope="AppModel", objectId="appStackState")]
		[Bindable]
		public var appStackState:String;

		[Subscribe(scope="AppModel", objectId="currentLayout")]
		[Bindable]
		public var currentLayout:LayoutVO;
	}
}