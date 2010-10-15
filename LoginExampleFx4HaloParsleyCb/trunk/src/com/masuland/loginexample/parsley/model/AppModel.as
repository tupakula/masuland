package com.masuland.loginexample.parsley.model
{
	import com.masuland.loginexample.parsley.vo.LayoutVO;
	import com.masuland.loginexample.parsley.vo.LocaleVO;
	import com.masuland.loginexample.parsley.vo.SettingsVO;
	import com.masuland.loginexample.parsley.vo.StyleVO;
	import com.masuland.loginexample.parsley.vo.UserVO;
	
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
		
		public var isApplicationVisible:Boolean;
		
		//---------------
		// States
		//---------------
		
		public var loginBoxState:String;
		public var appStackState:String;
	}
}