package com.masuland.loginexample.domain
{
	import com.masuland.loginexample.domain.vo.LayoutVO;
	import com.masuland.loginexample.domain.vo.LocaleVO;
	import com.masuland.loginexample.domain.vo.SettingsVO;
	import com.masuland.loginexample.domain.vo.StyleVO;
	import com.masuland.loginexample.domain.vo.UserVO;
	
	import mx.collections.ArrayCollection;

	[Bindable]
	/**
	 * @author masuland.com
	 */
	public class AppModel
	{		
		//---------------
		// Values
		//---------------
		
		[Publish(scope='appModel', objectId='currentUser')]
		public var currentUser:UserVO;
		
		[Publish(scope='appModel', objectId='settings')]
		public var settings:SettingsVO;

		[Publish(scope='appModel', objectId='currentStyle')]
		public var currentStyle:StyleVO;
		
		[Publish(scope='appModel', objectId='currentLayout')]
		public var currentLayout:LayoutVO;
		
		[Publish(scope='appModel', objectId='currentLocale')]
		public var currentLocale:LocaleVO;
		
		//---------------
		// Flags
		//---------------
		
		[Publish(scope='appModel', objectId='isApplicationVisible')]
		public var isApplicationVisible:Boolean;
		
		//---------------
		// States
		//---------------
		
		[Publish(scope='appModel', objectId='loginBoxState')]
		public var loginBoxState:String;
		
		[Publish(scope='appModel', objectId='appStackState')]
		public var appStackState:String;
		
		[Publish(scope='appModel', objectId='settingsBoxState')]
		public var settingsBoxState:String;
	}
}