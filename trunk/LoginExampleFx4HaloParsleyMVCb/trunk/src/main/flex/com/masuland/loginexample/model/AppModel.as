package com.masuland.loginexample.model
{
	import com.masuland.loginexample.vo.LayoutVO;
	import com.masuland.loginexample.vo.LocaleVO;
	import com.masuland.loginexample.vo.SettingsVO;
	import com.masuland.loginexample.vo.StyleVO;
	import com.masuland.loginexample.vo.UserVO;
	
	import mx.collections.ArrayCollection;

	[Bindable]
	/**
	 * The Model
	 * @author Sebastian.Mohr (masuland@gmail.com)
	 */
	public class AppModel
	{		
		//---------------
		// Values
		//---------------
		
		[Publish(scope="AppModel", objectId="currentUser")]
		public var currentUser:UserVO;
		
		[Publish(scope="AppModel", objectId="settings")]
		public var settings:SettingsVO;

		[Publish(scope="AppModel", objectId="currentStyle")]
		public var currentStyle:StyleVO;
		
		[Publish(scope="AppModel", objectId="currentLayout")]
		public var currentLayout:LayoutVO;
		
		[Publish(scope="AppModel", objectId="currentLocale")]
		public var currentLocale:LocaleVO;
		
		//---------------
		// Flags
		//---------------
		
		[Publish(scope="AppModel", objectId="isApplicationVisible")]
		public var isApplicationVisible:Boolean;
		
		//---------------
		// States
		//---------------
		
		[Publish(scope="AppModel", objectId="loginBoxState")]
		public var loginBoxState:String;
		
		[Publish(scope="AppModel", objectId="appStackState")]
		public var appStackState:String;
	}
}