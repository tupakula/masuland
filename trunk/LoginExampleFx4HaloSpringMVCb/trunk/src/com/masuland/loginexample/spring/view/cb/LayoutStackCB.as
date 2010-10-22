package com.masuland.loginexample.spring.view.cb
{
	import com.masuland.loginexample.spring.vo.LayoutVO;

	public class LayoutStackCB
	{
		[Autowired(name='appModel', property='appStackState')]
		[Bindable]
		public var appStackState:String;

		[Autowired(name='appModel', property='currentLayout')]
		[Bindable]
		public var currentLayout:com.masuland.loginexample.spring.vo.LayoutVO;
	}
}