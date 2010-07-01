package com.masuland.loginexample.parsley222.model
{
	import com.masuland.loginexample.parsley222.vo.LayoutVO;
	import com.masuland.loginexample.parsley222.vo.LocaleVO;
	import com.masuland.loginexample.parsley222.vo.SettingsVO;
	import com.masuland.loginexample.parsley222.vo.StyleVO;
	import com.masuland.loginexample.parsley222.vo.UserVO;
	
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