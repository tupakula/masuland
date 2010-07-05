package com.masuland.loginexample.swiz10.model
{
	import com.masuland.loginexample.swiz10.vo.LayoutVO;
	import com.masuland.loginexample.swiz10.vo.LocaleVO;
	import com.masuland.loginexample.swiz10.vo.SettingsVO;
	import com.masuland.loginexample.swiz10.vo.StyleVO;
	import com.masuland.loginexample.swiz10.vo.UserVO;
	
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
		
		public var currentUser:UserVO;
		
		public var settings:SettingsVO;
		public var currentStyle:StyleVO;
		public var currentLayout:LayoutVO;
		public var currentLocale:LocaleVO;
		
		//---------------
		// Flags
		//---------------
		
		public var isMockData:Boolean = true;
		public var isApplicationVisible:Boolean;
		
		//---------------
		// States
		//---------------
		
		public var loginBoxState:String;
		public var appStackState:String;
	}
}