package com.masuland.loginexample.spring.model
{
	import com.masuland.loginexample.spring.vo.LayoutVO;
	import com.masuland.loginexample.spring.vo.LocaleVO;
	import com.masuland.loginexample.spring.vo.SettingsVO;
	import com.masuland.loginexample.spring.vo.StyleVO;
	import com.masuland.loginexample.spring.vo.UserVO;
	
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